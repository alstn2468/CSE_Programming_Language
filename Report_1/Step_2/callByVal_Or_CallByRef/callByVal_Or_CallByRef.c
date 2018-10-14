#include <stdio.h>

void call_by_val(int a, int b)
{
	int temp = a;
	a = b;
	b = temp;
}

void call_by_ref(int *a, int *b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

int main()
{
	int a = 1, b = 2;

	printf("First Data\n");
	printf("%d %d\n\n", a, b);
	// 1 2

	printf("Call by Value\n");
	call_by_val(a, b);
	printf("%d %d\n\n", a, b);
	// 1 2

	printf("Call by Ref\n");
	call_by_ref(&a, &b);
	printf("%d %d\n", a, b);
	// 2 1

	return 0;
}
