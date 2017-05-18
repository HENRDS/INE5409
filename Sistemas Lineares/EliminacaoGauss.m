function x = EliminacaoGauss(A, b)
  r = size(A);
  o = [1:r];
  for k = 1 : r-1
    o = PivotamentoParcial(A, k, o);
    for i=k+1 : r
      mul = A(o(i),k) / A(o(k), k)
      A(o(i), :) = A(o(i), :) - mul * A(o(k), :) ;
    end
  end
  x = RetroSubSuperior(A, b)
end


function r = PivotamentoParcial (A, k, o)
  r = size(A);
  maior = abs(A(o(k), k));
  pivo = k;
  for i = k + 1 : r
    if abs(A(o(i), k)) > maior
      maior = abs(A(o(i), k));
      pivo = i;
    end
  end
  if pivo > k
    aux=o(pivo);
    o(pivo)=o(k);
    o(k)=aux;
  end
  r = o;
end

function x = RetroSubSuperior(A, b)
  n = size(A)(1);
  x = zeros(1, n);
  x(n) = b(n) / A(n,n);
  for i = n - 1 : -1 : 1
    j =  i + 1;
    soma = sum(A(i, j : n) .* x(j : n));
    x(i) = (b(i) - soma) / A(i, i);
  end
end
