%%
%% Integração numérica usando a regra dos Trapézios repetida
%%
%% Input: a função a ser integrada, os limites inferior 'a' e superior 'b' de integração
%%        o número 'n' de subdivisões. 
%% 
%% Output: Integral numérica
%%
function ITR = integralTrapeziosRepetidaFunc(a, b, n )
	h = (b-a)/n;
	nos = a:h:b;

	limits = polyfunc1(a) + polyfunc1(b);
	x = a + h;
	ITR = 0.0;
	for i=1:n-1
		ITR = ITR + polyfunc1(x);
		x = x + h;
	end
	ITR = h/2 * (limits + 2 * ITR);
end

