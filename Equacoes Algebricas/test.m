
f = @(x) exp(x).*sin(x) -1;
df = @(x) exp(x) .* (sin(x) .+ cos(x));


[x2, iter2] = Newton(f,df, 0, 1e-6)
[x, iter] = Secant(f,0, 1, 1e-6)
