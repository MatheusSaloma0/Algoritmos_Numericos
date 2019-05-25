clear all;
clc;

function DerivadaTotal(f)
    pkg load symbolic;
    syms x y 
    fxy = sym(f); %Transforma uma função normal em simbólica
    f_x = diff(fxy,x) %Derivada em relaçao a X
    f_y = diff(fxy,y) %Derivada em relaçao a Y
    %dtotal = matlabFunction(f_x+f_y*fxy) %Transforma uma função simbolica em normal
    dtotal = simplify(f_x+f_y*fxy)
end    
