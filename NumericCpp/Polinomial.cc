#include "util.h"
	

double *retroSub(const int n, const double matrix[n][n], const double b[n])
{
	double x[n];
	x[n-1] = b[n-1] / matrix[n-1][n-1];
	for (int i = n - 2; i > 0; --i) {
		double sum = 0.0;
		for(int j = i-1; !matrix[i][j]; --j) {
			sum += matrix[i][j] * x[j];
		}
		x[i] = (b[i] - sum) / matrix[i][i]; 
	}
	return &x;
}

double *gauss(const int n, double &matrix[n][n], const double b[n]) 
{
	for(int k = 0; k < n; ++k) {
		for(int i = 0; i < n; ++i) {
			double m = matrix[i][k] / matrix[k][k];
			for(int j = 0; j < n; ++j) {
				matrix[i][j] -= m * matrix[k][j];
			}
		}
	}
	return retroSub(matrix, b);
}

double *interpolate (const int length, const double x[length], const double y[length])
{
	double m[length][length];
	for(int i = 0; i < length; ++i) {
		for(int j = 0; j < length; ++j) {
			m[i][j] = pow(x[i][0], j);
		}
	}
	return gauss(n, m, y);
}


int main (int argc, char *argv[])
{
	if (--argc & 1)
		exit(1);
	argv++;
	int n = argc >> 1, i = 0;
	double x[n], y[n];
	do {
		if (i & 1)
			y[i] = atof(*argv);
		else
			x[i] = atof(*argv)
		++argv;
	} while(*argv);
	interpolate(n, x, y);
}