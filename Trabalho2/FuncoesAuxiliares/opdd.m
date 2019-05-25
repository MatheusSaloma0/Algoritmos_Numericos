%%
%% Operador das diferêncas divididas, definição recursiva, R.-L. p. 220
%%
%% Input: nós de interpolação x, valor de y em x, índice inicial do nó
%% Output: f[x_{firstnode}, x_{firstnode+1}, ..., x_{firstnode+dim(x)}]
%%
function fx = opdd( x, y, firstnode )
	global dd;
	n = size(x,1);
	if n==1
		fx = y(1);
		% printf('n=%d first and only=%d  fx=%f\n',  n, firstnode, fx );
	else
		% There is more than one interpolation node
		fx0 = opdd( x(1:n-1), y(1:n-1), firstnode );
		fx1 = opdd( x(2:n), y(2:n), firstnode+1 );
		fx = (fx1 - fx0) / (x(n)-x(1));
		% printf('n=%d first=%d last=%d x(1)=%f x(%d)=%f fx0=%f fx1=%f fx=%f\n',
		% 			n, firstnode, firstnode+n-1, x(1), n, x(n), fx0, fx1, fx );
	end
	dd(firstnode,n+1) = fx;
	%printf('---> Setting cell (%d,%d)=%f\n',  firstnode, n+1, fx );
end



