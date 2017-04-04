C=[ 4  2  3;
    2 -4 -1;
   -1  1 4
  ];
B = [7; 
     1; 
    -5];

[L,U] = LUDecomp(C);
y = RetroSubInferior(L, B);
x = RetroSubSuperior(U, y);

x

function [L, U] = LUDecomp(A)
  n = size(A);
  L = zeros(n);
  U = eye(n);
  for k = 1 : n
    for i = k : n
      z = k-1;
      % linha i, de 1 ate z 
      row = L(i, 1 : z);
      % coluna k, de 1 ate z 
      col = U(1 : z, k);
      
      L(i, k) = A(i, k) - (row * col);
      if (i > k)
        % linha k, de 1 ate z 
        row = L(k, 1 : z);
        % coluna i, de 1 ate z 
        col = U(1 : z, i);
        U(k, i) = (A(k, i) - (row * col)) / L(k, k);
      end 
    end
  end
end

function x = RetroSubSuperior(A, b)
  n = size(A)(1);
  x = zeros(1, n);
  x(n) = b(n) / A(n,n);
  for i = n - 1 : -1 : 1
    j =  i + 1;
    soma = sum(A(i, j : n) .* x(j : n));
    x(i) = (b(i) - soma) / A(i, i);
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

