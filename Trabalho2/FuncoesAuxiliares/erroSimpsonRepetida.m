%%
%% Integração numérica usando a regra 1/3 de Simpson repetida
%%
%% Input: a quarta derivada da função a ser integrada, os limites inferior 'a' e superior 'b' de integração
%%        o número 'n' de subdivisões. 
%% 
%% Output: Limite inferior do erro
%% Restrições:
%%		número 'n' de subdivisões tem que ser par
%%		derivada monôtona, i.e. maior valor em um dos limites
%%
function ESR_upperbound = erroSimpsonRepetida( dfuncd, a, b, n )
	for i = 1 : 4
		dfuncd = polyder(dfuncd);
	end
	dfuncd4 = dfuncd;
	
	%% Decide se número é impar: Uso de uma função anônima
	isodd = @(x) x-2*floor(x/2);

	if isodd( n )
		ESR_upperbound = Inf;
		return;
	end

	h = (b-a)/n;
	% finf = dfuncd4( a );	% calcular valor da derivada no início do intervalo [a,b]
	% fsup = dfuncd4( b );	% calcular valor da derivada no final do intervalo [a,b]

	finf = polyval(dfuncd4,a);	% calcular valor da derivada no início do intervalo [a,b]
	fsup = polyval(dfuncd4,b);	% calcular valor da derivada no final do intervalo [a,b]

	M4 = max( abs(finf), abs(fsup) );
	aux = (b-a)*h^4/180;
	ESR_upperbound = aux * M4;
end

