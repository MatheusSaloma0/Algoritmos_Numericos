clear all;
clc;

function Analitica (f, x0, y0, h, n)
	pkg load symbolic;

	syms g(t) g0 t0

	ode = diff(g, t) == f(t,g);
	disp('A equacao diferencial oridinaria (EDO):'); ode

	solucao = dsolve(ode, g(t0)==g0);
	disp('A solucao analitica da EDO:'); solucao
end