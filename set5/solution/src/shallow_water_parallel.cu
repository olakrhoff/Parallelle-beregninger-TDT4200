// ---------------------------------------------------------
// TDT4200 Parallel Computing - Graded CUDA
// ---------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>

#include <iostream>
#include <cooperative_groups.h>

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

void __global__ time_step(real_t *mass_0,
                          real_t *mass_1,
                          real_t *mass_velocity_x_0,
                          real_t *mass_velocity_x_1,
                          real_t *mass_velocity_y_0,
                          real_t *mass_velocity_y_1,
                          real_t *mass_velocity,
                          real_t *velocity_x,
                          real_t *velocity_y,
                          real_t *acceleration_x,
                          real_t *acceleration_y,
                          int_t N,
                          real_t dx,
                          real_t dt);

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

void __device__ boundary_condition_advanced(real_t *domain_variable, int sign, int_t N);

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


typedef struct time_step_data
{
    real_t *mass_0;
    real_t *mass_1;
    real_t *mass_velocity_x_0;
    real_t *mass_velocity_x_1;
    real_t *mass_velocity_y_0;
    real_t *mass_velocity_y_1;
    real_t *mass_velocity;
    real_t *velocity_x;
    real_t *velocity_y;
    real_t *acceleration_x;
    real_t *acceleration_y;
    int_t N;
    real_t dx;
    real_t dt;
    
    
    time_step_data(real_t *a_mass_0,
                   real_t *a_mass_1,
                   real_t *a_mass_velocity_x_0,
                   real_t *a_mass_velocity_x_1,
                   real_t *a_mass_velocity_y_0,
                   real_t *a_mass_velocity_y_1,
                   real_t *a_mass_velocity,
                   real_t *a_velocity_x,
                   real_t *a_velocity_y,
                   real_t *a_acceleration_x,
                   real_t *a_acceleration_y,
                   int_t a_N,
                   real_t a_dx,
                   real_t a_dt) :
            mass_0(a_mass_0),
            mass_1(a_mass_1),
            mass_velocity_x_0(a_mass_velocity_x_0),
            mass_velocity_x_1(a_mass_velocity_x_1),
            mass_velocity_y_0(a_mass_velocity_y_0),
            mass_velocity_y_1(a_mass_velocity_y_1),
            mass_velocity(a_mass_velocity),
            velocity_x(a_velocity_x),
            velocity_y(a_velocity_y),
            acceleration_x(a_acceleration_x),
            acceleration_y(a_acceleration_y),
            N(a_N),
            dx(a_dx),
            dt(a_dt)
    {}
    
} time_step_data_t;


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
    
    //Parallel CUDA
    //We want 1024 threads per block (maximum) for a square this is 32x32 = 1024
    //Hence we have 32 threads in x and y dim, in thread block
    dim3 threadBlockDims = {32, 32, 1};
    //We want to divide the 2D space into equal sized squares making a grid.
    //This grid then needs to be N / 32(number of threads in dim in thread block) (rounded up).
    //Therefore, we get ceiling(N / threadBlock.x) and corresponding for y-dim.
    dim3 gridDims = {(uint32_t)((N + 2) / threadBlockDims.x) + (((N + 2) % threadBlockDims.x) != 0),
                     (uint32_t)((N + 2) / threadBlockDims.y) + (((N + 2) % threadBlockDims.y) != 0),
                     1};
    
    //Advanced CUDA
    int THREADS; //Number of threads per block recommended by the hardware
    int BLOCKS; //Number of blocks that can run at once on hardware
    cudaOccupancyMaxPotentialBlockSize(&BLOCKS, &THREADS, time_step, 0, 0);
    std::cout << THREADS << std::endl;
    std::cout << BLOCKS << std::endl;
    
    //Get the biggest square from the number of threads possible per block.
    //Will most likely be 32x32.
    threadBlockDims = {(uint32_t) sqrt(THREADS), (uint32_t) sqrt(THREADS), 1};
    //We only have BLOCKS number og blocks that fit on the device at a time
    //We need to ensure that everything is on the device at the same time
    //for the sync to function, and not deadlock.
    //Therefore, we have the biggest square the that allows the number of
    //BLOCKS we have available. Threads may have to do multiple nodes
    //in the calculation to compensate for the bound number of BLOCKS.
    gridDims = {(uint32_t) sqrt(BLOCKS), (uint32_t) sqrt(BLOCKS), 1};
    
    for (int_t iteration = 0; iteration <= max_iteration; iteration++)
    {
        //From serial code
        /*
        time_step(h_velocity_x, h_velocity_y,
                  h_acceleration_x, h_acceleration_y,
                  h_mass_velocity_x_0, h_mass_velocity_x_1,
                  h_mass_velocity_y_0, h_mass_velocity_y_1,
                  h_mass_velocity, h_mass_0, h_mass_1
        );*/
        
        // TODO: Launch time_step kernels
        //This is the code for the parallel CUDA
        /*
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
        */
        //This is the code for the advanced CUDA
        void *kernel_args[] = {(void *) &d_mass_0,
                               (void *) &d_mass_1,
                               (void *) &d_mass_velocity_x_0,
                               (void *) &d_mass_velocity_x_1,
                               (void *) &d_mass_velocity_y_0,
                               (void *) &d_mass_velocity_y_1,
                               (void *) &d_mass_velocity,
                               (void *) &d_velocity_x,
                               (void *) &d_velocity_y,
                               (void *) &d_acceleration_x,
                               (void *) &d_acceleration_y,
                               (void *) &N,
                               (void *) &dx,
                               (void *) &dt};
        
        cudaLaunchCooperativeKernel((void *) time_step, gridDims, threadBlockDims, kernel_args);
        
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
            /* These are not needed, we only use mass_0 to write to file
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
             */
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

//Old serial time step
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

//Advanced CUDA time step
void __global__ time_step(real_t *mass_0,
                          real_t *mass_1,
                          real_t *mass_velocity_x_0,
                          real_t *mass_velocity_x_1,
                          real_t *mass_velocity_y_0,
                          real_t *mass_velocity_y_1,
                          real_t *mass_velocity,
                          real_t *velocity_x,
                          real_t *velocity_y,
                          real_t *acceleration_x,
                          real_t *acceleration_y,
                          int_t N,
                          real_t dx,
                          real_t dt)
{
    cooperative_groups::grid_group grid = cooperative_groups::this_grid();
    
    int global_index_x = threadIdx.x + blockIdx.x * blockDim.x;
    int global_index_y = threadIdx.y + blockIdx.y * blockDim.y;
    
    int x_dim_stride = gridDim.x * blockDim.x;
    int y_dim_stride = gridDim.y * blockDim.y;
    
    boundary_condition_advanced(mass_0, 1, N);
    boundary_condition_advanced(mass_velocity_x_0, -1, N);
    boundary_condition_advanced(mass_velocity_y_0, -1, N);
    
    for (int_t y = global_index_y; y <= N; y += y_dim_stride)
        for (int_t x = global_index_x; x <= N; x += x_dim_stride)
        {
            if (x == 0 || y == 0)
                continue;
            U(y, x) = PNU(y, x) / PN(y, x);
            V(y, x) = PNV(y, x) / PN(y, x);
        }
    
    for (int_t y = global_index_y; y <= N; y += y_dim_stride)
        for (int_t x = global_index_x; x <= N; x += x_dim_stride)
        {
            if (x == 0 || y == 0)
                continue;
            PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
        }
    
    for (int_t y = global_index_y; y <= N + 1; y += y_dim_stride)
        for (int_t x = global_index_x; x <= N + 1; x += x_dim_stride)
        {
            DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
                       + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
            DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
                       + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
        }
    
    grid.sync();
    
    for (int_t y = global_index_y; y <= N; y += y_dim_stride)
        for (int_t x = global_index_x; x <= N; x += x_dim_stride)
        {
            if (x == 0 || y == 0)
                continue;
            PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
                    (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
                    + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
            );
        }
    
    for (int_t y = global_index_y; y <= N; y += y_dim_stride)
        for (int_t x = global_index_x; x <= N; x += x_dim_stride)
        {
            if (x == 0 || y == 0)
                continue;
            PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
                    (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
                    + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
            );
        }
    
    for (int_t y = global_index_y; y <= N; y += y_dim_stride)
        for (int_t x = global_index_x; x <= N; x += x_dim_stride)
        {
            if (x == 0 || y == 0)
                continue;
            PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
                    (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
                    + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
            );
        }
}

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
    PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) -
                     dt * ((DU(y, x + 1) - DU(y, x - 1)) / (2 * dx) + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx));
    /*}*/
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) -
                     dt * ((DV(y + 1, x) - DV(y - 1, x)) / (2 * dx) + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx));
    /*}*/
    /*
    for (int_t y = 1; y <= N; y++)
        for (int_t x = 1; x <= N; x++)
        {*/
    PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) -
                    dt * ((PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx) + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx));
    /*}*/
}

