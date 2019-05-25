%%
%% Conversão de um número decimal para fração
%%
%% Input: Número decimal, precisão de conversão, número máximo de iterações
%% Output: vetor de solução, e indicação de sucesso
%%
% Usage: [n,d, success] = dec2frac( 4.0/3, 1E-5, 1000 )
function [numerator, denominator, success] = dec2frac( decimal, accuracy, maxiter )
	numerator = 0;
	denominator = 1;
	negative = sign( decimal );
	fraction = 0.0;
	success = true;

	is_octave = (exist('OCTAVE_VERSION','builtin')>1); % Octave or Matlab
	if ~is_octave
		stdout = 1; stderr = 2;
	end;

	iter = 0;
	while abs( fraction - decimal ) > accuracy && iter < maxiter
		if abs(fraction) > abs(decimal)
			denominator = denominator + 1;
		else
			numerator = numerator + negative;
		end
		fraction = numerator / denominator;
		iter = iter + 1;
	end
	if iter == maxiter
		success = false;
		%fprintf(stderr,'dec2frac> Warning: Could not convert %f in less than %d iterations\n',...
		%	 decimal, maxiter+1 );
	end
	%fprintf('dec2frac> num=%d denom=%d success=%d\n', numerator, denominator, success );
end

