%%
%% Integração numérica usando a regra dos trapézios repetida
%%
%% Input: a segunda derivada da função a ser integrada, os limites inferior 'a' e superior 'b' de integração
%%        o número 'n' de subdivisões. 
%% 
%% Output: Limite inferior do erro
%% Restrições:
%%		derivada monôtona, i.e. maior valor em um dos limites
%%
function ETR_upperbound = erroTrapeziosRepetida( dfuncd, a, b, n )
	dfuncd2 = polyder(polyder(dfuncd));

	h = (b-a)/n;
	% finf = dfuncd2( a );	% calcular valor da derivada no início do intervalo [a,b]
	% fsup = dfuncd2( b );	% calcular valor da derivada no final do intervalo [a,b]
	finf = polyval(dfuncd2,a);	% calcular valor da derivada no início do intervalo [a,b]
	fsup = polyval(dfuncd2,b);	% calcular valor da derivada no final do intervalo [a,b]

	M2 = max( abs(finf), abs(fsup) );
	ETR_upperbound = 	n*h^3/12 * M2;
end

