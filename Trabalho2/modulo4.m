function modulo4 
figure;

root = '~/Downloads/T2_Algoritmos/';
addpath([root 'FuncoesAuxiliares']);


%%%%%%%%%%%%%%%%%%% Tafera 1 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 4 - TAREFA 1:\n Amostragem da funcao alien no intervalo x ∈ [0,100], com uma resolucao de ∆x = 0.1.\n\n');
global dd;

hold on;
intervalo = [0:0.1:100];

figure = plot(intervalo,alien(intervalo),'-g',"LineWidth", [1.4]);
xlabel('X');
ylabel('Y');
title ("Funcao Alien");



%%%%%%%%%%%%%%%%%%% Tafera 2 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 4 - TAREFA 2:\n Interpolacao polinomial de alien(x).\n\n');
X = [0:1:100]; 
Xaux = [0:10:100]; 
Yaux = alien(Xaux);
Y = alien(X);  
difdiv(Xaux',Yaux');

grau = 0;
for i = columns(dd) : -1 : 1
    if(round(dd(1,i)) ~= 0)
        grau = i+3;
        break;
    end
end

% Através de testes descobrimos que o grau do polinômio alien(x) é 10. 
% Usando a difdiv para o intervalo inicial (passo 1) excedia o limite de chamada de funções recursivas(1000), 
% logo, aumentamos o passo em 10x. Somamos três ao grau pois devemos disconsiderar a coluna 0, a X.

P_n = polyfit(intervalo,alien(intervalo),grau)



%%%%%%%%%%%%%%%%%%% Tafera 3 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 4 - TAREFA 3:\n Desenhando a função interpolada.\n\n');
figure = plot(intervalo,polyval(P_n,intervalo),'--r',"LineWidth", [1.4]);
legend('Alien(x)','P_n(x)');
hold off;

%%%%%%%%%%%%%%%%%%% Tafera 4 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 4 - TAREFA 4:\n Tabela com o valor de cada raiz e sua multiplicidade. \n\n');
Raizes = roots(P_n)

for i = 1 : length(Raizes)
    Raizes(i) = real(Raizes(i));
end 

SET = unique(Raizes);

Tabela = zeros(length(SET),2);
for i = 1 : length(SET)
    aux = 0;
    for j = 1 : length(Raizes)
        if SET(i) == Raizes(j)
            aux++;
        end
    end
    Tabela(i,1) = SET(i);
    Tabela(i,2) = aux;
end     
Tabela



%%%%%%%%%%%%%%%%%%% Tafera 5 %%%%%%%%%%%%%%%%%%%
fprintf('MODULO 4 - TAREFA 5:\nCoordenadas do quartel geral do comando superior dos alienígenas.\n\n');

lat = 542.6794676564501287430175580084323883056640625 - sum(Raizes);
long = -62.6514871473790861955421860329806804656982421875 + (10^(-16))*prod(Raizes);
lat = real(lat);
long = real(long);
fprintf('Latitude:');lat
fprintf('\nLongitude:');long
fprintf('\n\n\n');
