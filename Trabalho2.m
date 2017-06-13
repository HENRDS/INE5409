% Dados do problema
velocidade = [55 70 85 100 120 140];
consumo = [14.08 13.56 13.28 12.27 11.30 10.4];
xAxis = [0 : 140];
x = 105
% polinômio interpolador
function a = Polinomial(px, py)
  n = length(px);
  for i = 1 : n
    for j = 1 : n
      M(i, j) = px(i) ^ (j-1);
    end
  end
  a = EliminacaoGauss(M, py);
end

function x = EliminacaoGauss(A, b)
  r = size(A)(1);
  o = [1:r];
  for k = 1 : r-1
    o = PivotamentoParcial(A, k, o);
    for i=k+1 : r
      mul = A(o(i),k) / A(o(k), k);
      A(o(i), :) = A(o(i), :) - mul * A(o(k), :) ;
      b(o(i)) = b(o(i)) - mul * b(o(k));
    end
  end
  x = RetroSubSuperior(A, b, o);
end


function r = PivotamentoParcial (A, k, o)
  r = size(A);
  maior = abs(A(o(k), k));
  pivo = k;
  for i = k + 1 : r
    if abs(A(o(i), k)) > maior
      maior = abs(A(o(i), k));
      pivo = i;
    end
  end
  if pivo > k
    aux=o(pivo);
    o(pivo)=o(k);
    o(k)=aux;
  end
  r = o;
end

function x = RetroSubSuperior(A, b, o)
  n = size(A)(1);
  x = zeros(n, 1);
  x(n) = b(o(n)) / A(o(n),n);
  for i = n - 1 : -1 : 1
    j =  i + 1;
    soma = A(o(i), j : n) * x(j : n);
    x(i) = (b(o(i)) - soma) / A(o(i), i);
  end
end

% Resolve polinomio de grau n com coeficientes a para x
function y = Poli(a, x)
  n = length(x);
  for k = 1 : n
    y(k) = 0;
    for i = 1 : length(a)
      y(k) += a(i) * (x(k) ^ (i-1));
    end
  end
end
% Lagrange
function y = Lagrange (px, py, x)
  n = length(px);
  L = ones(n, length(x));
  y = 0;
  for i = 1 : n
    for j = 1 : n
      if j ~= i
        L(i,:) = L(i,:) .* (x - px(j)) / (px(i) - px(j));
      end
    end
    y += py(i) * L(i, :);
  end
end

%  Diferenças Divididas de Newton
function y = DivDiffs(px, py, x)
  n = length(px);
  M = zeros(n, n);
  M(:, 1) = py';
  for i = 2 : n
    for j = 2 : i
      M(i, j) = (M(i, j - 1) - M(i - 1, j - 1)) / (px(i) - px(i - j + 1));
    end
  end
  y = 0;
  for k = 1 : n
      p = M(k, k);
      for j = 1 : k-1
        p = p .* (x - px(j));
      end
      y += p;
  end
end
% Graficos

grid

a = Polinomial(velocidade, consumo);
y = Poli(a, x);
disp('Usando Polinômio interpolador f(x):'); disp(y);
plot(x, y, 'o');
hold on

plot(xAxis, Poli(a, xAxis));
hold on

y = Lagrange(velocidade, consumo, x);
disp('Usando Lagrange f(x):'); disp(y);
plot(x, y, 'or');
hold on

plot(xAxis, Lagrange(velocidade, consumo, xAxis), 'r');
hold on

y = DivDiffs(velocidade, consumo, x);
disp('Usando Diferenças Divididas de Newton f(x):'); disp(y);

plot(x, y, 'og');
hold on

plot(xAxis, DivDiffs(velocidade, consumo, xAxis), 'g');
hold on

y = spline(velocidade, consumo, x);
disp('Usando Spline f(x):'); disp(y);
plot(x, y, 'oc');
hold on

plot(xAxis, spline(velocidade, consumo, xAxis), 'c');
hold on
