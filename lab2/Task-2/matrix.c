#include <stdio.h>
#include <stdlib.h>

int** generate(int n); 
void print(int** matrix, int n); 
void free_matrix(int** matrix, int n); 

int main(){
	int n; 
	printf("Please input the size of desired matrix: \n"); 
	scanf("%d", &n); 
	int** matrix = generate(n); 
	print(matrix, n); 
	free_matrix(matrix, n); 
}

int** generate(int n){
	int** matrix = malloc(n*sizeof(int*)); 
	for(int i=0; i<n; i++){
		matrix[i] = (int*)malloc(n*sizeof(int)); }
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			if(i>j){matrix[i][j]=-1; }
			else if(i==j){matrix[i][j]=0; }
			else(matrix[i][j]=1);}
	}
	return matrix; }

void print(int** matrix, int n){
	for(int i=0; i<n; i++){
		for(int j=0; j<n; j++){
			printf("%d", matrix[i][j]);}
		printf("\n"); }
}

void free_matrix(int** matrix, int n){
	for(int i=0; i<n; i++){
		free(matrix[i]); }
	free(matrix); }
