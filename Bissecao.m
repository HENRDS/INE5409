
function [xm, iter] = Bissecao(f, a, b, prec)
  fa = f(a);
  iter = 0;
  ac = 0;
  bc = 0;
  do
    xm = (a + b) / 2;
    fxm = f(xm);
    if (fa*fxm < 0)
      b = xm;
      bc =  bc + 1;
    else
      a = xm;
      fa = fxm;
      ac =  ac + 1;
    end
    iter = iter + 1;
  until (abs(fxm) < prec)
  disp("mudanças de a: "); disp(ac);
  disp("mudanças de b: "); disp(bc);
end