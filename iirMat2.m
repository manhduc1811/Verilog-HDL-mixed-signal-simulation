clc; clear all;
%Script to generate signal for testbench
N = 500;
n = 0:N-1;

fs = 48000;
f1 = 500;
f2 = 15000;
f3 = 5000;

x1 = round(300*sin(2*pi*(f1/fs)*n));
x2 = round(300*sin(2*pi*(f2/fs)*n));
y1 = x1 + x2;
y2 = round(300*sin(2*pi*(f3/fs)*n));

y = [y1,y2];

for i = 1:1:2*N
    formatSpec = 'x = %16.f; #20833; // Sample(%d)\n';
    fprintf(formatSpec,y(i),i);
end

subplot(4,1,1);
m = 1:N;
plot(m,x1);

subplot(4,1,2);
m = 1:N;
plot(m,x2);

subplot(4,1,3);
m = 1:N;
plot(m,y2);

subplot(4,1,4);
m = 1:2*N;
plot(m,y);
