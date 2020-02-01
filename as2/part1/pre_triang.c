#include <stdio.h>
#include <stdlib.h>
#define print_pascal(n, k) double value = 1.0; \
	int m; \
	for(m=1; m<=k; m++){\
		value *= ((double)n+1.0-(double)m)/(double)m;} \
	printf("%d ", (int)value)


int pascal(int, int); 

int main(int argc, char** argv){
	int n = 5; 
	if(argc>1) n = atoi(argv[1]); 
	int i,j; 
	for(i=0; i<n; i++){
		for(j=0; j<=i; j++){
			//printf("%d ", pascal(i, j));
			print_pascal(i, j); }
		printf("\n"); }
}

/*int pascal(int n, int k){
	double value = 1.0; 
	int i; 
	for(i=1; i<=k; i++){
		value *= ((double)n+1.0f-(double)i)/(double)i;
       		//printf("now value is: %f. \n", value);
	}
	return ((int)value); 
}*/
