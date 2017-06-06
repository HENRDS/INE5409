function y = DivDiffs(x, px, py)
  n = length(px);
  M = zeros(n, n);
  M(:, 1) = py';
  for i = 2 : n
    for j = 2 : i
      M(i, j) = (M(i, j - 1) - M(i - 1, j - 1)) / (px(i) - px(i - j + 1));
    end
  end
  y = 0;
  for k = 1 : n
      p = M(k, k);
      for j = 1 : k-1
        p = p .* (x - px(j));
      end
      y += p;
  end
end