//Parallel CUDA code
// TODO: Rewrite boundary_condition as a device function.
void __device__ boundary_condition(real_t *domain_variable, int sign, int_t N, int_t x_idx, int_t y_idx)
{
#define VAR(y, x) domain_variable[(y)*(N+2)+(x)]
    //The corners can't be run in parallel, so it does not
    //matter if we check them with if-statements, all other
    //threads will either stall or do the same operation.
    //Nonetheless, it will take 4 cycles (of writing data).
    //if (x_idx == 0 && y_idx == 0)
    VAR(0, 0) = sign * VAR(2, 2);
    //if (x_idx == 0 && y_idx == N + 1)
    VAR(N + 1, 0) = sign * VAR(N - 1, 2);
    //if (x_idx == N - 1 && y_idx == 0)
    VAR(0, N + 1) = sign * VAR(2, N - 1);
    //if (x_idx == N - 1 && y_idx == N + 1)
    VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
    
    //Each of the boundary sides will be executed in parallel.
    //E.g. every thread with x-index equal 0 will calculate the
    //value for the boundary at side along x = 0, at the y-index
    //the thread has.
    //
    //This is a good speedup since before every thread calculated these values,
    //So it would take N * 4 (sides) cycles to compute, now it takes on side
    //in parallel in one cycle, meaning it in total takes 4 cycles. So it now
    //takes the same amount of time as the corner cases.
    if (x_idx == 0)
        //for (int_t y = 1; y <= N; y++)
        VAR(y_idx, 0) = sign * VAR(y_idx, 2);
    if (x_idx == N + 1)
        //for (int_t y = 1; y <= N; y++)
        VAR(y_idx, N + 1) = sign * VAR(y_idx, N - 1);
    if (y_idx == 0)
        //for (int_t x = 1; x <= N; x++)
        VAR(0, x_idx) = sign * VAR(2, x_idx);
    if (y_idx == N + 1)
        //for (int_t x = 1; x <= N; x++)
        VAR(N + 1, x_idx) = sign * VAR(N - 1, x_idx);

#undef VAR
}

