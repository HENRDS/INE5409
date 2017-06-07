function y = Lagrange (x, px, py)
  n = length(px);
  L = ones(n, length(x));
  y = 0;
  for i = 1 : n
    for j = 1 : n
      if j ~= i
        L(i,:) = L(i,:) .* (x - px(j)) / (px(i) - px(j));
      end
    end
    y += py(i) * L(i, :);
  end
end
