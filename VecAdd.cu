// Kernel definition

__global__ void VecAdd(float* A, float* B, float* C)

{
	int i = threadIdx.x;
	C[i] = A[i] + B[i];
}

int main()
{
	const int N  = 10;
	double A[], B[], C[];
	
	__global__ void VecAdd( A, B, C);
	
	// Kernel invoaction with N threads
	VecAdd<<<1, N>>>(A,B,C);
	
}
