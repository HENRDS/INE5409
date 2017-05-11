function x = RetroSubSuperior(A, b) % Outras
function x = RetrosubSuperior(d, r, b) % Tridiagonal
  n = size(A)(1); % Outras
  n = size(A)(2); % Tridiagonal
  x = zeros(1, n);
  x(n) = b(n) / A(n,n); % Gauss, LU simples
  x(n) = b(n); % LU com uma matriz
  x(n) = b(n) / r(n); % Tridiagonal
  for i = n - 1 : -1 : 1
    j =  i + 1;
    soma = sum(A(i, j : n) .* x(j : n));
    x(i) = (b(i) - soma) / A(i, i); % Gauss, LU simples
    x(i) = b(i) - soma; % LU com uma matriz
    x(i) = (b(i) - d(i) * x(i + 1)) /  r(i); % Tridiagonal
  end
end
