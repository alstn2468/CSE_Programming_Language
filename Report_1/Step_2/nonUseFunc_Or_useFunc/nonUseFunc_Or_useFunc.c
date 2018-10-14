#include <stdio.h>

int useFunc(int a)
{
	int i, sum = 0;

	for (i = 1; i <= a; i++)
		sum += i;

	return sum;
}

int main()
{
	int result1 = 0, result2 = 0;
	int i;

	result1 = useFunc(10);

	for (i = 1; i <= 10; i++)
		result2 += i;

	printf("UseFunc    : %d\n", result1);
	printf("nonUseFunc : %d\n", result2);
	// UseFunc    : 55
	// nonUseFunc: 55

	return 0;
}
