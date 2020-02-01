#include <stdio.h>
#include <math.h>

void check(int a); 

int main(){
	int a; 
	printf("Please input the number to be checked: \n"); 
	scanf("%d", &a); 
	check(a); 
}

void check(int a){
	int s = (int)sqrt(a); 
	if(s*s == a){printf("The input number is perfect square! \n"); }
	else{printf("The input number is not perfect square! \n"); }
}
