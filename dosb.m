close all; clear all; clc;

% Sonido Original
[x,Fs] = audioread('acoustic.wav'); % input archivo .wav
TotalTime = length(x)./Fs; % Tiempo duracíon input .wav [s] 
e = input('Ingresar razón a expandir:   ');

%subplot(2,2,1);
%plot(x)
%ylabel("Amplitud");
%xlabel("Largo");
%title("Señal original");

n = round(length(x)*e - length(x)); % Cantidad de 0 a agregar
fprintf('Cantidad de ceros a agregar  %d\n', n);

subplot(2,1,1);
plot(x(1:10));
ylabel("Amplitud");
xlabel("Largo");
title("Señal original");
fprintf('Muestras señal original (1 al 5)\n');
disp(x(1:5))
entre(x,n);

function a = entre(x,n)
tm = n+length(x);
f = zeros(tm,1);

i = 1;

for v = 1:2:tm
      if v == 1
         f(v) = x(i);
         i = i+1;
      else
         if i > length(x)
            f(v) = 0;
         else 
             f(v) = x(i);
             i = i+1;  
         end

      end
end
subplot(2,1,2);
plot(f(1:20));
ylabel("Amplitud");
xlabel("Largo");
title("Señal amplificada");
fprintf('Muestras señal amplicada (1 al 10)\n');
disp(f(1:10))
end




