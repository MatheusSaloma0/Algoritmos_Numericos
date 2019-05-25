%%
%% Interpolação por polinômios de Lagrange de grau n
%% R.-L. p. 216
%%
%% Input: n+1 nós de interpolação x_0, ..., x_n, os valores y_0, ..., y_n
%% da função nesses pontos e o argumento X
%% Output: p_n(x)
%%
function p = intpolLagrange ( x, y, X )
	n = length(x);

	p = 0;
	for k = 1:n
		Lk = polinomLagrange ( x, k, X );
		s = dec2fracstr( Lk,  5, 1E-5, 100 );
		%k,Lk,s
		if( length(X) == 1 )
			fprintf('L(%d)=%f=%s\n', k-1, Lk, s);
			fprintf('n=%d grau=%d y(k)*L_k(X)=y(%d)*L_%d(%.2f)=%.2f*%.2f=%.2f\n', n, n-1, k-1, k-1, X, y(k), Lk, y(k) .* Lk );
		end
                p = p + y(k) .* Lk;
	end
	s = dec2fracstr( p,  5, 1E-5, 100 );
	if length(X)==1
		fprintf('p_%d(%f)=%f=%s\n', n-1, X, p, s );
	end
end


