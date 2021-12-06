// triang 
//function [wn]=triang(n)
//    wn = 1 - abs(n) / N
//endfunction

f1 = 20 
f2 = 28 
f3 = 60 
fsample1 = 240 
fsample2 = 100
secs = 5;

fsample = fsample1
disp('fsample = fsample1 = ' + string(fsample))
t=(0:1/fsample:secs);

N = length(t) //количество отсчетов сигнала

a=sin(2 * %pi * f1 * t);
b=sin(2 * %pi * f2 * t);
c=sin(2 * %pi * f3 * t);

xa=abs(fft(a));
xb=abs(fft(b));
xc=abs(fft(c));

x = (0:fsample - fsample/N)
plot(t, xa)
ax=gca(),// gat the handle on the current axes
ax.data_bounds=[0 0;5 fsample - fsample/N];

d=a(1:N)+0.75*b(1:N)+0.5*c(1:N);
АmpSpec=(1/(N/2))*abs(fft(d));

w=triang(N);
dw=(w)*d;
