#include "util.h"

double bissection(double precision, double a, double b, Function f) {
	double fa = f(a), 
	xk = 0.0,
	fxk = 0.0; 
	int iters = 0;
	do {
		xk = (a + b) / 2.0;
		fxk = f(xk);
		if (fa * fxk  < 0) {
			b = xk;
		} else {
			a = xk;
			fa = fxk;
		}
		++iters;
	} while(abs(fxk) > precision);
	cout << "iters: " << iters << endl;
	return xk;
}

int main() 
{
	cout.precision(17);
	Function f = [](double x){ return exp(x) * sin(x) - 1.0; };
	cout << "x = " << bissection(1e-6, 0.0, 1.0, f);
	return 0;
}