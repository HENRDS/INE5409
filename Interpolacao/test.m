px = [-3 -2 1 3];
py = [-1 2 -1 10 ];
x =[0:12];
yy = spline(px, py, x)
plot(x, yy)
grid;
hold on
y = DivDiffs(x, px, py)
plot(x, y, 'r')
hold on
