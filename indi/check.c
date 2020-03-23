#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define TEST 0

void visualize(double*, int, int); 
double dotmult(double*, int, int, int); 

int main(int argc, char* argv[]){
    /* check if input file parameter is given */
    if(argc != 4){
	printf("Error: 4 input parameter expected! \n"); 
	return 1; 
    }
    /* read dimension data from input  file */
    int MA, NA, MQ, NQ, MR, NR; 
    FILE* Ap = fopen(argv[1], "r"); 
    if(Ap == NULL){printf("Error: Invalid input file! \n"); return 1; }
    if(fread(&MA, sizeof(int), 1, Ap) != 1){printf("Error: Dimension 1 read failed! \n"); return 1; }
    if(fread(&NA, sizeof(int), 1, Ap) != 1){printf("Error: Dimension 2 read failed! \n"); return 1; }
    if(MA<NA){
	printf("Invalid dimension! M >= N expected! \n"); 
	return 1; 
    }
    printf("Dimension: %d * %d. \n", MA, NA);

    /* Matrix variable preparation */
    double* A = malloc(MA*NA*sizeof(double)); 

    /* read matrix data from input file */
    if(fread(A, sizeof(double), MA*NA, Ap) != MA*NA){
	printf("Error: Matrix data read failed! \n"); 
	return 1; 
    }
    fclose(Ap);

    FILE* Qp = fopen(argv[2], "r"); 
    if(Qp == NULL){printf("Error: Invalid input file! \n"); return 1; }
    if(fread(&MQ, sizeof(int), 1, Qp) != 1){printf("Error: Dimension 1 read failed! \n"); return 1; }
    if(fread(&NQ, sizeof(int), 1, Qp) != 1){printf("Error: Dimension 2 read failed! \n"); return 1; }
    if(MQ != NQ){
	printf("Invalid dimension! M = N expected! \n"); 
	return 1; 
    }
    printf("Dimension: %d * %d. \n", MQ, NQ);

    /* Matrix variable preparation */
    double* Q = malloc(MQ*NQ*sizeof(double)); 

    /* read matrix data from input file */
    if(fread(Q, sizeof(double), MQ*NQ, Qp) != MQ*NQ){
	printf("Error: Matrix data read failed! \n"); 
	return 1; 
    }
    fclose(Qp);

    FILE* Rp = fopen(argv[3], "r"); 
    if(Rp == NULL){printf("Error: Invalid input file! \n"); return 1; }
    if(fread(&MR, sizeof(int), 1, Rp) != 1){printf("Error: Dimension 1 read failed! \n"); return 1; }
    if(fread(&NR, sizeof(int), 1, Rp) != 1){printf("Error: Dimension 2 read failed! \n"); return 1; }
    if(MR <= NR){
	printf("Invalid dimension! M = N expected! \n"); 
	return 1; 
    }
    printf("Dimension: %d * %d. \n", MR, NR);

    /* Matrix variable preparation */
    double* R = malloc(MR*NR*sizeof(double)); 

    /* read matrix data from input file */
    if(fread(R, sizeof(double), MR*NR, Rp) != MR*NR){
	printf("Error: Matrix data read failed! \n"); 
	return 1; 
    }
    fclose(Rp);

    if(MA != MQ || NA != NR || MA != MR){
	printf("Error: 3 given input matrices not matched! \n"); 
	return 1; 
    }
    printf("All dimension check passed! \n"); 

    /* to check if all modules of Q's column vectors are 1 and save the max error */
    double max_mod_dif = 0, module = 0; 
    /* module check */
    for(int i=0; i<MQ; i++){
	module = 0; 
	for(int j=0; j<MQ; j++){
	    module += Q[i*MQ+j] * Q[i*MQ+j];
	    /* printf("Now module is: %.5f \n", module); */  
	}
	if((1-module) > max_mod_dif){max_mod_dif = 1-module; }
    }
    /* printf("Max module dif is %.5f. \n", max_mod_dif); */ 
    
    /* to check if matrix R is triangular matrix */
    for(int i=0; i<NR; i++){
	for(int j=i+1; j<MR; j++){
	    if(R[i*MR+j] != 0){
		printf("R is not triangular matrix! \n"); 
		return 1; 
	    }
	}
    }
    printf("R is triangular matrix! \n"); 

    /* to check if vectors in Q are orthogonal */
    for(int i=0; i<NQ; i++){
	for(int j=0; j<i; j++){
		if(abs(dotmult(Q, i, j, MQ))>10e-8){
		    printf("Vectors are not orthogonal! \n"); 
		}
	}
	for(int j=i+1; j<NQ; j++){
		if(abs(dotmult(Q, i, j, MQ))>10e-8){
		    printf("Vectors are not orthogonal! \n"); 
		}
	}

    }
    printf("Matrix Q is orthogonal! \n"); 
    
    double* resultA = malloc(MA*NA*sizeof(double)); 
    /* to check if Q*R is still A */
    for(int i=0; i<NA; i++){
	for(int j=0; j<MA; j++){
	    double sum = 0; 
	    for(int m=0; m<MA; m++){
		sum += Q[m*MA+j] * R[i*MA+m]; 
	    }
	    resultA[i*MA+j] = sum; 
	}
    }
    for(int i=0; i<MA*NA; i++){
        /* printf("%d \n", abs(resultA[i] - A[i])); */ 
	if(abs(resultA[i] - A[i]) > 10e-8){
	    printf("Q*R is not equal to A. \n"); 
	    return 1; 
	}
    }
    printf("Q*R is equal to A! \n"); 
    /* visualize(A, MA, NA); */ 
    /* visualize(resultA, MA, NA); */ 
    free(A);
    free(Q); 
    free(R); 
    free(resultA); 
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

double dotmult(double* Q, int a, int b, int length){
    double result = 0; 
    for(int i=0; i<length; i++){
	result += Q[a*length+i] * Q[b*length+i]; 
    }
    /* printf("Dot multiple result is: %.5f. \n", result); */ 
    return result; 
}
