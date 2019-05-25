%%
%% Tabela das diferêncas divididas na forma de Newton
%% de um polinômio interpolador
%%
%% Input: Tabela x,y
%% Output: Tabela em forma matricial, 'Inf'=vazio
%%
function difdiv( x, y )
	global dd;
	n = size(x,1);

	for i=1:n
		for j=1:n+1
			dd(i,j)=inf; % mark as empty
		end
	end
	for i = 1:n
		dd(i,1) = x(i);
	end
	%dd
	fx = opdd( x, y, 1 );
end



