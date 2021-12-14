clear, clc

// triang 
//function [wn]=triang(n)
//    wn = 1 - abs(n) / N
//endfunction

// rectang
//function [wn]=rect(n)
//    if abs(n) <= 1 then
//        wn = 1
//    else
//        wn = 0
//    end
//endfunction

f1 = 20 // ЧАСТОТЫ
f2 = 28 
f3 = 60 
fsample1 = 240 // частота дискретизации
fsample2 = 100
secs = 5;    // длительность реализации сигнала

fsample = fsample1
disp('fsample = fsample1 = ' + string(fsample))

t=(0:1/fsample:secs);

N = 128 //количество отсчетов сигнала

a=sin(2 * %pi * f1 * t);
b=sin(2 * %pi * f2 * t);
c=sin(2 * %pi * f3 * t);

xa=abs(fft(a));
xb=abs(fft(b));
xc=abs(fft(c));

frq=1:fsample/N:fsample/2;

x=0:fsample/N:fsample - fsample/N

//plot(frq(1:50),abs(xa(1:50)));
//plot(frq(1:fsample/2),abs(xb(1:fsample/2)), 'r');
//plot(frq(1:fsample/2),abs(xc(1:fsample/2)), 'g');

//plot(a)
//plot(b, 'r')
//plot(c, 'g')

//plot(x, abs(xa(1:length(x))))
//plot(abs(xb), 'r')
//plot(abs(xc), 'g')

//x = (0:fsample - fsample/N)
//plot(t, xa)
//ax=gca(),// gat the handle on the current axes
//ax.data_bounds=[0 0;5 fsample - fsample/N];

d=a(1:N)+0.75*b(1:N)+0.5*c(1:N);
//plot(d)
АmpSpec=(1/(N/2))*abs(fft(d));
//plot(АmpSpec)

w=triang(-2:0.1:2);
r=rect(-2:0.1:2)
//[wft,wfm,fr]=wfir()
plot(r)
dw=(w)*d;
