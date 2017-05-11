function [x, iters] = Newton(f, df, x0, prec)
  iters = 0;
  lim = 2;
  xx = [-lim:0.1:lim];
  CreatePlot(xx, f);
  
  while abs(f(x0)) > prec
    x = x0 - (f(x0) / df(x0));
    x0 = x;
    iters++;
  end
end

function CreatePlot(x, f)
  y = f(x);
  plot(x, y);
  grid;
  hold on;
end
