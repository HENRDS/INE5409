
c = [1 1 1 1 ];
d = [1 1 1 1 1];
e = [2 2 2 2 2 2];
f = [1 1 1 1 1];-
g = [1 1 1 1 ];

b = [0 1 2 1 2 2];
x = Pentadiagonal(c, d, e, f, g, b)
x = TridiagonalV(d, r, t, b)

C = [4 2 3 ;
      2 -4 -1;
      -1 1 4];
B =[7; 1; -5];
[x1, i1] = GaussSeidel(C, B, 1e-6)
[x2, i2 ] = SeidelComRelaxacao( 1e-6, C, B, .8)
% y = LUDecomp2(C, B)
