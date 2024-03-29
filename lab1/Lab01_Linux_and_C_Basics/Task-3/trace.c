#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double** initialization(int);
void fill_vector(double*, int);
void print_matrix(double** , int);
double trace (double** , int);

// The main program.
int main()
{
  int n;
  double **matrix;
  double sum ;
  printf("\nEnter the Dimension for a square matrix:");
  scanf("%d",&n);
  matrix = initialization(n);
  for(int i=0 ; i < n ; i++)
  fill_vector(matrix[i] , n);
  sum = trace(matrix , n);
  print_matrix(matrix , n);
  printf("\n Sum of the diagonal elements are: %2.3f. \n", sum);
  return 0;
}


// The initialization routine is supposed to allocate memory for
// a n-by-n matrix and return a pointer to the allocated matrix.
double** initialization(int n)

{
  double** matrix ;
  matrix = calloc(n , sizeof(double *));
  for(int i=0 ; i<n ; i++)
    matrix[i] = calloc(n , sizeof(double));
  return (matrix);
}

// The fill_vector routine is supposed to fill a given vector with
// random numbers ranging from -10 to 10.
void fill_vector(double* vec , int n)
{
  for(int i = 0 ; i < n ; i++)
    vec[i] = rand() % 90 + 10 ;
}

// The print_matrix routine is supposed to print out the elements of
// a given matrix in a nice format using printf.
void print_matrix(double** matrix , int n)

{
  for (int i=0 ; i < n ; i++)
    {
    for(int j=0 ; j < n ; j++)
      printf("%2.3f " , matrix[i][j]);
    putchar('\n');
    }
}

// The trace routine is supposed to return the sum of the diagonal
// elements of a given matrix.
double trace (double** matrix , int n)
{
  double sum = 0.0;
  for(int i=0 ; i < n ; i++)
    sum += matrix[i][i];
  return sum;
}
