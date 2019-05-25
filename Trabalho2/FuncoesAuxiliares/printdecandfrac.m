function printdecandfrac( decimal, newline )
	[num, denom, success] = dec2frac( decimal, 1E-5, 100 );

	%fprintf('printdecandfrac> num=%d denom=%d success=%d\n', num, denom, success );

	fprintf('%.4f', decimal );
	if success
		if denom == 1
			fprintf('=%d', num );
		else
			%fprintf('%.4f', decimal );
			fprintf('=%d/%d', num, denom );
		end;
	else
		fprintf('=*****');
	end
	if newline fprintf('\n'); end
end


