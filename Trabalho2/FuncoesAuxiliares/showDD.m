%%
%% Tabela das diferêncas divididas na forma de Newton
%% de um polinômio interpolador. Forma visualmente agradável
%%
%% Input: Tabela das diferenças divididas em forma matricial
%% Output: Tabela visualmente correta
%%
function showDD()
	global dd;
%% Funções inline que testam se número é par ou impar
%	odd = inline( 'mod(x,2)==1' );
%	even = inline( 'mod(x,2)==0' );

	n = size(dd,1)-1;
	fprintf('--- Tabela das diferencas divididas ---\n');
	fprintf('%8s%3s', 'x', ' | ');
	for ord = 1:n+1
			ordem = ord-1;
			fprintf('%6s%2d%3s', 'Ordem', ordem, ' | ');
	end
	fprintf('\n');disp('----------------------------------------------------------');
	ddcell = cell(2*n+1,n+2);

	for i=1:2*n+1
		for j=1:n+2
			ddcell{i,j} = 'vazio';
		end
	end
	for i=1:n+1
		ddcell{2*i-1,1} = dd(i,1);
	end
	offv = 0;
	for j=1:n+1
		for i=1:n+1-offv
			lin = offv + 2*i - 1;
			ddcell{lin,j+1} = dd(i,j+1);
			%fprintf('ddcell{%d,%d}=dd(%d,%d)=%f\n',lin,j+1,i,j+1,dd(i,j+1));
		end
		offv = offv + 1;
	end
	for i=1:2*n+1
		for j=1:n+2
			if ddcell{i,j} ~= 'vazio'
				fprintf('%8.3f', ddcell{i,j} );
			else
				fprintf('%8s', '        ');
			end
			if j == 1
				fprintf(' | ');
			else
				fprintf('   ');
			end
		end
		fprintf('\n');
	end
end



