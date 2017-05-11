A=[1 -1 1; 2 3 -1; -3 1 1];
a1=A;
b=[1;4;-1];
b1=b;
n=size(A,1);
o=[1:n];
for k=1:n-1
    %maior elemento em modulo
    pivo=k;
    maximo=abs(A(o(k),k));
    for i=k+1:n
        if abs(A(o(i),k))>maximo
            pivo=i;
            maximo=abs(A(o(i),k));
        end
    end
    
    %troca de linhas
    
    if pivo > k
        for j=1:n
            aux=o(pivo);
            o(pivo)=o(k);
            o(k)=aux;
        end
        aux2=b(pivo);
        b(pivo)=b(k);
        b(k)=aux2;
    end
   %transformacao para triangular inferior
    for i=k+1:n
        m=A(o(i),k)/A(o(k),k);
        for j=k:n
            A(o(i),j)=A(o(i),j)-m*A(o(k),j);
        end
        b(o(i))=b(o(i))-m*b(o(k));
    end
end
A
b
%solucionando o sistema
x(n)=b(o(n))/A(o(n),n);
for i=n-1:-1:1
    soma = 0;
    for j = i+1:n
        soma = soma + A(o(i),j)*x(j);
    end
    x(i)=(b(o(i))-soma)/A(o(i),i);
end
x
r=abs(b1-a1*x');
        
    