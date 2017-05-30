function y = Poli(a, x)
  n = length(x);
  for k = 1 : n
    y(k) = 0;
    for i = 1 : length(a)
      y(k) += a(i) * (x(k) ^ (i-1));
    end
  end
end
