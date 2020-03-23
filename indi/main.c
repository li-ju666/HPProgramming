#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <omp.h>

#define TEST 0

void visualize(double*, int, int); 
void normalize(double*, double*, int, int); 
void substract(double*, double*, int, int, int); 
double multiply(double*, double*, int, int, int); 

int main(int argc, char* argv[]){
    /* check if input file parameter is given */
    if(argc != 2){
	printf("Error: 1 input parameter expected! \n"); 
	return 1; 
    }
    /* read dimension data from input  file */
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

    /* Matrix variable preparation */
    double* A = malloc(M*M*sizeof(double)); 
    double* oriA = malloc(M*N*sizeof(double)); 
    double* Q = malloc(M*M*sizeof(double)); 
    double* R = calloc(M*N, sizeof(double)); 
    
    /* timeval is used to be the seed of rand() */
    struct timeval randseed; 

    /* read matrix data from input file */
    if(fread(A, sizeof(double), M*N, fp) != M*N){
	printf("Error: Matrix data read failed! \n"); 
	return 1; 
    }
    fclose(fp);

    /* backup matrix A */
    memcpy(oriA, A, M*N*sizeof(double)); 

    /* print matrix A */
#if TEST
    visualize(oriA, M, N); 
#endif

    /* insert random values to make matrix A be a square matrix */
    for(int i=N; i<M; i++){
	for(int j=0; j<M; j++){
	    gettimeofday(&randseed, NULL); 
	    srand((unsigned)randseed.tv_usec); 
	    A[i*M+j] = ((double)rand())/(RAND_MAX/100); 
	}
    }

    /* print extended matrix A */
#if TEST    
    printf("This is Matrix A with random insertion! \n"); 
    visualize(A, M, M);
#endif

    /* calculate matrix Q with modified gram-schmidi process */
#pragma omp parallel for num_threads(2) 
    for(int i=0; i<M; i++){
	normalize(A, Q, i, M); 
	for(int j=i+1; j<M; j++){
	    substract(A, Q, j, i, M); 
	}
    }

    /* print matrix Q */
#if TEST
    printf("This is Matrix Q! \n"); 
    visualize(Q, M, M); 
#endif
    
    /* calculate matrix R */
    for(int i=0; i<N; i++){
	for(int j=0; j<i+1; j++){
	    R[i*M+j] = multiply(oriA, Q, i, j, M); 	
	}
    }

    /* print matrix R */
#if TEST
    visualize(R, M, N); 
#endif

    /* save matrix Q and R into a output file */
    FILE* Qp = fopen("matQ.dat", "w");
    int dimQ[2] = {M, M}; 
    if(fwrite(&dimQ, sizeof(int), 2, Qp) != 2){printf("Error: Q matrix dimension write error! \n"); return 1; }
    if(fwrite(Q, sizeof(double), M*M, Qp) != M*M){printf("Error: Q matrix write error! \n"); return 1; }
    fclose(Qp); 

    FILE* Rp = fopen("matR.dat", "w");  
    int dimR[2] = {M, N}; 
    if(fwrite(&dimR, sizeof(int), 2, Rp) != 2){printf("Error: R matrix dimension write error! \n"); return 1; }
    if(fwrite(R, sizeof(double), M*N, Rp) != M*N){printf("Error: R matrix write error! \n"); return 1; }
    fclose(Rp); 
    
    free(oriA); 
    free(A); 
    free(Q); 
    free(R); 
    return 0; 
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
    /* printf("%f. \n", result); */ 
    return result; 
}
