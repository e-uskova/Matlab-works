% ГАРМОНИЧЕСКИЙ АНАЛИЗ СИГНАЛОВ НА ОСНОВЕ ДИСКРЕТНОГО
% ПРЕОБРАЗОВАНИЯ ФУРЬЕ

% triang 20 28 60 240 100

f1 = 20;
f2 = 28;
f3 = 60;

fsample1 = 240;
fsample2 = 100;

secs = 5;

fsample = fsample1;

t = (0:1/fsample:secs);
N = length(t);

a = sin(2*pi*f1*t);
b = sin(2*pi*f2*t);
c = sin(2*pi*f3*t);

xa = abs(fft(a));
xb = abs(fft(b));
xc = abs(fft(c));

% plot(xa);
% hold on;
% plot(xb, 'r');  
% plot(xc, 'g');
% title('графики спектров');
% xlim([0 fsample - fsample/N]);
% xlim([0 N]);

d=a(1:N)+0.75*b(1:N)+0.5*c(1:N);
AmpSpec=(1/(N/2))*abs(fft(d));

% figure;
% plot(d);
% title('сигнал d');
% xlim([0 N]);
% 
% figure;
% plot(AmpSpec);
% title('амплитудный спектр сигнала d');
% xlim([0 N]);

w=triang(N);
dw=w.'.*d;

figure;
plot(w);
title('triangular window');
xlim([0 N]);

figure;
plot(abs(fft(w)), 'r');
title('спектр треугольного окна');
xlim([0 N]);

figure;
plot(dw);
title('dw');
xlim([0 N]);

figure;
plot(abs(fft(dw)));
title('fft(dw)');
xlim([0 N]);

