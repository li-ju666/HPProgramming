#include <stdio.h>
void print_int_1(int x){
	printf("Here is the number: %d. \n", x); }

void print_int_2(int x){
	printf("Here is another number: %d. \n", x); }

int main(){
	void (*foo1)(int x), (*foo2)(int x); 
	foo1 = &print_int_1; 
	foo2 = &print_int_2; 
	foo1(5); 
	foo2(10); }
