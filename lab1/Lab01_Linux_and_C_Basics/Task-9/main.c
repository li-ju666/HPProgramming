#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(){
  int n=0; 
  printf("Please input the length of the array: \n"); 
  scanf("%d", &n); 
  int* array =(int*) malloc(n*sizeof(int)); 
  for(int i=0; i<n; i++){
    printf("Please input the %d number: \n", i+1); 
    scanf("%d", &array[i]); 
    }
  //for(int i=0; i<n; i++) printf("%d", array[i]); 

}
