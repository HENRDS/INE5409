
function [xk, iter] = FalsaPosicao(f, a, b, prec)
  fa = f(a);
  fb = f(b);
  ac = 0;
  bc = 0;
  x = [a:0.1:b];
  CreatePlot(x, f);
  iter = 0;
  if fa * fb > 0
    xk = -1;
    return;
  end
  do
    xk = a - (fa * (b - a)) / (fb - fa);
    fxk = f(xk);
    r = fa + ((fb-fa)/(b-a)) * (x - a);
    doPlot(x, r);
    if fa * fxk < 0
      pa = fb / (fb + fxk);
      fa = pa * fa;
      
      b = xk; 
      fb = fxk;
      
      bc = bc + 1;
    else
      pb = fa / (fa + fxk);
      fb = pb * fb;
      
      a = xk;
      fa = fxk;
      
      ac = ac + 1;
    end
    iter = iter + 1;
    abs(fxk)
  until (abs(fxk) < prec)
  disp("mudanças de a: "); disp(ac);
  disp("mudanças de b: "); disp(bc);
end
function CreatePlot(x, f)
  
  y = f(x);
  plot(x, y);
  grid;
  hold on;
end
function doPlot(x, y)
  plot(x, y, 'r');
  hold on;
end