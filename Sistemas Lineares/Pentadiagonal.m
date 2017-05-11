% e1 d1 c1 0  ... = b1
% f1 e2 d2 c2 ... = b2
% g1 f2 e3 d3 ... = b3
% 0  g2 f3 e4 ... = b4
function x = Pentadiagonal(c, d ,e, f, g, b)
  n = size(e)(2); % f[1,n]
  for i = 1 : n - 1
    m = f(i) / e(i);
    f(i) -= m * e(i);
    e(i + 1) -= m * d (i);
    b(i + 1) -= m * b(i);
    if i < n - 2
      d(i + 1) -= m * c(i);
      m = g(i) / e(i);
      g(i) = m * e(i);
      b(i + 2) -= m * b(i + 1);
    end
  end
  x = Retrosub(c, d, e, b);
end


function x = Retrosub(c, d ,e, b)
  n = size(e)(2);
  x(n) = b(n);
  x(n - 1) = (b(n - 1) - d(n - 1)) / e(n - 1);
  for i = n-2 : -1 : 1
    x(i) = (b(i) - (d(i) + c(i))) / e(i);
  end
end
