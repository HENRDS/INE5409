function x = nofuckinidea(px, py, m)
  n = length(px);
  for i = 1 : m + 1
    for j = i : m + 1
      A(i, j) = 0;
      for k = 1 : n
        A(i, j) += (px(k)^(j-1) * px(k)^(i-1));
        %A(i, j) += (exp(j-1) * exp(i-1));
      end
      A(j, i) = A(i, j);
    end
  end
  b(i) = 0;
  for k = 1 : n
    b(i) += (py(k) * px(k)^(i-1));
  end
  x = A\b';
end
