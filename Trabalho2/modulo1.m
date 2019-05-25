function [saida_coef] = modulo1

figure;
root = '~/Downloads/T2_Algoritmos/';
addpath([root 'FuncoesAuxiliares']);


%%%%%%%%%%%%%%%%%%%  Tarefa 1 %%%%%%%%%%%%%%%%%%%
global ordemG;
a = -1;
b = 3;
fprintf('MODULO 1 - TAREFA 1:\nDefinindo intervalo como [%d,%d].\n\n',a,b);



%%%%%%%%%%%%%%%%%%%  Tarefa 2 %%%%%%%%%%%%%%%%%%%
graphics_toolkit gnuplot;
intervalo = [a:0.01:b];
Yzero = zeros(length(intervalo));
hold on;
figure = plot(intervalo,polyfunc1(intervalo),'-b',"LineWidth", [1.4]);
figure = plot(intervalo,Yzero,'-c',"LineWidth", [1.4]);



%%%%%%%%%%%%%%%%%%%  Tarefa 3 %%%%%%%%%%%%%%%%%%%
X = [-1:0.4:3]';
n = 10;
global dd;

for(i = 1 : 1+n)
    Y(i) = polyfunc1(X(i));
end

Y = Y';
difdiv(X,Y);

fprintf('MODULO 1 - TAREFA 3:\nExibindo tabela de diferenças divididas...\n');
showDD();



%%%%%%%%%%%%%%%%%%%  Tarefa 4 %%%%%%%%%%%%%%%%%%%
fprintf("\n");
Tam_dd = size(dd,1)-1;

count = 0;
for i = columns(dd) : -1 : 1
    if(round(dd(1,i)) ~= 0)
        count = i;
        fprintf('MODULO 1 - TAREFA 4:\n');
        fprintf('Analisando a tabela determinou-se que o grau do polinomio interpolado é %d.\n',count-2);
        break;
    end
end
ordemG = count-2;



%%%%%%%%%%%%%%%%%%%  Tarefa 5 %%%%%%%%%%%%%%%%%%%
fprintf("\n");
fprintf('MODULO 1 - TAREFA 5:\n');
fprintf('De acordo com a tabela de diferenças dividas ');
if(round(dd(1,Tam_dd)) == 0)
    fprintf('a funçao é um polinomio.\n\n');
else
    fprintf('a funçao nao é um polinomio.\n\n');
end



%%%%%%%%%%%%%%%%%%%  Tarefa 6 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 1 - TAREFA 6:\n');
X1(1) = X(1);
Y1(1) = Y(1);
P{1} = intpolNewton(X1,Y1);
figure = plot(intervalo,polyval(P{1},intervalo),'-g',"LineWidth", [1.4]);
fprintf('O grau do polinomio calculado é igual a %d \n\n',length(P{1})-1);



%%%%%%%%%%%%%%%%%%%  Tarefa 7 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 1 - TAREFA 7:\n');
for (i = 2 : ordemG+1)
    X1(i) = X(i);
    Y1(i) = Y(i);
    Xaux = X1;
    Yaux = Y1;
    P{i} = intpolNewton(Xaux',Yaux');
end    



%%%%%%%%%%%%%%%%%%%  Tarefa 8 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 1 - TAREFA 8:\nPlotando o gráfico...\n\n');

for i = 1 : ordemG
    figure = plot(intervalo,polyval(P{i},intervalo));    
end
xlabel('X');
ylabel('Y');
title ("Polyfunc1");
% legend({"f(x)","y = 0","p0(x)","p1(x)","p2(x)","p3(x)"}); 
% Tivemos problemas para plotar a legenda de alguns gráficos assim optamos por deixá-la comentada. 
fprintf('\n\n\n');

saida_coef = P{ordemG+1};

hold off;
