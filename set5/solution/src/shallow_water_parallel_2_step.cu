// ---------------------------------------------------------
// TDT4200 Parallel Computing - Graded CUDA
// ---------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>

#include "../inc/argument_utils.h"


typedef int64_t int_t;
typedef double real_t;

int_t
        N,
        max_iteration,
        snapshot_frequency;

const real_t
        domain_size = 10.0,
        gravity = 9.81,
        density = 997.0;

real_t
        *h_mass_0 = NULL,
        *h_mass_1 = NULL,
        *d_mass_0 = NULL,
        *d_mass_1 = NULL,
        
        *h_mass_velocity_x_0 = NULL,
        *h_mass_velocity_x_1 = NULL,
        *d_mass_velocity_x_0 = NULL,
        *d_mass_velocity_x_1 = NULL,
        
        *h_mass_velocity_y_0 = NULL,
        *h_mass_velocity_y_1 = NULL,
        *d_mass_velocity_y_0 = NULL,
        *d_mass_velocity_y_1 = NULL,
        
        *h_mass_velocity = NULL,
        *d_mass_velocity = NULL,
        
        *h_velocity_x = NULL,
        *d_velocity_x = NULL,
        *h_velocity_y = NULL,
        *d_velocity_y = NULL,
        
        *h_acceleration_x = NULL,
        *d_acceleration_x = NULL,
        *h_acceleration_y = NULL,
        *d_acceleration_y = NULL,
        dx,
        dt;

#define PN(y, x)         mass_0[(y)*(N+2)+(x)]
#define PN_next(y, x)    mass_1[(y)*(N+2)+(x)]
#define PNU(y, x)        mass_velocity_x_0[(y)*(N+2)+(x)]
#define PNU_next(y, x)   mass_velocity_x_1[(y)*(N+2)+(x)]
#define PNV(y, x)        mass_velocity_y_0[(y)*(N+2)+(x)]
#define PNV_next(y, x)   mass_velocity_y_1[(y)*(N+2)+(x)]
#define PNUV(y, x)       mass_velocity[(y)*(N+2)+(x)]
#define U(y, x)          velocity_x[(y)*(N+2)+(x)]
#define V(y, x)          velocity_y[(y)*(N+2)+(x)]
#define DU(y, x)         acceleration_x[(y)*(N+2)+(x)]
#define DV(y, x)         acceleration_y[(y)*(N+2)+(x)]


#define cudaErrorCheck(ans) { gpuAssert((ans), __FILE__, __LINE__); }

inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort = true)
{
    if (code != cudaSuccess)
    {
        fprintf(stderr, "GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
        if (abort) exit(code);
    }
}

/*
void time_step(real_t *velocity_x, real_t *velocity_y,
               real_t *acceleration_x, real_t *acceleration_y,
               real_t *mass_velocity_x_0, real_t *mass_velocity_x_1,
               real_t *mass_velocity_y_0, real_t *mass_velocity_y_1,
               real_t *mass_velocity, real_t *mass_0, real_t *mass_1
);*/

void __global__ time_step_1(real_t *mass_0,
                            real_t *mass_velocity_x_0,
                            real_t *mass_velocity_y_0,
                            real_t *mass_velocity,
                            real_t *velocity_x,
                            real_t *velocity_y,
                            real_t *acceleration_x,
                            real_t *acceleration_y,
                            int_t N);

void __global__ time_step_2(real_t *mass_0,
                            real_t *mass_1,
                            real_t *mass_velocity_x_0,
                            real_t *mass_velocity_x_1,
                            real_t *mass_velocity_y_0,
                            real_t *mass_velocity_y_1,
                            real_t *mass_velocity,
                            real_t *acceleration_x,
                            real_t *acceleration_y,
                            int_t N,
                            real_t dx,
                            real_t dt);

// TODO: Rewrite boundary_condition as a device function.
void __device__ boundary_condition(real_t *domain_variable, int sign, int_t N, int_t x_idx, int_t y_idx);

void domain_init(void);

void domain_save(int_t iteration);

void domain_finalize(void);

// Pthreads threaded domain save function
void *domain_save_threaded(void *iter);

void swap(real_t **t1, real_t **t2)
{
    real_t *tmp;
    tmp = *t1;
    *t1 = *t2;
    *t2 = tmp;
}


int main(int argc, char **argv)
{
    
    OPTIONS *options = parse_args(argc, argv);
    if (!options)
    {
        fprintf(stderr, "Argument parsing failed\n");
        exit(1);
    }
    
    N = options->N;
    max_iteration = options->max_iteration;
    snapshot_frequency = options->snapshot_frequency;
    
    domain_init();
    
    //We want 1024 threads per block (maximum) for a square this is 32x32 = 1024
    //Hence we have 32 threads in x and y dim, in thread block
    dim3 threadBlockDims = {32, 32, 1};
    //We want to divide the 2D space into equal sized squares making a grid.
    //This grid then needs to be N / 32(number of threads in dim in thread block) (rounded up).
    //Therefore, we get ceiling(N / threadBlock.x) and corresponding for y-dim.
    dim3 gridDims = {(uint32_t)((N + 2) / threadBlockDims.x) + (((N + 2) % threadBlockDims.x) != 0),
                     (uint32_t)((N + 2) / threadBlockDims.y) + (((N + 2) % threadBlockDims.y) != 0),
                     1};
    
    for (int_t iteration = 0; iteration <= max_iteration; iteration++)
    {
        /*
        time_step(h_velocity_x, h_velocity_y,
                  h_acceleration_x, h_acceleration_y,
                  h_mass_velocity_x_0, h_mass_velocity_x_1,
                  h_mass_velocity_y_0, h_mass_velocity_y_1,
                  h_mass_velocity, h_mass_0, h_mass_1
        );*/
        
        // TODO: Launch time_step kernels
        time_step_1<<<gridDims, threadBlockDims>>>(d_mass_0,
                              d_mass_velocity_x_0,
                              d_mass_velocity_y_0,
                              d_mass_velocity,
                              d_velocity_x,
                              d_velocity_y,
                              d_acceleration_x,
                              d_acceleration_y,
                              N);
        
        cudaDeviceSynchronize();
        time_step_2<<<gridDims, threadBlockDims>>>(d_mass_0,
                              d_mass_1,
                              d_mass_velocity_x_0,
                              d_mass_velocity_x_1,
                              d_mass_velocity_y_0,
                              d_mass_velocity_y_1,
                              d_mass_velocity,
                              d_acceleration_x,
                              d_acceleration_y,
                              N,
                              dx,
                              dt);
        
        if (iteration % snapshot_frequency == 0)
        {
            printf(
                    "Iteration %ld of %ld, (%.2lf%% complete)\n",
                    iteration,
                    max_iteration,
                    100.0 * (real_t) iteration / (real_t) max_iteration
            );
            
            
            // TODO: Copy the masses from the device to host prior to domain_save
            //Transfer the device-side data to the host
            //****************** CUDA ******************
            int elements = (N + 2) * (N + 2);
            
            cudaMemcpy(h_mass_0, d_mass_0, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_mass_1, d_mass_1, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            
            cudaMemcpy(h_mass_velocity_x_0, d_mass_velocity_x_0, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_mass_velocity_x_1, d_mass_velocity_x_1, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_mass_velocity_y_0, d_mass_velocity_y_0, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_mass_velocity_y_1, d_mass_velocity_y_1, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            
            cudaMemcpy(h_mass_velocity, d_mass_velocity, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            
            cudaMemcpy(h_velocity_x, d_velocity_x, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_velocity_y, d_velocity_y, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_acceleration_x, d_acceleration_x, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_acceleration_y, d_acceleration_y, elements * sizeof(real_t), cudaMemcpyDeviceToHost);
            //****************** CUDA ******************
            
            domain_save(iteration);
        }
        
        // TODO: Swap device buffer pointers between iterations
        swap(&d_mass_0, &d_mass_1);
        swap(&d_mass_velocity_x_0, &d_mass_velocity_x_1);
        swap(&d_mass_velocity_y_0, &d_mass_velocity_y_1);
        
        swap(&h_mass_0, &h_mass_1);
        swap(&h_mass_velocity_x_0, &h_mass_velocity_x_1);
        swap(&h_mass_velocity_y_0, &h_mass_velocity_y_1);
    }
    
    domain_finalize();
    
    exit(EXIT_SUCCESS);
}


// TODO: Rewrite this function as one or more CUDA kernels
// ---------------------------------------------------------
// To ensure correct results, the participating threads in the thread
// grid must be synchronized after calculating the accelerations (DU, DV).
// If the grid is not synchronized, data dependencies cannot be guaranteed.
/*
void time_step(real_t *velocity_x, real_t *velocity_y,
               real_t *acceleration_x, real_t *acceleration_y,
               real_t *mass_velocity_x_0, real_t *mass_velocity_x_1,
               real_t *mass_velocity_y_0, real_t *mass_velocity_y_1,
               real_t *mass_velocity, real_t *mass_0, real_t *mass_1)
{
    boundary_condition(mass_0, 1);
    boundary_condition(mass_velocity_x_0, -1);
    boundary_condition(mass_velocity_y_0, -1);
    
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {
            U(y, x) = PNU(y, x) / PN(y, x);
            V(y, x) = PNV(y, x) / PN(y, x);
        }
    
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {
            PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
        }
    
    for (int_t y = 0; y <= N + 1; y++)
        for (int_t x = 0; x <= N + 1; x++)
        {
            DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
                       + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
            DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
                       + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
        }
    
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {
            PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
                    (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
                    + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
            );
        }
    
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {
            PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
                    (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
                    + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
            );
        }
    
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {
            PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
                    (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
                    + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
            );
        }
}*/

void __global__ time_step_1(real_t *mass_0,
                            real_t *mass_velocity_x_0,
                            real_t *mass_velocity_y_0,
                            real_t *mass_velocity,
                            real_t *velocity_x,
                            real_t *velocity_y,
                            real_t *acceleration_x,
                            real_t *acceleration_y,
                            int_t N)
{
    int global_index_x = threadIdx.x + blockIdx.x * blockDim.x;
    int global_index_y = threadIdx.y + blockIdx.y * blockDim.y;
    if (global_index_x >= N + 2 || global_index_y >= N + 2)
        return;
    
    
    int_t y = global_index_y;
    int_t x = global_index_x;
    
    boundary_condition(mass_0, 1, N, x, y);
    boundary_condition(mass_velocity_x_0, -1, N, x, y);
    boundary_condition(mass_velocity_y_0, -1, N, x, y);
    
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    U(y, x) = PNU(y, x) / PN(y, x);
    V(y, x) = PNV(y, x) / PN(y, x);
    /*}*/
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
    /*}*/
    /*
    for (int_t y = 0; y <= N + 1; y++)
        for (int_t x = 0; x <= N + 1; x++)
        {*/
    DU(y, x) = PN(y, x) * U(y, x) * U(y, x) + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
    DV(y, x) = PN(y, x) * V(y, x) * V(y, x) + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
    /*}*/
}

void __global__ time_step_2(real_t *mass_0,
                            real_t *mass_1,
                            real_t *mass_velocity_x_0,
                            real_t *mass_velocity_x_1,
                            real_t *mass_velocity_y_0,
                            real_t *mass_velocity_y_1,
                            real_t *mass_velocity,
                            real_t *acceleration_x,
                            real_t *acceleration_y,
                            int_t N,
                            real_t dx,
                            real_t dt)
{
    int global_index_x = threadIdx.x + blockIdx.x * blockDim.x;
    int global_index_y = threadIdx.y + blockIdx.y * blockDim.y;
    if (global_index_x >= N + 2 || global_index_y >= N + 2)
        return;
    
    
    int_t y = global_index_y;
    int_t x = global_index_x;
    
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * ((DU(y, x + 1) - DU(y, x - 1)) / (2 * dx) + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx));
    /*}*/
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * ((DV(y + 1, x) - DV(y - 1, x)) / (2 * dx) + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx));
    /*}*/
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * ((PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx) + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx));
    /*}*/
}

// TODO: Rewrite boundary_condition as a device function.
void __device__ boundary_condition(real_t *domain_variable, int sign, int_t N, int_t x_idx, int_t y_idx)
{
#define VAR(y, x) domain_variable[(y)*(N+2)+(x)]
    //if (x_idx == 0 && y_idx == 0)
        VAR(0, 0) = sign * VAR(2, 2);
    //if (x_idx == 0 && y_idx == N - 1)
        VAR(N + 1, 0) = sign * VAR(N - 1, 2);
    //if (x_idx == N - 1 && y_idx == 0)
        VAR(0, N + 1) = sign * VAR(2, N - 1);
    //if (x_idx == N - 1 && y_idx == N - 1)
        VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
    
    //if (x_idx == 0)
        for (int_t y = 1; y <= N; y++)
                VAR(y, 0) = sign * VAR(y, 2);
    //if (x_idx == N - 1)
        for (int_t y = 1; y <= N; y++)
            VAR(y, N + 1) = sign * VAR(y, N - 1);
    //if (y_idx == 0)
        for (int_t x = 1; x <= N; x++)
            VAR(0, x) = sign * VAR(2, x);
    //if (y_idx == N - 1)
        for (int_t x = 1; x <= N; x++)
            VAR(N + 1, x) = sign * VAR(N - 1, x);
        
#undef VAR
}


void domain_init(void)
{
    int elements = (N + 2) * (N + 2);
    
    // TODO: Allocate device buffers for masses, velocities and accelerations.
    cudaMalloc(&d_mass_0, elements * sizeof(real_t));
    cudaMalloc(&d_mass_1, elements * sizeof(real_t));
    
    cudaMalloc(&d_mass_velocity_x_0, elements * sizeof(real_t));
    cudaMalloc(&d_mass_velocity_x_1, elements * sizeof(real_t));
    cudaMalloc(&d_mass_velocity_y_0, elements * sizeof(real_t));
    cudaMalloc(&d_mass_velocity_y_1, elements * sizeof(real_t));
    
    cudaMalloc(&d_mass_velocity, elements * sizeof(real_t));
    
    cudaMalloc(&d_velocity_x, elements * sizeof(real_t));
    cudaMalloc(&d_velocity_y, elements * sizeof(real_t));
    cudaMalloc(&d_acceleration_x, elements * sizeof(real_t));
    cudaMalloc(&d_acceleration_y, elements * sizeof(real_t));
    // -----------------------------------------------------
    h_mass_0 = (real_t *) calloc(elements, sizeof(real_t));
    h_mass_1 = (real_t *) calloc(elements, sizeof(real_t));
    
    h_mass_velocity_x_0 = (real_t *) calloc(elements, sizeof(real_t));
    h_mass_velocity_x_1 = (real_t *) calloc(elements, sizeof(real_t));
    h_mass_velocity_y_0 = (real_t *) calloc(elements, sizeof(real_t));
    h_mass_velocity_y_1 = (real_t *) calloc(elements, sizeof(real_t));
    
    h_mass_velocity = (real_t *) calloc(elements, sizeof(real_t));
    
    h_velocity_x = (real_t *) calloc(elements, sizeof(real_t));
    h_velocity_y = (real_t *) calloc(elements, sizeof(real_t));
    h_acceleration_x = (real_t *) calloc(elements, sizeof(real_t));
    h_acceleration_y = (real_t *) calloc(elements, sizeof(real_t));
    
    for (int_t y = 1; y <= N; y++)
    {
        for (int_t x = 1; x <= N; x++)
        {
            h_mass_0[y * (N + 2) + x] = 1e-3;
            h_mass_velocity_x_0[y * (N + 2) + x] = 0.0;
            h_mass_velocity_y_0[y * (N + 2) + x] = 0.0;
            
            real_t cx = x - N / 2;
            real_t cy = y - N / 2;
            if (sqrt(cx * cx + cy * cy) < N / 20.0)
            {
                h_mass_0[y * (N + 2) + x] -= 5e-4 * exp(
                        -4 * pow(cx, 2.0) / (real_t) (N)
                        - 4 * pow(cy, 2.0) / (real_t) (N)
                );
            }
            
            h_mass_0[y * (N + 2) + x] *= density;
        }
    }
    
    dx = domain_size / (real_t) N;
    dt = 5e-2;
    
    //Transfer the host-side data to the device
    //****************** CUDA ******************
    cudaMemcpy(d_mass_0, h_mass_0, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mass_1, h_mass_1, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    
    cudaMemcpy(d_mass_velocity_x_0, h_mass_velocity_x_0, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mass_velocity_x_1, h_mass_velocity_x_1, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mass_velocity_y_0, h_mass_velocity_y_0, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mass_velocity_y_1, h_mass_velocity_y_1, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    
    cudaMemcpy(d_mass_velocity, h_mass_velocity, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    
    cudaMemcpy(d_velocity_x, h_velocity_x, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_velocity_y, h_velocity_y, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_acceleration_x, h_acceleration_x, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_acceleration_y, h_acceleration_y, elements * sizeof(real_t), cudaMemcpyHostToDevice);
    //****************** CUDA ******************
}


void domain_save(int_t iteration)
{
    int_t index = iteration / snapshot_frequency;
    char filename[256];
    memset(filename, 0, 256 * sizeof(char));
    sprintf(filename, "data/%.5ld.bin", index);
    
    FILE *out = fopen(filename, "wb");
    if (!out)
    {
        fprintf(stderr, "Failed to open file %s\n", filename);
        exit(1);
    }
    //fwrite ( mass[0], (N+2)*(N+2), sizeof(real_t), out );
    for (int_t y = 1; y <= N; y++)
    {
        fwrite(&h_mass_0[y * (N + 2) + 1], N, sizeof(real_t), out);
    }
    fclose(out);
}

void domain_finalize(void)
{
    free(h_mass_0);
    free(h_mass_1);
    free(h_mass_velocity_x_0);
    free(h_mass_velocity_x_1);
    free(h_mass_velocity_y_0);
    free(h_mass_velocity_y_1);
    free(h_mass_velocity);
    free(h_velocity_x);
    free(h_velocity_y);
    free(h_acceleration_x);
    free(h_acceleration_y);
    
    // TODO: Free device arrays
    cudaFree(d_mass_0);
    cudaFree(d_mass_1);
    cudaFree(d_mass_velocity_x_0);
    cudaFree(d_mass_velocity_x_1);
    cudaFree(d_mass_velocity_y_0);
    cudaFree(d_mass_velocity_y_1);
    cudaFree(d_mass_velocity);
    cudaFree(d_velocity_x);
    cudaFree(d_velocity_y);
    cudaFree(d_acceleration_x);
    cudaFree(d_acceleration_y);
}
