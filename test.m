
% f = @(x) exp(x).*sin(x) -1;
% df = @(x) exp(x) .* (sin(x) .+ cos(x));


%[x2, iter2] = Newton(f,df, 0, 1e-6)
%[x, iter] = Secant(f,0, 1, 1e-6)



c = [1 1 1 1 ];
d = [1 1 1 1 1];
e = [2 2 2 2 2 2];
f = [1 1 1 1 1];-
g = [1 1 1 1 ];

b = [0 1 2 1 2 2];
x = Pentadiagonal(c, d, e, f, g, b)
%x = TridiagonalV(d, r, t, b)

% C = [4 2 3 ;
%       2 -4 -1;
%       -1 1 4];
% B =[7; 1; -5];
% x = LUDecomp3(C, B)
% y = LUDecomp2(C, B)
