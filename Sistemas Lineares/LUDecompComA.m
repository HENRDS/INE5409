% LU decomposition using only A
function x = LUDecompComA(A, B)
  [r, c] = size(A);
  for k = 1 : r
    for i = k : r
      z = k - 1;
      row = A(i, 1 : z);
      col = A(1 : z, k);
      A(i, k) = A(i, k) - (row * col);
      if (i > k)
        row = A(k, 1 : z);
        col = A(1 : z, i);
        A(k, i) = (A(k, i) - (row * col)) / A(k, k);
      end
    end
  end
  % A * y = B
  y = RetroSubInferior(A, B);
  % A * x = y
  x = RetroSubSuperior(A, y);
end

function x = RetroSubSuperior(A, b)
  n = size(A)(1);
  x = zeros(1, n);
  x(n) = b(n);
  for i = n - 1 : -1 : 1
    j =  i + 1;
    soma = sum(A(i, j : n) .* x(j : n));
    x(i) = b(i) - soma;
  end
end

function y = RetroSubInferior(A, b)
  n = size(A);
  y = zeros(1, n);
  y(1) = b(1) / A(1, 1);
  for i = 2 : n
    j = i - 1;
    soma = sum(A(i, 1 : j) .* y(1 : j));
    y(i) = (b(i) - soma) / A(i, i);
  end
end
