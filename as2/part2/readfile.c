#include <stdio.h>

struct read_data{
	int read_int; 
	double read_double; 
	char read_char; 
	float read_float; 
}; 

int main(){
	FILE* fp = fopen("little_bin_file", "r"); 
	if(fp==NULL){
	printf("Error: Open little_bin_file fail! \n"); 
	return 1; }
	
	int read_int; 
        fread(&read_int, sizeof(int), 1, fp); 
	//fp = (FILE*)((void*)fp + sizeof(int)); 
	
	double read_double; 
        fread(&read_double, sizeof(double), 1, fp); 
	//fp+=sizeof(double); 
	
	char read_char; 
	fread(&read_char, sizeof(char), 1, fp); 
	//fp+=sizeof(char); 

	float read_float; 
	//fread(&read_float, sizeof(float), 1, fp); 


	/*struct read_data newdata; 
	fread(&newdata, sizeof(newdata), 1, fp); */
	fclose(fp); 

	/*printf("%d\n", newdata.read_int); 
	printf("%f\n", newdata.read_double); 
	printf("%c\n", newdata.read_char); 
	printf("%f\n", newdata.read_float);*/






	printf("%d\n", read_int); 
	printf("%f\n", read_double); 
	printf("%c\n", read_char); 
	printf("%f\n", read_float); 
} 
