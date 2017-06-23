#include <iostream>
#include "util.h"

double newton(double precision, double x0, Function f, Function df) {
	double xk = x0,
	fxk = 0.0; 
	int iters = 0;
	do {
		xk = xk - (f(xk) / df(xk));
		fxk = f(xk);
		++iters;
	} while(abs(fxk) > precision);
	cout << "iters: " << iters << endl;
	return xk;
}

int main() 
{
	cout.precision(17);
	Function f = [](double x){ return exp(x) * sin(x) - 1.0; };
	Function df = [](double x){ return exp(x) * (sin(x) + cos(x)); };
	cout << "x = " << newton(1e-6, 0.8, f, df);
	return 0;
}