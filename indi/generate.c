#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <sys/time.h>

/* #define M 3 */
/* #define N 2 */

int main(int argc, char* argv[]){
    

    int M, N; 
    M = atoi(argv[1]); 
    N = atoi(argv[2]); 
    printf("Dimension data: %d * %d. \n", M, N); 
    struct timeval randseed; 
    FILE* fp = fopen("input.dat", "w"); 
    double* data = malloc(M*N*sizeof(double));
    int dim[2] = {M, N}; 
    for(int i=0; i<M*N; i++){	
	gettimeofday(&randseed, NULL); 
	srand((unsigned)randseed.tv_usec); 
	/* printf("Now i is: %d. \n", i); */ 
        data[i] = ((double)rand())/(RAND_MAX/100); 
    }
    /* printf("Okay! \n"); */ 
    if(fwrite(&dim, sizeof(int), 2, fp) != 2){printf("Dimension write error! \n"); exit(1); }
    if(fwrite(data, sizeof(double), M*N, fp) != M*N){printf("Data write error! \n"); exit(1); }
    fclose(fp); 
    free(data); 
    return 0; 
}
