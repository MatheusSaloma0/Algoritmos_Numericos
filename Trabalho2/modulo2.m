function modulo2(dfunc)

root = '~/Downloads/T2_Algoritmos/';
addpath([root 'FuncoesAuxiliares']);

a = -1;
b =  3;
X = [-1:3];
n = 15;
% dfunc = [1 -4 4 0]; % Coeficientes de polyfunc1

%%%%%%%%%%%%%%%%%%% Regra dos Trapézios (Repetida) %%%%%%%%%%%%%%%%%%%
for i = 1 : n
    IT{i} = integralTrapeziosRepetidaFunc(a,b,i);
    ET{i} = erroTrapeziosRepetida(dfunc,a,b,i);
end


%%%%%%%%%%%%%%%%%%% Regra 1/3 de Simpson (Repetida) %%%%%%%%%%%%%%%%%%%
for i = 1 : n
    IS{i} = integralSimpsonRepetidaFunc(a,b,i);
    ES{i} = erroSimpsonRepetida(dfunc,a,b,i);
end



%%%%%%%%%%%%%%%%%%%  QuadraturaGaussiana %%%%%%%%%%%%%%%%%%%
C = coefGaussLegendre(n+1);
[T,A] = tabelaAbcissasPesos(C);

for i = 1 : n
    IG{i} = integralGaussLegendreFunc(a,b,i,T,A);
    EG{i} = erroQG(dfunc,a,b,i);
end



%%%%%%%%%%%%%%%%%%%  Tabela  %%%%%%%%%%%%%%%%%%%
Tabela =zeros (n,6);

for i=1 : n 
    Tabela(i,1) = IT{i};
    Tabela(i,2) = ET{i};
    Tabela(i,3) = IS{i};
    Tabela(i,4) = ES{i};
    Tabela(i,5) = IG{i};
    Tabela(i,6) = EG{i};
end

fprintf('MODULO 2 - Tabela com as integrações e erros: \n\n');
printf('                Trapezio                      Simpson                     Q.Gaussiana\n');
for i=1 : n 
    fprintf('%2d  -  |%10f   |%10f    |%10f   |%10f    |%10f    |%10f    |',i,IT{i},ET{i},IS{i},ES{i},IG{i},EG{i});
    fprintf('\n');
end
fprintf('\n\n\n');
