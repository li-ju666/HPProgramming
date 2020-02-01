#include <stdio.h>

void print(int, int); 

int main(){
	int dim1, dim2; 
	printf("\nPlease input dimension 1: ");
	scanf("%d", &dim1); 
	printf("\n Please input dimension 2: "); 
	scanf("%d", &dim2); 
	print(dim1, dim2); 
}

void print(int dim1, int dim2){
	for(int i=0; i<dim2; i++){
		if(i==0 || i == dim2-1){
			for (int j=0; j<dim1; j++){printf("*");}}
		else{
	  		printf("*"); 
			for(int j=1; j<dim1-1; j++){printf(".");}
	    		printf("*");}
		printf("\n");
	}
}
