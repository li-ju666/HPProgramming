#include <stdio.h>

int main(){
	FILE* fp = fopen("little_bin_file", "r"); 
	if(fp==NULL){
	printf("Error: Open little_bin_file fail! \n"); 
	return 1; }
	
	int read_int; 
        if(fread(&read_int, sizeof(int), 1, fp) == 1);
	
	double read_double; 
        if(fread(&read_double, sizeof(double), 1, fp)==1); 
	
	char read_char; 
	if(fread(&read_char, sizeof(char), 1, fp)==1); 

	float read_float; 
	if(fread(&read_float, sizeof(float), 1, fp)==1); 

	fclose(fp); 
	
	printf("%d\n", read_int); 
	printf("%f\n", read_double); 
	printf("%c\n", read_char); 
	printf("%f\n", read_float); 
} 
