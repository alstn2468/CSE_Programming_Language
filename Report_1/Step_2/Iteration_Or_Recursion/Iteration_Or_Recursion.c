#include <stdio.h>

int recur(int a)
{
	if (a <= 0)
		return a;

	else
		return recur(a - 1) + a;
}

int iter(int a)
{
	int i, sum = 0;

	for (i = 1; i <= a; i++)
		sum += i;

	return sum;
}

int main()
{
	int recursion = recur(10);
	int iteration = iter(10);

	printf("Recursion : %d\n", recursion);
	printf("Iteration : %d\n", iteration);
	// Recursion: 55
	// Iteration : 55

	return 0;
}
