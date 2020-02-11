#include "testfuncs.h"

void f_std(const double * __restrict a, 
	   const double * __restrict b, 
	   double * __restrict c, int N) {
  int i;
  double x = 0.3;
  for(i = 0; i < N; i++) {
    c[i] = a[i]*a[i] + b[i] + x;
  }
}

void f_opt(const double * __restrict a, 
	   const double * __restrict b, 
	   double * __restrict c, int N) {
  int i;
  double x = 0.3;
  for(i = 0; i < N; i=i+20) {
    c[i] = a[i]*a[i] + b[i] + x;
    c[i+1]=a[i+1]*a[i+1]+b[i+1]+x; 
    c[i+2]=a[i+2]*a[i+2]+b[i+2]+x; 
    c[i+3]=a[i+3]*a[i+3]+b[i+3]+x; 
    c[i+4]=a[i+4]*a[i+4]+b[i+4]+x; 
    c[i+5]=a[i+5]*a[i+5]+b[i+5]+x; 
    c[i+6]=a[i+6]*a[i+6]+b[i+6]+x; 
    c[i+7]=a[i+7]*a[i+7]+b[i+7]+x; 
    c[i+8]=a[i+8]*a[i+8]+b[i+8]+x; 
    c[i+9]=a[i+9]*a[i+9]+b[i+9]+x; 
    c[i+10] = a[i+10]*a[i+10] + b[i+10] + x;
    c[i+11]=a[i+11]*a[i+11]+b[i+11]+x; 
    c[i+12]=a[i+12]*a[i+12]+b[i+12]+x; 
    c[i+13]=a[i+13]*a[i+13]+b[i+13]+x; 
    c[i+14]=a[i+14]*a[i+14]+b[i+14]+x; 
    c[i+15]=a[i+15]*a[i+15]+b[i+15]+x; 
    c[i+16]=a[i+16]*a[i+16]+b[i+16]+x; 
    c[i+17]=a[i+17]*a[i+17]+b[i+17]+x; 
    c[i+18]=a[i+18]*a[i+18]+b[i+18]+x; 
    c[i+19]=a[i+19]*a[i+19]+b[i+19]+x; 









  }
}

