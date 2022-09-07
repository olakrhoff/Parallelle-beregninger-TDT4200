#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>

#include "../inc/argument_utils.h"

#include <mpi.h>

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
        *mass[2] = {NULL, NULL},
        *mass_velocity_x[2] = {NULL, NULL},
        *velocity_x = NULL,
        *acceleration_x = NULL,
        dx,
        dt;

#define PN(x)        mass[0][(x)]
#define PN_next(x)   mass[1][(x)]
#define PNU(x)       mass_velocity_x[0][(x)]
#define PNU_next(x)  mass_velocity_x[1][(x)]
#define U(x)         velocity_x[(x)]
#define DU(x)        acceleration_x[(x)]

void time_step(void);

void boundary_condition(real_t *domain_variable, int sign);

void domain_init();

void domain_save(int_t iteration);

void domain_finalize(void);


void
swap(real_t **m1, real_t **m2)
{
    real_t *tmp;
    tmp = *m1;
    *m1 = *m2;
    *m2 = tmp;
}


int size, rank;
int main(int argc, char **argv)
{
    // TODO 1 Initialize MPI
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    //printf("Hello, from process %d of %d!\n", rank, size); //Check if we have the correct amount of processes
    
    // TODO 2 Parse arguments in the rank 0 processes
    // and broadcast to other processes
    OPTIONS *options;
    if (rank == 0)
        options = parse_args(argc, argv);
    else
        options = calloc(sizeof(OPTIONS), 1); //We need to allocate memory for the options
    printf("N: %d, new_N: %d\n", options->N, options->N / size);
    //Could use the error code in the if-statement with options to exit on error
    int error_code = MPI_Bcast(options, sizeof(OPTIONS), MPI_BYTE, 0, MPI_COMM_WORLD);
    
    if (!options)
    {
        fprintf(stderr, "Argument parsing failed\n");
        exit(1);
    }
    N = options->N;
    max_iteration = options->max_iteration;
    snapshot_frequency = options->snapshot_frequency;
    
    // TODO 3 Allocate space for each process' sub-grid
    // and initialize data for the sub-grid
    domain_init();
    for (int_t iteration = 0; iteration <= max_iteration; iteration++)
    {
        // TODO 7 Communicate border values
        int_t new_N = N / size;
        
        real_t values[2];
        values[0] = mass[0][new_N];
        values[1] = mass_velocity_x[0][new_N];
        if (rank != size - 1)
        {
            //printf("%d: Sending [%f, %f] from %d to %d\n", iteration, values[0], values[1], rank, (rank + 1) % size);
            //First we send our east value to our east neighbour in a ring
            MPI_Send(&values, 2, MPI_DOUBLE, (rank + 1) % size, 0 /*Tag*/, MPI_COMM_WORLD);
        }
        if (rank != 0) //It makes no sense to get the value from the other side of the water
        {
            //Then we receive the value from the west and put it in
            MPI_Recv(&values, 2, MPI_DOUBLE, (rank - 1 + size) % size, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            //printf("%d: Receiving [%f, %f] from %d to %d\n", iteration, values[0], values[1], (rank - 1 + size) % size, rank);
            mass[0][0] = values[0];
            mass_velocity_x[0][0] = values[1];
        }
        
        
        values[0] = mass[0][1];
        values[1] = mass_velocity_x[0][1];
        if (rank != 0)
        {
            //Second we send our west value to our west neighbour in a ring
            MPI_Send(&values, 2, MPI_DOUBLE, (rank - 1 + size) % size, 0 /*Tag*/, MPI_COMM_WORLD);
        }
        if (rank != size - 1) //It makes no sense to get the value from the other side of the water
        {
           //Then we receive the value from the east and put it in
           MPI_Recv(&values, 2, MPI_DOUBLE, (rank + 1) % size, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
           mass[0][new_N + 1] = values[0];
           mass_velocity_x[0][new_N + 1] = values[1];
        }
        
        
        // TODO 5 Boundary conditions
        boundary_condition(mass[0], 1);
        boundary_condition(mass_velocity_x[0], -1);
        
        // TODO 4 Time step calculations
        time_step();
        
        if (iteration % snapshot_frequency == 0)
        {
            printf(
                    "Iteration %ld of %ld (%.2lf%% complete)\n",
                    iteration,
                    max_iteration,
                    100.0 * (real_t) iteration / (real_t) max_iteration
            );
            
            // TODO 6 MPI I/O
            domain_save(iteration);
        }
        
        swap(&mass[0], &mass[1]);
        swap(&mass_velocity_x[0], &mass_velocity_x[1]);
    }
    
    domain_finalize();
    free(options);
    
    // TODO 1 Finalize MPI
    MPI_Finalize();
    exit(EXIT_SUCCESS);
}


void time_step(void)
{
    // TODO 4 Time step calculations
    int64_t new_N = N / size;
    for (int_t x = 0; x <= new_N + 1; x++)
    {
        DU(x) = PN(x) * U(x) * U(x)
                + 0.5 * gravity * PN(x) * PN(x) / density;
    }
    
    for (int_t x = 1; x <= new_N; x++)
    {
        PNU_next(x) = 0.5 * (PNU(x + 1) + PNU(x - 1)) - dt * (
                (DU(x + 1) - DU(x - 1)) / (2 * dx)
                );
    }
    
    for (int_t x = 1; x <= new_N; x++)
    {
        PN_next(x) = 0.5 * (PN(x + 1) + PN(x - 1)) - dt * (
                (PNU(x + 1) - PNU(x - 1)) / (2 * dx)
                );
    }
    
    for (int_t x = 1; x <= new_N; x++)
    {
        U(x) = PNU_next(x) / PN_next(x);
    }
}


void boundary_condition(real_t *domain_variable, int sign)
{
    // TODO 5 Boundary conditions
    if (rank != 0 && rank != size - 1)
        return; //No edges, no bounds
        
    int64_t new_N = N / size;
#define VAR(x) domain_variable[(x)]
    if (rank == 0)
        VAR(0) = sign * VAR(2);
    if (rank == size - 1)
        VAR(new_N + 1) = sign * VAR(new_N - 1);
#undef VAR
}


void domain_init()
{
    // TODO 3 Allocate space for each process' sub-grid
    // and initialize data for the sub-grid
    
    //Get the number of grids to have main responsibility for
    int64_t new_N = N / size; //Assume is divisible by number of processes
    
    mass[0] = calloc((new_N + 2), sizeof(real_t));
    mass[1] = calloc((new_N + 2), sizeof(real_t));
    
    mass_velocity_x[0] = calloc((new_N + 2), sizeof(real_t));
    mass_velocity_x[1] = calloc((new_N + 2), sizeof(real_t));
    
    velocity_x = calloc((new_N + 2), sizeof(real_t));
    acceleration_x = calloc((new_N + 2), sizeof(real_t));
    
    // Data initialization
    int64_t x_offset = new_N * rank;
    for (int_t x = 0; x <= new_N + 1; ++x)
    {
        if ((rank == 0 && x == 0) || (rank == size - 1 && x == new_N + 1))
            continue;
        
        PN(x) = 1e-3;
        PNU(x) = 0.0;
        
        real_t c = (x + x_offset) - N / 2;
        if (sqrt(c * c) < N / 20.0)
        {
            PN(x) -= 5e-4 * exp(
                    -4 * pow(c, 2.0) / (real_t) (N)
                    );
        }
        
        PN(x) *= density;
    }
    
    dx = domain_size / (real_t) N;
    dt = 0.1 * dx;
}


void domain_save(int_t iteration)
{
    int_t new_N = N / size;
    int_t index = iteration / snapshot_frequency;
    char filename[256];
    memset(filename, 0, 256 * sizeof(char));
    sprintf(filename, "data/%.5ld.bin", index);
    
    // TODO 6 MPI I/O
    MPI_File out_file;
    MPI_File_open(MPI_COMM_WORLD, filename, MPI_MODE_CREATE | MPI_MODE_WRONLY, MPI_INFO_NULL, &out_file);
    
    MPI_Offset offset = rank * new_N * sizeof(real_t);
    
    MPI_File_write_at_all(out_file, offset, &mass[0][1], new_N, MPI_DOUBLE, MPI_STATUS_IGNORE);
    
    MPI_File_close(&out_file);
}


void domain_finalize(void)
{
    free(mass[0]);
    free(mass[1]);
    free(mass_velocity_x[0]);
    free(mass_velocity_x[1]);
    free(velocity_x);
    free(acceleration_x);
}

