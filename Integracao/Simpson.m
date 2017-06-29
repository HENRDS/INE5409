function A = Simpson(n, f, a, b)
  h = (b - a) / n;
  A = 0;
  for i = 1 : n - 1
    k = mod(i, 2) + 1;
    A += (2 * k) * f(a + (i * h));
  end
  A = (h / 3) * (f(a) + A + f(b));
end
