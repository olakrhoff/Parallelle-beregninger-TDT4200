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
    *h_mass[2] = { NULL, NULL },
    *h_mass_velocity_x[2] = { NULL, NULL },
    *h_velocity_x = NULL,
    *h_acceleration_x = NULL,
    dx,
    dt;

#define PN(x)        mass_0[(x)]
#define PN_next(x)   mass_1[(x)]
#define PNU(x)       mass_velocity_x_0[(x)]
#define PNU_next(x)  mass_velocity_x_1[(x)]
#define U(x)         velocity_x[(x)]
#define DU(x)        acceleration_x[(x)]

#define cudaErrorCheck(ans) { gpuAssert((ans), __FILE__, __LINE__); }                 
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)  
{                                                                                     
    if (code != cudaSuccess) {                                                        
        fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
        if (abort) exit(code);                                                        
    }                                                                                 
}

void time_step_1(real_t *acceleration_x, real_t *mass_0, real_t *velocity_x, int_t N);
void time_step_2(real_t *mass_velocity_x_0, real_t *mass_velocity_x_1, real_t *acceleration_x, real_t *mass_0, real_t *mass_1, real_t *velocity_x, real_t dx, real_t dt, int_t N);
void boundary_condition( real_t *domain_variable, int sign );
void domain_init ( void );
void domain_save ( int_t iteration );
void domain_finalize ( void );


void
swap ( real_t** m1, real_t** m2 )
{
    real_t* tmp;
    tmp = *m1;
    *m1 = *m2;
    *m2 = tmp;
}


int
main ( int argc, char **argv )
{
    OPTIONS *options = parse_args( argc, argv );
    if ( !options )
    {
        fprintf( stderr, "Argument parsing failed\n" );
        exit(1);
    }

    N = options->N;
    max_iteration = options->max_iteration;
    snapshot_frequency = options->snapshot_frequency;

    domain_init();

    // TODO #2.4: Define the thread block size and calculate the corresponding grid size.


    for ( int_t iteration = 0; iteration <= max_iteration; iteration++ )
    {
        // TODO #1.5: Move the boundary_condition calls to inside the time_step_1 kernel
        boundary_condition(h_mass[0], 1);
        boundary_condition(h_mass_velocity_x[0], -1);

        // TODO #1.6: Change the function calls to invoke the kernels with the arguments to the device-side equivalents
        time_step_1(h_acceleration_x, h_mass[0], h_velocity_x, N);
        time_step_2(h_mass_velocity_x[0], h_mass_velocity_x[1], h_acceleration_x, h_mass[0], h_mass[1], h_velocity_x, dx, dt, N);

        if ( iteration % snapshot_frequency == 0 )
        {
            printf (
                "Iteration %ld of %ld (%.2lf%% complete)\n",
                iteration,
                max_iteration,
                100.0 * (real_t) iteration / (real_t) max_iteration
            );

            // TODO #1.8: Copy the results back from the GPU into the host-side buffers.

            domain_save ( iteration );
        }

        // TODO #1.7: Swap device pointers
        swap( &h_mass[0], &h_mass[1] );
        swap( &h_mass_velocity_x[0], &h_mass_velocity_x[1] );
    }

    domain_finalize();

    exit ( EXIT_SUCCESS );
}

// TODO #1.5: Change the host-side function to be a device-side function
void
boundary_condition ( real_t *domain_variable, int sign )
{
    #define VAR(x) domain_variable[(x)]
    VAR(   0 ) = sign*VAR( 2   );
    VAR( N+1 ) = sign*VAR( N-1 );
    #undef VAR
}

// TODO #1.4: Change the function to be a CUDA kernel
void
time_step_1(real_t *acceleration_x, real_t *mass_0, real_t *velocity_x, int_t N)
{
    // TODO #2.1: Define the global index
    // TODO #2.3: Restrict the boundary_condition updates to only be performed by the first and last thread
    for ( int_t x=0; x<=N+1; x++ )
    {
        DU(x) = PN(x) * U(x) * U(x)
                + 0.5 * gravity * PN(x) * PN(x) / density;
    }
}

// TODO #1.4: Change the function to be a CUDA kernel
void
time_step_2(real_t *mass_velocity_x_0, real_t *mass_velocity_x_1, real_t *acceleration_x, real_t *mass_0, real_t *mass_1, real_t *velocity_x, real_t dx, real_t dt, int_t N)
{
    // TODO #2.1: Define the global index
    for ( int_t x=1; x<=N; x++ )
    {
        PNU_next(x) = 0.5*( PNU(x+1) + PNU(x-1) ) - dt*(
                      ( DU(x+1) - DU(x-1) ) / (2*dx)
        );
    }

    for ( int_t x=1; x<=N; x++ )
    {
        PN_next(x) = 0.5*( PN(x+1) + PN(x-1) ) - dt*(
                       ( PNU(x+1) - PNU(x-1) ) / (2*dx)
        );
    }

    for ( int_t x=1; x<=N; x++ )
    {
        U(x) = PNU_next(x) / PN_next(x);
    }
}


void
domain_init ( void )
{
    // TODO #1.2: Allocate space for the device-side buffers.

    h_mass[0] = (real_t *) calloc ( (N+2), sizeof(real_t) );
    h_mass[1] = (real_t *) calloc ( (N+2),  sizeof(real_t) );

    h_mass_velocity_x[0] = (real_t *) calloc ( (N+2), sizeof(real_t) );
    h_mass_velocity_x[1] = (real_t *) calloc ( (N+2),  sizeof(real_t) );

    h_velocity_x = (real_t *) calloc ( (N+2), sizeof(real_t) );
    h_acceleration_x = (real_t *) calloc ( (N+2), sizeof(real_t) );

    // Data initialization
    for ( int_t x=1; x<=N; x++ )
    {
        h_mass[0][(x)] = 1e-3;
        h_mass_velocity_x[0][(x)] = 0.0;

        real_t c = x-(double)N/2;
        if ( sqrt ( c*c ) < N/20.0 )
        {
            h_mass[0][(x)] -= 5e-4 * exp(-4 * pow(c, 2.0) / (real_t) (N));
        }

        h_mass[0][(x)] *= density;
    }

    dx = domain_size / (real_t) N;
    dt = 0.1*dx;

    // TODO #1.3: Transfer the host-side data to the device.

}


void
domain_save ( int_t iteration )
{
    int_t index = iteration / snapshot_frequency;
    char filename[256];
    memset ( filename, 0, 256*sizeof(char) );
    sprintf ( filename, "data/%.5ld.bin", index );

    FILE *out = fopen ( filename, "wb" );
    if ( ! out ) {
        fprintf(stderr, "Failed to open file: %s\n", filename);
        exit(1);
    }
    fwrite( &h_mass[0][1], sizeof(real_t), N, out );
    fclose ( out );
}


void
domain_finalize ( void )
{
    free ( h_mass[0] );
    free ( h_mass[1] );
    free ( h_mass_velocity_x[0] );
    free ( h_mass_velocity_x[1] );
    free ( h_velocity_x );
    free ( h_acceleration_x );

    // TODO #1.9: Add cudaFree for the device buffers.
}
