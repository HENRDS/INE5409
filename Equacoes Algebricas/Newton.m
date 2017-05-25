function [x, iters] = Newton(f, df, x0, prec)
  iters = 0;
  x = x0;
  fxk = f(x);
  while abs(fxk) > prec
    x = x - (fxk / df(x));
    iters++;
  end
end
