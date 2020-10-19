close all; clear all; clc;

% Sonido Original
[x,Fs] = audioread('acoustic.wav'); % input archivo .wav
TotalTime = length(x)./Fs; % Tiempo duracíon input .wav [s] 
e = input('Ingresar razón a expandir:   ');

subplot(2,2,1);
plot(x)
ylabel("Amplitud");
xlabel("Largo");
title("Señal original");
copiar(x,e);

function c = copiar(x,e)
n = round(length(x)*e - length(x)); % Cantidad de elementos a copiar
y(1:n,1) = x(length(x)); % Se añade la ultima muestra x(length(x)) a un vector columna
fprintf('Muestra a copiar %d\n', x(length(x)));
c = [x;y];% se une el vector columna desde el ÚLTIMO elemento de la señal original y se grafica.
subplot(2,2,2);
plot(c); 
ylabel("Amplitud");
xlabel("Largo");
title("Señal Expandida");
end





