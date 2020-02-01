#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv){
	// Defailt number of layer is set to be 5. 
	int n = 5; 
	// To read the input number as number of layer
	if(argc>1) n = atoi(argv[1]);
	//i and j are initialized. i is the index of current layer while j is the index of
	//current operating number of layer i. 
	int i, j; 
	//A array of unsigned integars are initialized as all the values are positive, to
	//represent the numbers of layer i. The array will update as i increase. 
        unsigned int array[n];
	array[0]=1; 
	//Two integars are initialized to save the result of previous iteration step and 
	//current iteration step. 
        unsigned int prev_value, cur_value; 

	for(i=0; i<n; i++){
		// To set the last number of the layer to be 1. 
		array[i]=1; 
		// To print the first value, which is certainly 1. 
		printf("%d ", 1); 
		prev_value = cur_value = 1; 

		for(j=1; j<=i-1; j++){
			// To save the result of current step. 
			cur_value = array[j-1] + array[j]; 
			printf("%u ", cur_value); 
			// To assign the previous result to the previous number. 
			array[j-1] = prev_value; 
			prev_value = cur_value; 
		}
		// In the last step, set the result to the last non-1 number. 
		array[i-1] = prev_value; 
		// To print the last value, which is certainly 1. 
		if(i>0){printf("%d ", 1); }
		printf("\n"); } 
}	