//Advanced CUDA code
void __device__ boundary_condition_advanced(real_t *domain_variable, int sign, int_t N)
{
    //Get the global index values in x- and y-dim.
    int x_idx = threadIdx.x + blockIdx.x * blockDim.x;
    int y_idx = threadIdx.y + blockIdx.y * blockDim.y;
    
    //Find the potential striding length in both dims.
    //We want these values since the boundary will be handled
    //by a single call and therefore needs to include the
    //striding that potentially will be needed, we have too few
    //blocks for our work.
    int x_dim_stride = gridDim.x * blockDim.x;
    int y_dim_stride = gridDim.y * blockDim.y;
    
#define VAR(y, x) domain_variable[(y)*(N+2)+(x)]
    //The corners can't be run in parallel, so it does not
    //matter if we check them with if-statements, all other
    //threads will either stall or do the same operation.
    //Nonetheless, it will take 4 cycles (of writing data).
    if (x_idx == 0 && y_idx == 0)
        VAR(0, 0) = sign * VAR(2, 2);
    if (x_idx == 0 && y_idx == y_dim_stride - 1)
        VAR(N + 1, 0) = sign * VAR(N - 1, 2);
    if (x_idx == x_dim_stride - 1 && y_idx == 0)
        VAR(0, N + 1) = sign * VAR(2, N - 1);
    if (x_idx == x_dim_stride - 1 && y_idx == y_dim_stride - 1)
        VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
    
    
    
    //  Under follows an example illustration of how the
    //  boundary conditions are set by the different threads.
    //
    //  X-dim is horizontal
    //  Y-dim is vertical
    //  Cell ((x, y)) (0,0) is in the lower left.
    //  The x's mark a 4x4 grid of blocks that we
    //  can run on the card simultaneously.
    //  The 8x8 grid is the data we want to
    //  operate on.
    //
    //  The x's that are along the border (left and down)
    //  will be responsible for calculating the boundary for
    //  the boundary at their location.
    //
    //  However, we need to do the rest of the left and bottom sides.
    //  Also, the entire right and top side. The thread at (1,0) will be
    //  responsible for (1 + x_stride, 0) = (5,0). The same thing happens
    //  For the left side in the y-dim.
    //
    //  Lastly the top side of the 4x4 will be responsible for the top side
    //  of the 8x8. This by doing as the bottom, just offsetting to the top cells.
    //  +--+--+--+--+--+--+--+--+
    //  |  |  |  |  |  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  |  |  |  |  |  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  |  |  |  |  |  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  |  |  |  |  |  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  | x| x| x| x|  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  | x| x| x| x|  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  | x| x| x| x|  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //  | x| x| x| x|  |  |  |  |
    //  +--+--+--+--+--+--+--+--+
    //
    //  This table shows the thread index that is responsible for each boundary in the grid.
    //  +--+--+--+--+--+--+--+--+
    //  |12|13|14|15|12|13|14|15|
    //  +--+--+--+--+--+--+--+--+
    //  | 8|  |  |  |  |  |  |11|
    //  +--+--+--+--+--+--+--+--+
    //  | 4|  |  |  |  |  |  | 7|
    //  +--+--+--+--+--+--+--+--+
    //  | 0|  |  |  |  |  |  | 3|
    //  +--+--+--+--+--+--+--+--+
    //  |12|13|14|15|  |  |  |15|
    //  +--+--+--+--+--+--+--+--+
    //  | 8| 9|10|11|  |  |  |11|
    //  +--+--+--+--+--+--+--+--+
    //  | 4| 5| 6| 7|  |  |  | 7|
    //  +--+--+--+--+--+--+--+--+
    //  | 0| 1| 2| 3| 0| 1| 2| 3|
    //  +--+--+--+--+--+--+--+--+
    
    if (x_idx == 0) //At edge of thread grid, left
        for (int_t y = y_idx; y <= N; y += y_dim_stride)
            if (y != 0) //We don't want to overwrite the corner value with an incorrect value
                VAR(y, 0) = sign * VAR(y, 2);
    if (x_idx == x_dim_stride - 1) //At edge of thread grid, right
        for (int_t y = y_idx; y <= N; y += y_dim_stride)
            if (y != 0) //We don't want to overwrite the corner value with an incorrect value
                VAR(y, N + 1) = sign * VAR(y, N - 1);
    if (y_idx == 0) //At edge of thread grid, bottom
        for (int_t x = x_idx; x <= N; x += x_dim_stride)
            if (x != 0) //We don't want to overwrite the corner value with an incorrect value
                VAR(0, x) = sign * VAR(2, x);
    if (y_idx == y_dim_stride - 1) //At edge of thread grid, top
        for (int_t x = x_idx; x <= N; x++)
            if (x != 0) //We don't want to overwrite the corner value with an incorrect value
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
