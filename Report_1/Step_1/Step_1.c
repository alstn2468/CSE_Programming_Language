#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>

#define FMROW 500
#define FMCOL 250
#define SMROW 250
#define SMCOL 500

void main()
{
    FILE *f;
    int i, j, k;
    int fm[FMROW][FMCOL], sm[SMROW][SMCOL], res[FMROW][SMCOL];
    clock_t start, finish;
    double duration;

    f = fopen("Data01.txt", "r");
    printf("Reading Data01.txt\n");

    for(i = 0; i < FMROW; i++)
    {
        for(j = 0; j < FMCOL; j++)
        {
            fscanf(f, "%d", &fm[i][j]);
        }
    }

    fclose(f);

    f = fopen("Data02.txt", "r");
    printf("Reading Data02.txt\n");

    for(i = 0; i < SMROW; i++)
    {
        for(j = 0; j < SMCOL; j++)
        {
            fscanf(f, "%d", &sm[i][j]);
        }
    }

    fclose(f);

    printf("Calculating... loop k->j->i\n");
    start = clock();

    for(k = 0; k < SMROW; k++)
    {
        for(j = 0; j < SMCOL; j++)
        {
            for(i = 0; i < FMROW; i++)
            {
                res[i][j] += (fm[i][k] * sm[k][j]);
            }
        }
    }
    finish = clock();

    duration = (double)(finish - start) / CLOCKS_PER_SEC;

    printf("\n\n");
    printf("*** 총 소요시간 : %.3lf 초\n", duration);
    system("pause");
}
