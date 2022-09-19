#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <math.h>
#include <sys/time.h>

#include "../inc/argument_utils.h"

#include <mpi.h>

#define WALLTIME(t) ((double)(t).tv_sec + 1e-6 * (double)(t).tv_usec)

MPI_Comm
        cart;
MPI_Datatype
        grid,
        subgrid;

int
        rank,
        comm_size,
        local_rows,
        local_cols;

#define MPI_RANK_ROOT  ( rank == 0 )

struct timeval
        t_start,
        t_stop;
double
        t_total;

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
        *mass_velocity_y[2] = {NULL, NULL},
        *mass_velocity = NULL,
        *velocity_x = NULL,
        *velocity_y = NULL,
        *acceleration_x = NULL,
        *acceleration_y = NULL,
        dx,
        dt;

#define PN(y, x)         mass[0][(y)*(local_cols+2)+(x)]
#define PN_next(y, x)    mass[1][(y)*(local_cols+2)+(x)]
#define PNU(y, x)        mass_velocity_x[0][(y)*(local_cols+2)+(x)]
#define PNU_next(y, x)   mass_velocity_x[1][(y)*(local_cols+2)+(x)]
#define PNV(y, x)        mass_velocity_y[0][(y)*(local_cols+2)+(x)]
#define PNV_next(y, x)   mass_velocity_y[1][(y)*(local_cols+2)+(x)]
#define PNUV(y, x)       mass_velocity[(y)*(local_cols+2)+(x)]
#define U(y, x)          velocity_x[(y)*(local_cols+2)+(x)]
#define V(y, x)          velocity_y[(y)*(local_cols+2)+(x)]
#define DU(y, x)         acceleration_x[(y)*(local_cols+2)+(x)]
#define DV(y, x)         acceleration_y[(y)*(local_cols+2)+(x)]

void time_step(void);

void boundary_condition(real_t *domain_variable, int sign);

void create_types(void);

void domain_init(void);

void domain_save(int_t iteration);

void domain_finalize(void);


void
swap(real_t **t1, real_t **t2)
{
    real_t *tmp;
    tmp = *t1;
    *t1 = *t2;
    *t2 = tmp;
}

const int NUM_DIMS = 2; //The number of dimensions is always 2
int dims[NUM_DIMS] = {
        0}; //The list will contain the distribution of processes among the dimensions, but needs to be all zeros when passed as an argument
int periods[NUM_DIMS] = {0}; //Init the array to zeros

//To find out who our neighbours are is not necessary to do more than once
static int north, east, south, west;

