px = [-1 0 2];
py = [4 1 -1];
x =[-1:.01:2];
plot(x, Lagrange(x, px, py));
grid
hold on
% plot(x, Poli(Polinomial(px, py),x), 'r')
% hold on
