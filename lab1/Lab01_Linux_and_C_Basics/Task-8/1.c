#include <stdio.h>

void assign_string(char** s); 

int main(){
  char *s = "Hello"; 
  printf("String before: %s\n", s); 
  assign_string(&s); 
  printf("String after: %s\n", s); 
  return 0; 
}

void assign_string(char** a){
	char heap[] = "Modified! "; 
	*a = heap; 
}