MPI_Datatype column_datatype /*North-South*/, row_datatype; //, all_column_datatype, all_row_datatype;

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    
    // TODO 1 Create a communicator with cartesian topology
    MPI_Comm_size(MPI_COMM_WORLD, &comm_size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    
    if (MPI_Dims_create(comm_size, NUM_DIMS, dims)) //Let MPI distribute the processes among the dimensions
        exit(EXIT_FAILURE); //There was an error code thrown on the call
    //printf("\n\ndims: (%d, %d)\n\n", dims[0], dims[1]);
    int reorder = 1; //We want to reorder the ranking, so it is more compliant with the new communicator
    
    MPI_Cart_create(MPI_COMM_WORLD, NUM_DIMS, dims, periods, reorder,
                    &cart); //Create the communicator with cartesian topology
    MPI_Comm_rank(cart, &rank); //Get the process rank in the new communicator
    
    if (MPI_RANK_ROOT)
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
    }
    
    MPI_Bcast(&N, 1, MPI_INT64_T, 0, MPI_COMM_WORLD);
    MPI_Bcast(&max_iteration, 1, MPI_INT64_T, 0, MPI_COMM_WORLD);
    MPI_Bcast(&snapshot_frequency, 1, MPI_INT64_T, 0, MPI_COMM_WORLD);
    
    // TODO 2 Find the number of columns and rows of each subgrid
    //        and find the local x and y offsets for each process' subgrid
    // Uncomment domain_save() and create_types() after TODO2 is complete
    domain_init();
    
    create_types();
    
    gettimeofday(&t_start, NULL);
    
    //( 1, 1) y-dim up shift "down/south"
    //( 0, 1) x-dim up shift "right/east"
    //north (source_rank) get the rank of the value above, that gets shifted down
    //south (destination_rank) gets the rank of the value that was below before the shift
    MPI_Cart_shift(cart, 1, 1, &north, &south);
    //west (source_rank) get the rank of the value to the left, that gets shifted right
    //east (destination_rank) gets the rank of the value that was to the right, before the shift
    MPI_Cart_shift(cart, 0, 1, &west, &east);
    
    
    //printf("\n\n%d: N: %d, E: %d, S: %d, W: %d\n\n", rank, north, east, south, west);
    
    
    for (int_t iteration = 0; iteration <= max_iteration; iteration++)
    {
        // TODO 5 Implement border exchange
        
        //It might be more efficient to create a local struct and stitch all the data
        //together and send it all at once, and then reduce the Sendrecv()-calls from 12 to 4
        //each iteration. However, then we would need to manually write all the data to and from a
        //temporary buffer twice per direction, hens 4, giving a total 8 full buffer
        //read writes, each iteration. It also is much more overhead and can damage memory cache success.
        //I tried to send all the data in one message, but as described above, the displacement between the
        //data arrays are different across the processors, and non-deterministic.
        real_t *domain[3] = {&PN(0, 0), &PNU(0, 0), &PNV(0, 0)};
        for (int i = 0; i < 3; ++i) //Looping through to send mass, mass_v_x and mass_v_y
        {
            #define VAR(y, x)domain[i][(y)*(local_cols+2)+(x)]
            
            //Sending north, receiving from south
            MPI_Sendrecv(&VAR(1, 1), 1, column_datatype, north, 0,
                         &VAR(1, local_cols + 1), 1, column_datatype, south, 0,
                         cart, MPI_STATUS_IGNORE);
            
            //Sending south, receiving from north
            MPI_Sendrecv(&VAR(1, local_cols), 1, column_datatype, south, 0,
                         &VAR(1, 0), 1, column_datatype, north, 0,
                         cart, MPI_STATUS_IGNORE);
            
            //Sending east, receiving from west
            MPI_Sendrecv(&VAR(local_rows, 1), 1, row_datatype, east, 0,
                         &VAR(0, 1), 1, row_datatype, west, 0,
                         cart, MPI_STATUS_IGNORE);
            
            //Sending west, receiving from east
            MPI_Sendrecv(&VAR(1, 1), 1, row_datatype, west, 0,
                         &VAR(local_rows + 1, 1), 1, row_datatype, east, 0,
                         cart, MPI_STATUS_IGNORE);
            #undef VAR
        }
        
        // TODO 4 Change application of boundary condition to match cartesian topology
        boundary_condition(mass[0], 1);
        boundary_condition(mass_velocity_x[0], -1);
        boundary_condition(mass_velocity_y[0], -1);
        
        // TODO 3 Update the area of iteration in the time step
        time_step();
        
        if (iteration % snapshot_frequency == 0)
        {
            if (MPI_RANK_ROOT)
            {
                printf(
                        "Iteration %lld of %lld, (%.2lf%% complete)\n",
                        iteration,
                        max_iteration,
                        100.0 * (real_t) iteration / (real_t) max_iteration
                );
            }
            
            domain_save(iteration);
        }
        
        swap(&mass[0], &mass[1]);
        swap(&mass_velocity_x[0], &mass_velocity_x[1]);
        swap(&mass_velocity_y[0], &mass_velocity_y[1]);
    }
    
    MPI_Type_free(&row_datatype);
    MPI_Type_free(&column_datatype);
    /*MPI_Type_free(&all_row_datatype);
    MPI_Type_free(&all_column_datatype);*/
    
    domain_finalize();
    
    gettimeofday(&t_stop, NULL);
    t_total = WALLTIME(t_stop) - WALLTIME(t_start);
    
    if (MPI_RANK_ROOT)
        printf("%.2lf seconds total runtime\n", t_total);
    
    MPI_Finalize();
    
    exit(EXIT_SUCCESS);
}


