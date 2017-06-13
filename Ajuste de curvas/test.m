px = [0:4];
py = [27 42 60 87 127];
m = 1;
c = nofuckinidea(px, py, m);
grid
plot(px, py, '*');
hold on
plot(px, Poli(px, c, m))
hold on
