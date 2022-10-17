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

// TODO #1.1: Declare device pointers
real_t
//*h_mass[2] = { NULL, NULL },
*h_mass_0 = NULL,
        *h_mass_1 = NULL,
//*h_mass_velocity_x[2] = { NULL, NULL },
*h_mass_velocity_x_0 = NULL,
        *h_mass_velocity_x_1 = NULL,
        *h_velocity_x = NULL,
        *h_acceleration_x = NULL,
        dx,
        dt;

real_t
        *d_mass_0 = NULL,
        *d_mass_1 = NULL,
        *d_mass_velocity_x_0 = NULL,
        *d_mass_velocity_x_1 = NULL,
        *d_velocity_x = NULL,
        *d_acceleration_x = NULL;


#define PN(x)        mass_0[(x)]
#define PN_next(x)   mass_1[(x)]
#define PNU(x)       mass_velocity_x_0[(x)]
#define PNU_next(x)  mass_velocity_x_1[(x)]
#define U(x)         velocity_x[(x)]
#define DU(x)        acceleration_x[(x)]

#define cudaErrorCheck(ans) { gpuAssert((ans), __FILE__, __LINE__); }

inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort = true)
{
    if (code != cudaSuccess)
    {
        fprintf(stderr, "GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
        if (abort) exit(code);
    }
}

__global__ void time_step_1(real_t *acceleration_x, real_t *mass_0, real_t *velocity_x, int_t N);

__global__ void time_step_2(real_t *mass_velocity_x_0, real_t *mass_velocity_x_1, real_t *acceleration_x, real_t *mass_0,
            real_t *mass_1, real_t *velocity_x, real_t dx, real_t dt, int_t N);

__device__ void boundary_condition(real_t *domain_variable, int sign);

void domain_init(void);

void domain_save(int_t iteration);

void domain_finalize(void);


void swap(real_t **m1, real_t **m2)
{
    real_t *tmp;
    tmp = *m1;
    *m1 = *m2;
    *m2 = tmp;
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
    
    // TODO #2.4: Define the thread block size and calculate the corresponding grid size.
    
    dim3 threadBlockDims = {1024, 1, 1};
    dim3 gridDims = {N / 1024 + ((N % 1024) != 0), 1, 1};
    
    for (int_t iteration = 0; iteration <= max_iteration; iteration++)
    {
        // TODO #1.5: Move the boundary_condition calls to inside the time_step_1 kernel
        //boundary_condition(h_mass_0, 1);
        //boundary_condition(h_mass_velocity_x_0, -1);
        
        // TODO #1.6: Change the function calls to invoke the kernels with the arguments to the device-side equivalents
        time_step_1<<<gridDims, threadBlockDims>>>(d_acceleration_x, d_mass_0, d_velocity_x, N);
        time_step_2<<<gridDims, threadBlockDims>>>(d_mass_velocity_x_0, d_mass_velocity_x_1, d_acceleration_x, d_mass_0,
                                                   d_mass_1, d_velocity_x, dx, dt, N);
        
        if (iteration % snapshot_frequency == 0)
        {
            printf(
                    "Iteration %ld of %ld (%.2lf%% complete)\n",
                    iteration,
                    max_iteration,
                    100.0 * (real_t) iteration / (real_t) max_iteration
            );
            
            // TODO #1.8: Copy the results back from the GPU into the host-side buffers.
    
            //****************** CUDA ******************
    
            cudaMemcpy(h_mass_0, d_mass_0, (N + 2) * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_mass_1, d_mass_1, (N + 2) * sizeof(real_t), cudaMemcpyDeviceToHost);
    
            cudaMemcpy(h_mass_velocity_x_0, d_mass_velocity_x_0, (N + 2) * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_mass_velocity_x_1, d_mass_velocity_x_1, (N + 2) * sizeof(real_t), cudaMemcpyDeviceToHost);
    
            cudaMemcpy(h_velocity_x, d_velocity_x, (N + 2) * sizeof(real_t), cudaMemcpyDeviceToHost);
            cudaMemcpy(h_acceleration_x, d_acceleration_x, (N + 2) * sizeof(real_t), cudaMemcpyDeviceToHost);
    
            //****************** CUDA ******************
            
            domain_save(iteration);
        }
        
        // TODO #1.7: Swap device pointers
        swap(&h_mass_0, &h_mass_1);
        swap(&h_mass_velocity_x_0, &h_mass_velocity_x_1);
    
        swap(&d_mass_0, &d_mass_1);
        swap(&d_mass_velocity_x_0, &d_mass_velocity_x_1);
    }
    
    domain_finalize();
    
    exit(EXIT_SUCCESS);
}

// TODO #1.5: Change the host-side function to be a device-side function
__device__ void boundary_condition(real_t *domain_variable, int sign, int_t N, bool last)
{
#define VAR(x) domain_variable[(x)]
    //if (!last)
        VAR(0) = sign * VAR(2);
    //else
        VAR(N + 1) = sign * VAR(N - 1);
#undef VAR
}

// TODO #1.4: Change the function to be a CUDA kernel
__global__ void time_step_1(real_t *acceleration_x, real_t *mass_0, real_t *velocity_x, int_t N)
{
    
    // TODO #2.1: Define the global index
    int global_index = threadIdx.x + blockIdx.x * blockDim.x;
    if (global_index >= N)
        return;
    
    // TODO #2.3: Restrict the boundary_condition updates to only be performed by the first and last thread
    if (global_index == 0 || global_index == N - 1)
        boundary_condition(mass_0, 1, N, global_index);
    
    if (global_index == 0)
        DU(global_index) = PN(global_index) * U(global_index) * U(global_index)
                           + 0.5 * gravity * PN(global_index) * PN(global_index) / density;
    else if (global_index == N - 1)
        DU(global_index + 2) = PN(global_index + 2) * U(global_index + 2) * U(global_index + 2)
                           + 0.5 * gravity * PN(global_index + 2) * PN(global_index + 2) / density;
    /*
    for (int_t x = 0; x <= N + 1; x++)
    {*/
    int_t x = global_index + 1; //This takes care of 1 -> N
        DU(x) = PN(x) * U(x) * U(x)
                + 0.5 * gravity * PN(x) * PN(x) / density;
    /*}*/
}

// TODO #1.4: Change the function to be a CUDA kernel
__global__ void
time_step_2(real_t *mass_velocity_x_0, real_t *mass_velocity_x_1, real_t *acceleration_x, real_t *mass_0,
            real_t *mass_1, real_t *velocity_x, real_t dx, real_t dt, int_t N)
{
    
    // TODO #2.1: Define the global index
    int global_index = threadIdx.x + blockIdx.x * blockDim.x;
    if (global_index >= N)
        return;
    
    if (global_index == 0 || global_index == N - 1)
        boundary_condition(mass_0, 1, N, global_index);
    
    /*
    for (int_t x = 1; x <= N; x++)
    {*/
    int_t x = global_index + 1;
        PNU_next(x) = 0.5 * (PNU(x + 1) + PNU(x - 1)) - dt * (
                (DU(x + 1) - DU(x - 1)) / (2 * dx)
        );
    /*}*/
    /*
    for (int_t x = 1; x <= N; x++)
    {*/
        PN_next(x) = 0.5 * (PN(x + 1) + PN(x - 1)) - dt * (
                (PNU(x + 1) - PNU(x - 1)) / (2 * dx)
        );
    /*}*/
    /*
    for (int_t x = 1; x <= N; x++)
    {*/
        U(x) = PNU_next(x) / PN_next(x);
    /*}*/
}


void domain_init(void)
{
    // TODO #1.2: Allocate space for the device-side buffers.
    
    h_mass_0 = (real_t *) calloc((N + 2), sizeof(real_t));
    h_mass_1 = (real_t *) calloc((N + 2), sizeof(real_t));
    
    h_mass_velocity_x_0 = (real_t *) calloc((N + 2), sizeof(real_t));
    h_mass_velocity_x_1 = (real_t *) calloc((N + 2), sizeof(real_t));
    
    h_velocity_x = (real_t *) calloc((N + 2), sizeof(real_t));
    h_acceleration_x = (real_t *) calloc((N + 2), sizeof(real_t));
    
    //****************** CUDA ******************
    
    cudaMalloc(&d_mass_0, (N + 2) * sizeof(real_t));
    cudaMalloc(&d_mass_1, (N + 2) * sizeof(real_t));
    
    cudaMalloc(&d_mass_velocity_x_0, (N + 2) * sizeof(real_t));
    cudaMalloc(&d_mass_velocity_x_1, (N + 2) * sizeof(real_t));
    
    cudaMalloc(&d_velocity_x, (N + 2) * sizeof(real_t));
    cudaMalloc(&d_acceleration_x, (N + 2) * sizeof(real_t));
    
    //****************** CUDA ******************
    
    
    // Data initialization
    for (int_t x = 1; x <= N; x++)
    {
        h_mass_0[(x)] = 1e-3;
        h_mass_velocity_x_0[(x)] = 0.0;
        
        real_t c = x - (double) N / 2;
        if (sqrt(c * c) < N / 20.0)
        {
            h_mass_0[(x)] -= 5e-4 * exp(-4 * pow(c, 2.0) / (real_t) (N));
        }
        
        h_mass_0[(x)] *= density;
    }
    
    dx = domain_size / (real_t) N;
    dt = 0.1 * dx;
    
    // TODO #1.3: Transfer the host-side data to the device.
    
    //****************** CUDA ******************
    
    cudaMemcpy(d_mass_0, h_mass_0, (N + 2) * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mass_1, h_mass_1, (N + 2) * sizeof(real_t), cudaMemcpyHostToDevice);
    
    cudaMemcpy(d_mass_velocity_x_0, h_mass_velocity_x_0, (N + 2) * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mass_velocity_x_1, h_mass_velocity_x_1, (N + 2) * sizeof(real_t), cudaMemcpyHostToDevice);
    
    cudaMemcpy(d_velocity_x, h_velocity_x, (N + 2) * sizeof(real_t), cudaMemcpyHostToDevice);
    cudaMemcpy(d_acceleration_x, h_acceleration_x, (N + 2) * sizeof(real_t), cudaMemcpyHostToDevice);
    
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
        fprintf(stderr, "Failed to open file: %s\n", filename);
        exit(1);
    }
    fwrite(&h_mass_0[1], sizeof(real_t), N, out);
    fclose(out);
}


void domain_finalize(void)
{
    free(h_mass_0);
    free(h_mass_1);
    free(h_mass_velocity_x_0);
    free(h_mass_velocity_x_1);
    free(h_velocity_x);
    free(h_acceleration_x);
    
    // TODO #1.9: Add cudaFree for the device buffers.
    
    cudaFree(d_mass_0);
    cudaFree(d_mass_1);
    cudaFree(d_mass_velocity_x_0);
    cudaFree(d_mass_velocity_x_1);
    cudaFree(d_velocity_x);
    cudaFree(d_acceleration_x);
}
