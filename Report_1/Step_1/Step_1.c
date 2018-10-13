#include <stdio.h>
#include <stdlib.h>
#define TRUE 1
#define FALSE 0

void matrix_mul(int **matrix1, int **matrix2, int **matrix3, int ROWS, int COLS);
void print_matrix(int **matrix, int COLS, int ROWS);

int main()
{
	int **Matrix_A, **Matrix_B, **Matrix_C;
	int COLS_A, ROWS_A;
	int COLS_B, ROWS_B;
    int i, j;

    do
    {
        printf("A 매트릭스의 행과 열을 입력해주세요 (2 4) >> ");
        scanf("%d %d", &COLS_A, &ROWS_A);

        printf("B 매트릭스의 행과 열을 입력해주세요 (4 2) >> ");
        scanf("%d %d", &COLS_B, &ROWS_B);

        if (ROWS_A != COLS_B)
            printf("곱셈을 진행할 수 없습니다. 다시 입력해주세요.\n");

        else
            break;

    } while (TRUE);

	Matrix_A = (int **)malloc(sizeof(int *) * COLS_A);
	for (i = 0; i < COLS_A; i++)
		Matrix_A[i] = (int *)malloc(sizeof(int) * ROWS_A);

    Matrix_B = (int **)malloc(sizeof(int *) * COLS_B);
    for (i = 0; i < COLS_B; i++)
        Matrix_B[i] = (int *)malloc(sizeof(int) * ROWS_B);

	for (i = 0; i < COLS_A; i++)
	{
		for (j = 0; j < ROWS_A; j++)
			scanf(" %d", &Matrix_A[i][j]);
	}

	for (i = 0; i < COLS_B; i++)
	{
		for (j = 0; j < ROWS_B; j++)
			scanf("%d", &Matrix_B[i][j]);
	}


	printf("-------A 행렬-------\n");
	print_matrix(Matrix_A, COLS_A, ROWS_A);

	printf("\n");
	printf("-------B 행렬-------\n");
	print_matrix(Matrix_B, COLS_B, ROWS_B);

	printf("\n");


	Matrix_C = (int **)malloc(sizeof(int *) * COLS_A);

	for (i = 0; i < ROWS_A; i++)
		Matrix_C[i] = (int *)malloc(sizeof(int) * ROWS_B);

	matrix_mul(Matrix_A, Matrix_B, Matrix_C, COLS_A, ROWS_B);
	printf("A 행렬과 B 행렬의 곱\n");
	print_matrix(Matrix_C, COLS_A, ROWS_B);
	printf("\n");

	for(i = 0; i < ROWS_A; i++)
		free(Matrix_A[i]);
	free(Matrix_A);

	for (i = 0; i < ROWS_B; i++)
		free(Matrix_B[i]);
	free(Matrix_B);

	for (i = 0; i < ROWS_B; i++)
		free(Matrix_C[i]);
	free(Matrix_C);

	return 0;
}

void matrix_mul(int **matrix1, int **matrix2, int **matrix3, int ROWS, int COLS)
{
    int i, j, k;

	for (i = 0; i < ROWS; i++)
	{
		for (j = 0; j < COLS; j++)
		{
			for (k = 0; k < ROWS; k++)
				matrix3[i][j] = matrix1[i][k] * matrix2[k][j];
		}
	}
}

void print_matrix(int **matrix, int ROWS, int COLS)
{
    int i, j;

    for (i = 0; i < ROWS; i++)
	{
		for (j = 0; j < COLS; j++)
		{
			if (j == COLS - 1)
				printf("│ %3d │", matrix[i][j]);
			else
				printf("│ %3d ", matrix[i][j]);
		}

		printf("\n");
	}
}
