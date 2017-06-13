function g = Poli(px, c, m)
  n = length(px);
  for i = 1 : n
    g(i) = 0;
    for k = 1 : m + 1
      g(i) += c(k) * px(k) ^(k-1);
    end
  end
end
