close all; clear all; clc;
format long g

% Sonido Original
[x,Fs] = audioread('acoustic.wav'); % input archivo .wav
TotalTime = length(x)./Fs; % Tiempo duracíon input .wav [s] 
n=input('Numero de ecos ');

for i=1:n
msge = sprintf('Ingresar retardo eco numero %d    :',i)
retardos(i)=input(msge);
end
for i=1:n
cerosadd(i) = round((TotalTime+retardos(i))*Fs-length(x))
end


for i=1:n
c = zeros(cerosadd(i),1)
subplot(2,2,i)
plot([c;x/2])

end