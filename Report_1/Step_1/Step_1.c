#include <stdio.h>
#include <stdlib.h>

#define MATRIX_SIZE 100

int main()
{
    int **matrix;

    matrix = (int **)malloc(sizeof(int *) * MATRIX_SIZE);

    for (int i = 0; i < MATRIX_SIZE; i++)
        matrix[i] = (int *)malloc(sizeof(int) * MATRIX_SIZE);

    return 0;
}
