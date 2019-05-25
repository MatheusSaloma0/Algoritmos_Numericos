%%
%% Dada uma tabela de interpolação x-y
%% e a tabela das diferenças divididas (variável global previamente gerada),
%% gere o polinômio de Newton com o maior grau possível
%% usando todos os nós de interpolação
%%
%% Input: Tabela x,y, Tabela dd (global), nó xx a ser interpolado
%% Output: Coeficientes a_n, a_n-1, ... a_0 do polinômio interpolador
%%
function a = intpolNewton( x, y )
	global dd;
	n = size(x,1);
	ordem = n-1;
	% fprintf('\n--- Ordem %d ---\n', ordem );
	for fp=1:n-ordem
		nump = n;
		% fprintf( 'Ordem =%2d --- numero de pontos = %d --- primeiro no = [x%d]  Intervalo = [x%d',...
				% ordem, nump, fp-1, fp-1 );
		for p=2:nump
				% fprintf(',x%d', fp+p-2 );
		end
		%fprintf(']\n' );
		% fprintf('p_%d(x)', ordem );

		% fprintf('=d(0,%d)', fp );
		for p=2:nump
				% fprintf('+d(%d,%d)', p-1, fp );
				for xp=1:p-1
						% fprintf('(x-x_%d)', xp-1+fp-1 );
				end
		end

		% fprintf('\n\t=%.4f ', dd(fp,2) );
		for p=2:nump
				% fprintf('+%.4f', dd(fp,p+1) );
				for xp=1:p-1
						% fprintf('(x-%.4f)', x(xp+fp-1) );
				end
		end

		%fprintf('\n');
		a = vander(x(fp:fp+nump-1)) \ y(fp:fp+nump-1);
		if n > 1
			%fprintf('p_%d(x)=%.4f', ordem, a(1) );
			% fprintf('        =%.4f', a(n) );
			fprintf('p_%d(x) = %.4f',ordem, a(n) );
			for g=2:n
					fprintf(' + %.4f*x^%d',a(n-g+1), g-1 );
			end
		else 
			fprintf('p_0(x) = %d\n',a);	
		end
		fprintf('\n\n');
	end
end


