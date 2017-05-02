f = @(x) exp(x).*sin(x) -1;
%[x, iter] = Bissecao(f,0, 1, 1e-6)
[x, iter] = FalsaPosicao(f,0, 1, 1e-6)
