#include <stdio.h>
#include <sys/time.h>

double get_wall_seconds(){
	struct timeval tv; 
	gettimeofday(&tv, NULL); 
	double seconds = tv.tv_sec + (double)tv.tv_usec/1000000; 
	return seconds; }

int main() {
  int k;
  double d = 1.0;
  double t1 = get_wall_seconds(); 
  for(k = 0; k < 500000000; k++)
    {
      d *= 1.0000000000001;
    }
  printf("Time consumed: %f. \n", get_wall_seconds()-t1); 
  printf("%20.13f\n", d);
  return 0;
}
