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
	
	double read_double; 
        fread(&read_double, sizeof(double), 1, fp); 
	
	char read_char; 
	fread(&read_char, sizeof(char), 1, fp); 

	float read_float; 
	fread(&read_float, sizeof(float), 1, fp); 
	printf("Now the status of fp is: %d. \n", feof(fp)); 
	fclose(fp); 

	printf("%d\n", read_int); 
	printf("%f\n", read_double); 
	printf("%c\n", read_char); 
	printf("%f\n", read_float);


	struct read_data newdata; 
	FILE* np = fopen("little_bin_file", "r"); 	
	fread(&newdata, sizeof(newdata), 1, np);
	printf("Now the status of fp is: %d. \n", feof(np)); 
	fclose(np); 
	printf("%d\n", newdata.read_int); 
	printf("%f\n", newdata.read_double); 
	printf("%c\n", newdata.read_char); 
	printf("%f\n", newdata.read_float); 
	
	printf("the size of the group is: %ld. \n", sizeof(int)+sizeof(double)+sizeof(char)+sizeof(float)); 
	printf("the size of the struct is: %ld. \n", sizeof(struct read_data)); 

} 