void time_step(void)
{
    // TODO 3 Update the area of iteration in the time step
    
    //All that is needed to do here is to change N to the local rows and cols, respectively
    //so we only iterate over the allocated memory, for each process's sub-grid
    
    for (int_t y = 1; y <= local_rows; y++)
        for (int_t x = 1; x <= local_cols; x++)
        {
            U(y, x) = PNU(y, x) / PN(y, x);
            V(y, x) = PNV(y, x) / PN(y, x);
        }
    
    for (int_t y = 1; y <= local_rows; y++)
        for (int_t x = 1; x <= local_cols; x++)
        {
            PNUV(y, x) = PN(y, x) * U(y, x) * V(y, x);
        }
    
    for (int_t y = 0; y <= local_rows + 1; y++)
        for (int_t x = 0; x <= local_cols + 1; x++)
        {
            DU(y, x) = PN(y, x) * U(y, x) * U(y, x)
                       + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
            DV(y, x) = PN(y, x) * V(y, x) * V(y, x)
                       + 0.5 * gravity * (PN(y, x) * PN(y, x) / density);
        }
    
    for (int_t y = 1; y <= local_rows; y++)
        for (int_t x = 1; x <= local_cols; x++)
        {
            PNU_next(y, x) = 0.5 * (PNU(y, x + 1) + PNU(y, x - 1)) - dt * (
                    (DU(y, x + 1) - DU(y, x - 1)) / (2 * dx)
                    + (PNUV(y, x + 1) - PNUV(y, x - 1)) / (2 * dx)
            );
        }
    
    for (int_t y = 1; y <= local_rows; y++)
        for (int_t x = 1; x <= local_cols; x++)
        {
            PNV_next(y, x) = 0.5 * (PNV(y + 1, x) + PNV(y - 1, x)) - dt * (
                    (DV(y + 1, x) - DV(y - 1, x)) / (2 * dx)
                    + (PNUV(y + 1, x) - PNUV(y - 1, x)) / (2 * dx)
            );
        }
    
    for (int_t y = 1; y <= local_rows; y++)
        for (int_t x = 1; x <= local_cols; x++)
        {
            PN_next(y, x) = 0.25 * (PN(y, x + 1) + PN(y, x - 1) + PN(y + 1, x) + PN(y - 1, x)) - dt * (
                    (PNU(y, x + 1) - PNU(y, x - 1)) / (2 * dx)
                    + (PNV(y + 1, x) - PNV(y - 1, x)) / (2 * dx)
            );
        }
}


void boundary_condition(real_t *domain_variable, int sign)
{
    // TODO 4 Change application of boundary condition to match cartesian topology

    //Here we check if the process lack neighbours in the given direction.
    //If so, then they are at that boundary and we need to apply the conditions
    //for that part.
    
#define VAR(y, x) domain_variable[(y)*(local_cols+2)+(x)]
    
    if (north < 0 && west < 0)
        VAR(0, 0) = sign * VAR(2, 2);
    if (north < 0 && east < 0)
        VAR(N + 1, 0) = sign * VAR(N - 1, 2);
    if (south < 0 && west < 0)
        VAR(0, N + 1) = sign * VAR(2, N - 1);
    if (south < 0 && east < 0)
        VAR(N + 1, N + 1) = sign * VAR(N - 1, N - 1);
    
    
    if (north < 0)
        for (int_t y = 1; y <= local_rows; y++) VAR(y, 0) = sign * VAR(y, 2);
    
    if (south < 0)
        for (int_t y = 1; y <= local_rows; y++) VAR(y, local_cols + 1) = sign * VAR(y, local_cols - 1);
    
    if (west < 0)
        for (int_t x = 1; x <= local_cols; x++) VAR(0, x) = sign * VAR(2, x);
    
    if (east < 0)
        for (int_t x = 1; x <= local_cols; x++) VAR(local_rows + 1, x) = sign * VAR(local_rows - 1, x);
    
    //Test code
    /*
    if (rank == 0)
        for (int_t y = 1; y <= 5; ++y)
            for (int_t x = 1; x <= local_cols; ++x)
                VAR(y, x) = 0;
    */
#undef VAR
}


