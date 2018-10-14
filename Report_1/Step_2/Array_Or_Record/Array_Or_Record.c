#include <stdio.h>

typedef struct _record
{
	int a;
	char b;
} Record;

int main()
{
	// 배열 사용
	int arr[10] = { 0 };
	int i;

	for (i = 0; i < sizeof(arr) / sizeof(int); i++)
		arr[i] = i + 1;

	for (i = 0; i < sizeof(arr) / sizeof(int); i++)
		printf("%d ", arr[i]);
	// 1 2 3 4 5 6 7 8 9 10

	printf("\n");

	// 레코드 사용
	Record record[10];
	for (i = 0; i < sizeof(record) / sizeof(Record); i++)
		record[i].a = i + 1, record[i].b = 'a' + i;

	for (i = 0; i < sizeof(record) / sizeof(Record); i++)
		printf("%d %c ", record[i].a, record[i].b);
	// 1 a 2 b 3 c 4 d 5 e 6 f 7 g 8 h 9 i 10 j

	return 0;
}
