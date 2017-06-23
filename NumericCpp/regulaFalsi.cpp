#include "util.h"


double regulaFalsi(double precision, double a, double b, Function f) {
	double fa = f(a),
	fb = f(b), 
	xk = 0.0,
	fxk = 0.0; 
	int iters = 0;
	do {
		xk = a - ((fa * (b - a)) / (fb - fa));
		fxk = f(xk);
		if (fa * fxk  < 0) {
			b = xk;
			fb = fxk;
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
	cout << "x = " << regulaFalsi(1e-6, 0.0, 1.0, f);
	return 0;
}