void create_types(void)
{
    int cart_rank, cart_offset[2];
    MPI_Comm_rank(cart, &cart_rank);
    MPI_Cart_coords(cart, cart_rank, 2, cart_offset);
    
    MPI_Type_create_subarray(2,
                             (int[2]) {local_rows + 2, local_cols + 2},
                             (int[2]) {local_rows, local_cols},
                             (int[2]) {1, 1},
                             MPI_ORDER_C,
                             MPI_DOUBLE,
                             &subgrid);
    
    MPI_Type_create_subarray(2,
                             (int[2]) {N, N}, (int[2]) {local_rows, local_cols},
                             (int[2]) {cart_offset[0] * local_rows, cart_offset[1] * local_cols},
                             MPI_ORDER_C,
                             MPI_DOUBLE,
                             &grid);
    
    MPI_Type_commit(&subgrid);
    MPI_Type_commit(&grid);
    
    
    
    //Datatype for one column
    MPI_Type_create_hvector(local_rows,
                            1, //The block length, which is just one value
                            (local_cols + 2) *
                            sizeof(real_t), //Displacement between each value (need to skip one row ahead)
                            MPI_DOUBLE,
                            &column_datatype);
    MPI_Type_commit(&column_datatype);
    
    //Datatype for one row
    MPI_Type_contiguous(local_cols,
                        MPI_DOUBLE,
                        &row_datatype);
    MPI_Type_commit(&row_datatype);
    
    const int NUM_BLOCKS = 3; //mass, mass_v_x, mass_v_y
    /*
     * I tried to use a collecting datatype to store all the data, but the displacement varies from each process, so there was no success in it
    const MPI_Aint displacements[NUM_BLOCKS] = {0, &PNU(0, 0) - &PN(0, 0), &PNV(0, 0) - &PN(0, 0)}; //The displacements are equal to the offset between the arrays, PN, PNU and PNV, in memory
    printf("\n\n%d: addresses: ", rank);
    for (int i = 0; i < NUM_BLOCKS; ++i)
        printf("%td, ", displacements[i]);
    printf("\n\n");
    
    int block_lengths_row[NUM_BLOCKS] = {local_cols};  //The number of elements in the row (minus the edges)
    
    MPI_Type_create_hindexed(NUM_BLOCKS,
                             block_lengths_row,
                             displacements,
                             MPI_DOUBLE,
                             &all_row_datatype);
    MPI_Type_commit(&all_row_datatype);
    
    int block_lengths_column[NUM_BLOCKS] = {1};  //We only have one column_datatype per column
    
    MPI_Type_create_hindexed(NUM_BLOCKS,
                             block_lengths_column,
                             displacements,
                             column_datatype,
                             &all_column_datatype);
    MPI_Type_commit(&all_column_datatype);
    */
}


