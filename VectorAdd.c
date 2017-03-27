#include <stdio.h>


int VectorAdd(int a[], int b[], int c[], int n)
{
	int i;
	for(int i=0;i<n;++i){
		c[i] = a[i] + b[i];
		}
}

int main()
{
	printf("\n------------------------------\nSUMA VECTORIAL\n------------------------------\n");

	int i;
	const int SIZE = 1024;
	int a[SIZE], b[SIZE], c[SIZE];

	for( int i=0;i<SIZE;++i)
	{
		a[i] = i;
		b[i] = i;
		c[i] = 0;
	}

	printf("\n Vector A\n \n");
	for( int i=0;i<3;++i)
		printf("a[%d] = %d\n", i, a[i]);

	printf(".\n.\n.\n");

	for( int i=SIZE-3;i<SIZE;++i)
		printf("a[%d] = %d\n", i, a[i]);

	printf("\n Vector B\n \n");
	for( int i=0;i<3;++i)
		printf("b[%d] = %d\n", i, b[i]);

	printf(".\n.\n.\n");

	for( int i=SIZE-3;i<SIZE;++i)
		printf("b[%d] = %d\n", i, b[i]);

	VectorAdd(a, b, c, SIZE);

	printf("\n A[i] + B[i] = C[i] \n");

	printf("\n Vector C\n \n");
	for( int i=0;i<3;++i)
		printf("c[%d] = %d\n", i, c[i]);

	printf(".\n.\n.\n");

	for( int i=SIZE-3;i<SIZE;++i)
		printf("c[%d] = %d\n", i, c[i]);

	return 0;
}
