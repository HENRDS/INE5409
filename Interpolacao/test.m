table = [-1 4; 0  1; 2 -1];
%table(:, 2) = log(table(:, 1));

a = Polinomial(table)
x =[-1:.01:2];
plot(x, Poli(a,x));
grid
hold on
