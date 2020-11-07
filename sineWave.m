clear; clear all;
N   =   50;
n   =   0:1:N-1;
fs  =   48000;  %% Sampling frequency
f1  =   2000;   %% frequency 1
x   =   1.5*sin(2*pi*(f1/fs)*n);
% Plot x signal
subplot(3,1,1);
t   =   (0:1:N-1)*1/fs;
stem(t,x);
% Calculate IntX
x1  = round(16*x);
for i = 1:1:48
    formatSpec =...
 'sine[%d] = %6.f; // Sample(%d)\n';
    fprintf(formatSpec,i-1,x1(i),i);
end
