
function [x, iters] = GaussSeidel(A, b, prec)
  [r, c] = size(A);
  y = zeros(r, 1);
  x = zeros(r, 1);
  e = 1;
  iters = 0;

  while e > prec
    for i=1: r
      soma = 0;
      for j=1: r
        if (j ~= i)
          soma += A(i, j) * x(j);
        end
      end
      x(i) = (b(i) - soma) / A(i,i);
      %x(i) = (1 - w) * y(i) + w * x(i); relaxacao
    end
    e= max(abs(x - y));
    y=x;
    iters += 1;
  end
end
