function modulo3()
figure;

global ordemG;
root = '~/Downloads/T2_Algoritmos/';
addpath([root 'FuncoesAuxiliares']);

% ordem = 3; % Valor calculado no módulo 1

%%%%%%%%%%%%%%%%%%% Tafera 1 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 3 - TAREFA 1:\nEstimativas dos coeficientes do polinômio Pn(x).\n\n');

X = [-1:0.05:3];
for i = 1 : length(X)
    Y(i) = polyfunc1(X(i));
end 

fprintf('Coeficientes estimados: ');
Coefs = polyfit(X,Y,ordemG);
for i = 1 : length(Coefs)
    fprintf('%d  ',round(Coefs(i)));
end 
fprintf('\n\n');



%%%%%%%%%%%%%%%%%%% Tafera 2 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 3 - TAREFA 2:\nDesenhando o polinomio e a funcao auxiliar.\n\n');

Derivada = polyder(Coefs);
for i = 1 : length(X)
    U(i) = polyval(Coefs,X(i))/polyval(Derivada,X(i));
end 

hold on;
for i=1:length(X)
    if round(U(i)) == polyfunc1(X(i)) && polyfunc1(X(i)) == 0
        figure = plot(X(i),round(U(i)),'og',"LineWidth", [1.4]);
    end
end

Zero = zeros(length(X));

figure = plot(X,polyfunc1(X),'--g',"LineWidth", [1.4]);
figure = plot(X,Zero,'-b');
figure = plot(X,U,'--r',"LineWidth", [1.4]);
xlabel('X');
ylabel('Y');
title ("Funcao f(x) e funcao auxiliar u(x)");
% legend('x0','x1','f(x)','y = 0','u(x)'); 
% Tivemos problemas para plotar a legenda de alguns gráficos assim optamos por deixá-la comentada. 
fprintf('\n\n\n');

hold off;
