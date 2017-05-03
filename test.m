C=[ 4  2  3;
    2 -4 -1;
   -1  1 4
  ];
B = [7; 
     1; 
    -5];

X1 = LUDecomp2(C, B)
X2 = LUDecomp(C, B)

%f = @(x) exp(x).*sin(x) -1;
%df = @(x) exp(x) .* (sin(x) .+ cos(x));
%[x2, iter2] = Newton(f,df, 1, 1e-6)
