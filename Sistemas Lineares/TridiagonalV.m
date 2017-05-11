function x = TridiagonalV(d, r, t, b)
  %Tridiagonal with vectors
  n = size(r)(2);
  for k = 1 : n - 1
    m = t(k) / r(k);
    t(k) -= m * r(k);
    r(k + 1) -= m * d(k);
    b(k + 1) -= m * b(k);
  end
  
  printMatrix(d, r, t, b);
  %substitution for superior diagonal
  x = zeros(1, n);
  x(n) = b(n) / r(n);
  for k = n - 1 : -1 : 1
    x(k) = (b(k) - d(k) * x(k + 1)) /  r(k);
  end
end
function A = BuildA (d, r, t)
  n = size(r)(2);
  A = zeros(n, n);
  A(n, n) = r(n);
  for i = 1 : n - 1
    A(i, i + 1) = d(i);
    A(i, i) = r(i);
    if i > 1
      A(i, i - 1) = t(i - 1);
    end
  end
end
function printMatrix(d, r, t, b)
  n = size(r)(2);
  A = BuildA(d, r, t);
  A(:, n+1) = b;
  A
end
