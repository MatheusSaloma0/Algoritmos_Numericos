%%
%% k-ésimo polinômio de Lagrange L_k de grau n
%% R.-L. p. 216
%%
%% Input: n+1 nós de interpolação x_0, ..., x_n, índice k e argumento X (valor único ou vetor de valores)
%% Output: L_k(x)
%% L_0(x) = 1
%%
function Lk = polinomLagrange ( x, k, X )
	n = length(x);

	verbose = true;
	verbose = false;
	Lk = 1;
	if verbose fprintf('n=%d grau=%d L_k(X)=L_%d(%.2f)=\n', n, n-1, k-1, X ) end;
	for i = 1:n
		%fprintf('n=%d i=%d\n', n, i );
		if i ~= k
			frac = (X-x(i)) / (x(k)-x(i));	
			if verbose fprintf('k=%d i=%d X=%7.5f (X-x(%d))=%7.5f (x(%d)-x(%d)=%7.5f\n',...
				k, i, X, i, X-x(i), k, i, x(k)-x(i) ) end;
			Lk = Lk .* frac;
			if verbose fprintf('(X-x(%d))/(x(%d)-x(%d)){=(%.2f-%.2f)/(%.2f-%.2f)=%.2f} ',...
					i-1, k-1, i-1, X, x(i), x(k), x(i), frac );if( i ~= n ) fprintf(' * '); end;end;
		end
	end
	%fprintf('\nL_%d(%f)=%f\n', k-1, X, Lk );
end