void domain_init(void)
{
    // TODO 2 Find the number of columns and rows of each subgrid
    // Hint: you can get useful information from the cartesian communicator
    
    //We use the number depth of the dimension to divide the rows and cols into equal sizes
    local_rows = N / dims[0];
    local_cols = N / dims[1];
    
    //printf("\n\n%d: locals: (%d, %d)\n\n", rank, local_cols, local_rows);
    
    int_t local_size = (local_rows + 2) * (local_cols + 2);
    
    mass[0] = calloc(local_size, sizeof(real_t));
    mass[1] = calloc(local_size, sizeof(real_t));
    
    mass_velocity_x[0] = calloc(local_size, sizeof(real_t));
    mass_velocity_x[1] = calloc(local_size, sizeof(real_t));
    mass_velocity_y[0] = calloc(local_size, sizeof(real_t));
    mass_velocity_y[1] = calloc(local_size, sizeof(real_t));
    
    mass_velocity = calloc(local_size, sizeof(real_t));
    
    velocity_x = calloc(local_size, sizeof(real_t));
    velocity_y = calloc(local_size, sizeof(real_t));
    
    acceleration_x = calloc(local_size, sizeof(real_t));
    acceleration_y = calloc(local_size, sizeof(real_t));
    
    // TODO 2 Find the local x and y offsets for each process' subgrid
    // Hint: you can get useful information from the cartesian communicator
    
    int coords[NUM_DIMS] = {0}; //The coordinates for the specific process in the grid
    MPI_Cart_get(cart, NUM_DIMS, dims, periods, coords); //Get the coordinate data
    
    
   
    //printf("\n\n%d: DIMS: (%d, %d)\n\n", rank, dims[0], dims[1]);
    //printf("\n\n%d: Coord: (%d, %d)\n\n", rank, coords[0], coords[1]);
    
    //The offsets are equal to the local values of row and col multiplied with their coord values
    int_t local_x_offset = local_cols * coords[1];
    int_t local_y_offset = local_rows * coords[0];
    
    //printf("\n\n%d: offset: (%lld, %lld)\n\n", rank, local_x_offset, local_y_offset);
    
    //printf("\n\n%d: (%lld, %lld) -> (%lld, %lld)\n\n", rank, local_x_offset, local_y_offset, local_x_offset + local_cols, local_y_offset + local_rows);
    
    for (int_t y = 1; y <= local_rows; y++)
    {
        for (int_t x = 1; x <= local_cols; x++)
        {
            PN(y, x) = 1e-3;
            PNU(y, x) = 0.0;
            PNV(y, x) = 0.0;
            
            real_t cx = (local_x_offset + x) - N / 2;
            real_t cy = (local_y_offset + y) - N / 2;
            
            if (sqrt(cx * cx + cy * cy) < N / 20.0)
            {
                PN(y, x) -= 5e-4 * exp(
                        -4 * pow(cx, 2.0) / (real_t) (N)
                        - 4 * pow(cy, 2.0) / (real_t) (N)
                );
            }
            
            PN(y, x) *= density;
        }
    }
    
    dx = domain_size / (real_t) N;
    dt = 5e-2;
}


void domain_save(int_t iteration)
{
    int_t index = iteration / snapshot_frequency;
    char filename[256];
    memset(filename, 0, 256 * sizeof(char));
    sprintf(filename, "data/%.5lld.bin", index);
    
    MPI_File out;
    MPI_File_open(cart, filename, MPI_MODE_CREATE | MPI_MODE_WRONLY, MPI_INFO_NULL, &out);
    
    MPI_File_set_view(out, 0, MPI_DOUBLE, grid, "native", MPI_INFO_NULL);
    MPI_File_write_all(out, mass[0], 1, subgrid, MPI_STATUS_IGNORE);
    
    MPI_File_close(&out);
}


void
domain_finalize(void)
{
    free(mass[0]);
    free(mass[1]);
    free(mass_velocity_x[0]);
    free(mass_velocity_x[1]);
    free(mass_velocity_y[0]);
    free(mass_velocity_y[1]);
    free(mass_velocity);
    free(velocity_x);
    free(velocity_y);
    free(acceleration_x);
    free(acceleration_y);
}
