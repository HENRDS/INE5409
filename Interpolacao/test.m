table = [1 1.5 2]';
table(:, 2) = log(table(:, 1));

a = Polinomial(table);
x =[1:.01:2];
grid
plot(x, Poli(a,x));
hold on
plot(x, log(x), 'r');
hold on
