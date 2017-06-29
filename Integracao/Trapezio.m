function A = Trapezio(n, f, a, b)
  h = (b - a) / n;
  A = 0;
  for i = 1 : n - 1
      A += f(a + (i * h));
  end
  A = (h / 2) * (f(a) + 2 * A + f(b));
end
