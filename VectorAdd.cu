#include <stdio.h>

#define SIZE 1024

__global__ void VectorAdd(int *a, int *b, int *c, int n)
{
	int i = threadIdx.x;

	if(i<n)
		c[i] = a[i] + b[i];
}

int main()
{
	printf("\n------------------------------\nSUMA VECTORIAL\n------------------------------\n");
// ALLOCATE AND INITIALIZE DATA ON CPU
	int *a, *b, *c;
	int *d_a, *d_b, *d_c;

	a = (int *)malloc(SIZE*sizeof(int));
	b = (int *)malloc(SIZE*sizeof(int));
	c = (int *)malloc(SIZE*sizeof(int));

// ALOCATE DATA ON GPU
	cudaMalloc( &d_a, SIZE*sizeof(int));
	cudaMalloc( &d_b, SIZE*sizeof(int));
	cudaMalloc( &d_c, SIZE*sizeof(int));

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


// TRANSFER DATA FROM CPU TO GPU
	cudaMemcpy( d_a, a, SIZE*sizeof(int), cudaMemcpyHostToDevice );
	cudaMemcpy( d_b, b, SIZE*sizeof(int), cudaMemcpyHostToDevice );
	cudaMemcpy( d_c, c, SIZE*sizeof(int), cudaMemcpyHostToDevice );

// RUN KERNEL
	VectorAdd<<< 1, SIZE >>>(d_a, d_b, d_c, SIZE);

// TRANSFER DATA FROM GPU TO CPU
	cudaMemcpy( c, d_c, SIZE*sizeof(int), cudaMemcpyDeviceToHost );

	printf("\n A[i] + B[i] = C[i] \n");

	printf("\n Vector C\n \n");
	for( int i=0;i<3;++i)
		printf("c[%d] = %d\n", i, c[i]);

	printf(".\n.\n.\n");

	for( int i=SIZE-3;i<SIZE;++i)
		printf("c[%d] = %d\n", i, c[i]);

	free(a);
	free(b);
	free(c);

	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);

	return 0;
}
