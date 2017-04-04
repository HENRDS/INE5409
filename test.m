A=[ 1 1 2 8;
    -1 -2 3 1;
   3 -7 4 10
  ];

function resvec = PivotamentoParcial (A, k, o)
  r = size(A); 
  maior = abs(A(o(k), k));
  pivo = k;
  
  for i = k + 1 : r
    if abs(A(o(i), k)) > maior
      maior = abs(A(o(i), k));
      pivo = i
    end
  end
  
  if pivo > k
    aux=o(pivo);
    o(pivo)=o(k);
    o(k)=aux;
  end 
  resvec = o;
end

function resmat = EliminacaoGauss(A)
  r = size(A); 
  o = [1:r];
  for k = 1 : r-1
    o = PivotamentoParcial(A, k, o)
    for i=k+1 : r
      mul = A(i,k) / A(k, k);
      A(i, :) = A(i, :) - mul * A(k, :) ;
    end
  end
  resmat = A;
end

%Retrosubstituicao
function x = Solve(A)
  [r, c] = size(A); 
  b = A(:,c);
  x = [0 0 0];
  e = c-1;
  x(r) = b(r) / A(r,r);
  for i = r - 1 : -1 : 1
    j =  i + 1;
    soma = sum(A(i, j : e) .* x(j : e));
    x(i) = (b(i) - soma) / A(i, i);
  end
end

A = EliminacaoGauss(A);
x = Solve(A);
x


