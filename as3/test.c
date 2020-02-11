#include <stdio.h>

struct newstruct{
    int a;
    char b; 
    int c;
    char e; 
    double d;  
};

int main(){
    printf("The size of the struct is: %ld. \n", sizeof(struct newstruct)); 
    printf("The size of int is: %ld. \n", sizeof(int)+2*sizeof(char)+sizeof(int)+sizeof(double)); 
}
