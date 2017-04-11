A= [3 -1 -1;
    1  3  1;
    2 -2  4];
b= [1; 5; 4];    
[r, c] = size(A);
y = zeros(r, 1);
e = 1;
iters = 0;

while e > 10e-5
  for i=1: r
    soma = 0;    
    for j=1: r 
      if (j!=i)
        soma += A(i, j) * y(j);
      end
    end
    x(i) = (b(i) - soma) / A(i,i);
  end  
  e= max(abs(x - y));
  y=x;
  iters += 1;
end
x
iters