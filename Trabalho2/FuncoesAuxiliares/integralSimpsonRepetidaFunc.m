%%
%% Integração numérica usando a regra 1/3 de Simpson repetida
%%
%% Input: a função a ser integrada, os limites inferior 'a' e superior 'b' de integração
%%        o número 'n' de subdivisões (=número de nós menos 1). 
%% 
%% Output: Integral numérica
%% Restrições: número 'n' de subdivisões tem que ser par
function ISR = integralSimpsonRepetidaFunc(a, b, n )
	%% Decide se número é impar: Uso de uma função anônima
	isodd = @(x) x-2*floor(x/2);

	ISR = 0.0;
	if isodd( n )
		ISR = Inf;
		return;
	end

	h = (b-a)/n;
	nos = a:h:b;

	limits = polyfunc1(a) + polyfunc1(b);
	x = a + h;
	sumodd = 0.0; sumeven = 0.0;
	n2 = n/2; h2 = h*2;
	for i=1:n2
		sumodd = sumodd + polyfunc1(x);
		x = x + h2;
	end
	x = a + h2;
	for i=1:n2-1
		sumeven = sumeven + polyfunc1(x);
		x = x + h2;
	end
	ISR = h/3 * (limits + 4 * sumodd + 2 * sumeven);
end

