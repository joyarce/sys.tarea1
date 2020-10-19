close all; clear all; clc;

% Sonido Original
a = 0.5; % Amplitud eco uniforme
info = audioinfo("acoustic.wav");
[y,Fs] = audioread("acoustic.wav"); % input archivo .wav
largo = size(y);

n=input('Numero de ecos ');

for i=1:n
msge = sprintf('Ingresar retardo eco numero %d    :',i)
retardos(i)=input(msge);
end

subplot(2,2,1);
plot(y)
ylabel("Amplitud");
title("Señal original");


for i=1:n
    subplot(2,2,i+1)
    plot(echo_gen(y,Fs,retardos(i),a));
    ylabel("Amplitud");
    title("Señal eco");
end





function output = echo_gen(input, fs, delay, amp)
ds = round((delay)*fs);    %%CALCULATING DELAY SAMPLE NUMBERS
if ds==0                   %%THIS APPENDS TO THE INPUT TO EQUAL THE SIZE WITH OUTPUT
    append=[];             %%APPENDS EMPTY MATRIX WHILE 'ds' IS ZERO
else
    append=zeros(ds,1);    %%APPENDS ZERO VECTOR FOR THE DELAY
end
   ain = [append;input];   %%APPENDED INPUT
    dmwa = amp*ain;        %%AMPLIFIED SIGNAL
    outd = [input; append];  %%APPENDED OUTPUT
    out = (dmwa+outd);      %%OUTPUT WITHOUT SCALLING
    
%%% SCALLING (IF NEEDED)   
    mx = max(out);
    mn = min(out);
    if max(abs(out))>1
        if(abs(mx)>abs(mn))
            output = out/abs(mx);
        else
            output = out/abs(mn);
        end
    else
        output=out;          %%OUTPUT WITH SCALLING(IF NEEDED)
    end
end
