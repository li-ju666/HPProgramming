#include <stdio.h>


int main(){
    int a = 3; 
    int* restrict ptr_a0 = &a; 
    int* ptr_a1 = ptr_a0; 
    printf("This is a, ptr_a0 and ptr_a1: %d, %d, %d! \n", a, *ptr_a0, *ptr_a1);
}
