#include <omp.h>
#include <stdio.h>

int main(){
    int a = 1, b = 2; 
#pragma omp parallel num_threads(10)
    {	
	printf("Hello World! \n"); 
    }
    printf("a: %d, b: %d \n", a, b); 
}
