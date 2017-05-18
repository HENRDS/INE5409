function [x, iters] = BirgeVieta(prec, x0, a)
  degree = length(a);
  iters = 0;
  do
    b(1) = a(1);
    c(1) = b(1);
    for i = 2 : degree
      b(i) =  b(i-1) * x0 + a(i);
      if i < degree
        c(i) = c(i-1) * x0 + b(i);
      end
    end
    x0 = x0 - b(degree) / c(degree - 1);
    iters += 1;
  until (b(degree) < prec)
  x = x0;
end
