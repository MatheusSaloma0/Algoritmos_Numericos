clear all;
clc;

function [X,Y] = EulerModificado (f, x0, y0, h, n)
	pkg load symbolic;

	X = zeros(1,n+1); Y = zeros(1,n+1);
	x = x0; y = y0;
	h2 = h/2.0;
	X(1) = x;	Y(1) = y;
	
	for i = 2 : n+1
		y = y + h*f(x+h2, y+h2*f(x,y));
		x = x + h;
		X(i) = x;	Y(i) = y;
	end 