A= [3 -1 -1;
    1  3  1;
    2 -2  4];
b= [1; 5; 4];    

[x,i] = GaussSeidel(A, b, 10e-5)
