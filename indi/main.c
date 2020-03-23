#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

void visualize(double*, int, int); 
void normalize(double*, double*, int, int); 
void substract(double*, double*, int, int, int); 
double multiply(double*, double*, int, int, int); 

int main(int argc, char* argv[]){
    if(argc != 2){
	printf("Error: 1 input parameter expected! \n"); 
	return 1; 
    }
    int M, N; 
    FILE* fp = fopen(argv[1], "r"); 
    if(fp == NULL){printf("Error: Invalid input file! \n"); return 1; }
    if(fread(&M, sizeof(int), 1, fp) != 1){printf("Error: Dimension 1 read failed! \n"); return 1; }
    if(fread(&N, sizeof(int), 1, fp) != 1){printf("Error: Dimension 2 read failed! \n"); return 1; }
    if(M<N){
	printf("Invalid dimension! M >= N expected! \n"); 
	return 1; 
    }
    printf("Dimension: %d * %d. \n", M, N);
    double* A = malloc(M*N*sizeof(double)); 
    double* oriA = malloc(M*N*sizeof(double)); 
    double* Q = malloc(M*N*sizeof(double)); 
    double* R = calloc(N*N, sizeof(double)); 
    if(fread(A, sizeof(double), M*N, fp) != M*N){
	printf("Error: Matrix data read failed! \n"); 
	return 1; 
    }
    
    memcpy(oriA, A, M*N*sizeof(double)); 

    visualize(A, M, N);
    for(int i=0; i<N; i++){
	normalize(A, Q, i, M); 
	for(int j=i+1; j<N; j++){
	    substract(A, Q, j, i, M); 
	}
    }
    visualize(Q, M, N); 
    
    for(int i=0; i<N; i++){
	for(int j=0; j<i+1; j++){
	    R[i*N+j] = multiply(oriA, Q, i, j, M); 	
	}
    }
    visualize(R, N, N); 
}

void visualize(double* mat, int M, int N){
    for(int i=0; i<M; i++){
	for(int j=0; j<N; j++){
	    printf("%.5f  ", mat[j*M+i]); 
	}
	printf("\n"); 
    }
    printf("==========================================\n"); 
}

void normalize(double* A, double* Q, int index, int length){
    double module = 0; 
    for(int i=0; i<length; i++){
	module += A[index*length+i] * A[index*length+i]; 
    }
    /* printf("Module is %.5f. \n", module); */ 
    module = sqrt(module); 
    for(int i=0; i<length; i++){
	Q[index*length+i] = A[index*length+i]/module; 
    }
}

void substract(double* A, double* Q, int aindex, int qindex, int length){
    double mult = 0; 
    for(int i=0; i<length; i++){
	mult += A[aindex*length+i] * Q[qindex*length+i]; 
    }
    for(int i=0; i<length; i++){
	A[aindex*length+i] -= mult*Q[qindex*length+i]; 
    }
}

double multiply(double* A, double* Q, int aindex, int qindex, int length){
    double result = 0; 
    for(int i=0; i<length; i++){
	result += Q[qindex*length+i]*A[aindex*length+i]; 
    }
    printf("%f. \n", result); 
    return result; 
}
