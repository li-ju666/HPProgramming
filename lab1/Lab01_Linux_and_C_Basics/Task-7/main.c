#include <stdio.h>

int main(){
  double a=1.0, b=1.1, c=1.2; 
  double *ap=&a, *bp=&b, *cp=&c;
  printf("a - value: %f, address: %x, memory size: %d\n", a, ap, sizeof(a));
  printf("b - value: %f, address: %x, memory size: %d\n", b, bp, sizeof(b)); 
  printf("c - value: %f, address: %x, memory size: %d\n", c, cp, sizeof(c)); 
}
