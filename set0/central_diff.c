#include <stdio.h>
#include <stdlib.h>


void print_arr(double* arr, int size)
{
    for (int i = 0; i < size; ++i)
        printf("%lf ", arr[i]);
    printf("\n");
}

int main(int argc, char** argv)
{
    int N = 10;
    printf("Hello world! This is an integer: %d\n", N);

    //Task 1
    double *func_vals_arr = (double *)calloc(N, sizeof(double));
    double *func_dir_vals_arr = (double *)calloc(N, sizeof(double));

    

    //Task 2
    for (int i = 0; i < N; ++i)
        func_vals_arr[i] = (double)(i * i); //The f(x) = x^2 
    
    //Task 3
    for (int i = 1; i < N - 1; ++i)
        func_dir_vals_arr[i] = (func_vals_arr[i + 1] - func_vals_arr[i - 1]) / 2;


    //Task 4
    printf("Function values:\n");
    print_arr(func_vals_arr, N); 
    printf("Dirivative function values:\n");
    print_arr(func_dir_vals_arr, N); 

    free(func_vals_arr);
    free(func_dir_vals_arr);
    return 0;
}
