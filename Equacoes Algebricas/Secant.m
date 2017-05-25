function [x, iters] = Secant(f, x0, x1, prec)
  iters = 0;
  xx = [x0:0.1:x1];
  CreatePlot(xx, f);

  while abs(f(x)) > prec
    fx0 = f(x0);
    fx1 = f(x1);

    r = fx0 + ((fx1-fx0)/(x1 -x0)) * (xx - x0);
    PlotLine(xx, r);

    x = x1 - (((x1 - x0) * fx1) / (fx1 - fx0));
    x0 = x1;
    x1 = x;

    iters++;
  end
end

function CreatePlot(x, f)
  y = f(x);
  plot(x, y);
  grid;
  hold on;
end

function PlotLine(x, r)
  plot(x, r, 'r')
  hold on
end
