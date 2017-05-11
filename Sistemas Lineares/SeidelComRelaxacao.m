function [x, iters] = SeidelComRelaxacao(prec, A, b, w)
  n = size(A)(2);
  y = zeros(n, 1);
  x = zeros(n, 1);
  e = 1;
  iters = 0;

  while e > prec
    for i = 1 : n
      soma = 0;
      for j = 1 : n
        if j ~= i
            soma += A(i, j) * x(j);
        end
      end
      x(i) = (b(i) - soma) / A(i, i);
      x(i) = (1 - w) * y(i) + w * x(i);
    end
    e = max(abs(x - y));
    y = x;
    iters += 1;
  end
end
