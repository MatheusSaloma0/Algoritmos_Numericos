% n = número de subdivisões
function IGL = integralGaussLegendreFunc(a, b, n, T, A )
	bma2 = (b-a)/2.0; bpa2 = (b+a)/2.0;
	IGL = zeros(1,length(bma2));
	for i=0:n
		ti = T(n+1,i+1);
		Ai = A(n+1,i+1);
		IGL = IGL + Ai * polyfunc1(bma2*ti+bpa2);
	end
	IGL = IGL .* bma2;

return;
end




