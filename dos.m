close all; clear all; clc;

% Sonido Original
[x,Fs] = audioread('acoustic.wav'); % input archivo .wav
TotalTime = length(x)./Fs; % Tiempo durac�on input .wav [s] 
e = input('Ingresar raz�n a expandir:   ');

subplot(2,2,1);
plot(x)
ylabel("Amplitud");
xlabel("Largo");
title("Se�al original");
copiar(x,e);

function c = copiar(x,e)
n = round(length(x)*e - length(x)); % Cantidad de elementos a copiar
y(1:n,1) = x(length(x)); % Se a�ade la ultima muestra x(length(x)) a un vector columna
fprintf('Muestra a copiar %d\n', x(length(x)));
c = [x;y];% se une el vector columna desde el �LTIMO elemento de la se�al original y se grafica.
subplot(2,2,2);
plot(c); 
ylabel("Amplitud");
xlabel("Largo");
title("Se�al Expandida");
end





