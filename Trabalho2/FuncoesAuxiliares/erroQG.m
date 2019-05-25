function E = erroQG (f,a,b,n)
a = -1;
b =  3;
n = 15;

for(i=1:2*n)
    f = polyder(f);
end

v = (a + b)/2;
% theta = fminbnd(f,a,b);
% Tivemos problemas ao utilizar a função acima,portanto,fomos obrigados a utilizar um valor estimado.

E = ( ( ((b - a)^(2*n+1) ) * (factorial(n))^4) / ( (factorial(2*n)^3) * (2*n+1) ) )*polyval(f,v) ;

endfunction