% ЛИНЕЙНЫЕ ДИСКРЕТНЫЕ СИСТЕМЫ И ЦИФРОВЫЕ ФИЛЬТРЫ

% 1 -0.7478 0.2722 0.5050 -1.0100 0.5050

a0 = 1; 
a1 = -0.7478; 
a2 = 0.2722; 
b0 = 0.5050;
b1 = -1.0100;
b2 = 0.5050;

a = [a0 a1 a2];
b = [b0 b1 b2];

secs = 1;

fsample = 500;

t = (0:1/fsample:secs - 1/fsample);
f = (1:fsample/length(t):fsample);

N = length(t);

% 1.Построить частотную характеристику фильтра с помощью функции freqz

[h,w]=freqz(b, a, fsample*secs);
plot(f, abs(h));
title('Частотная характеристика фильтра');
xlim([0 N]);
ylim([-0.1 1.1]);

% 2.Построить импульсную характеристику фильтра, как реакцию фильтра 
%   на единичное входное воздействие.

x = zeros(size(t));
x(1) = 1;
y = filter(b, a, x);

figure;
plot(t, y);
title('Импульсная характеристика фильтра');
xlim([-0.1 1.1]);

% 3.Сформировать сигнал x(nT) в виде суммы 3-х гармонических 
%   косинусоидальных сигналов. Частоты косинусов w1,w2,w3 выбрать 
%   таким образом, чтобы фильтр пропускал гармоники w1 и w2, и подавлял w3.

f1 = 15;
f2 = 50;
f3 = 20;

cos_w = cos(2*pi*f1*t) + cos(2*pi*f2*t) + cos(2*pi*f3*t); % x(nT)

figure;
plot(cos_w);
title('cosins');
xlim([0 N]);

% 4.Выполнить фильтрацию сигнала x(nT) во временной области.

y_t = filter(b, a, cos_w);

% % w_ampl = abs(fft(cos_w));
% % figure;
% % plot(f, w_ampl);
% % title('Амплитудный спектр суммы сигналов');

% f1_y = scipy.signal.lfilter(b, a, cos_w)
% f1_ampl = abs(np.fft.fft(f1_y))
% 
% f2_y = np.fft.ifft(np.fft.fft(cos_w) * np.fft.fft(b, len(t)) / np.fft.fft(a, len(t)))
% f2_ampl = abs(np.fft.fft(f2_y))

% 5.Выполнить фильтрацию сигнала x(nT) в частотной области.

n=length(cos_w);
y=ifft(fft(cos_w).*fft(b,n)./fft(a,n));

% % В общем случае для реализации БИХ-фильтрации в частотной области,
% % необходимо умножить ДПФ от входной последовательности x(nT) на отношение
% % ДПФ коэффициентов фильтра.
% % Это позволяет вычислить вектор y, который соответствует применению
% % функции filter, с точностью до переходных процессов.

% 6.Построить графики выходных процессов в соответствии с п.4. и
%   п.5. в одной системе координат.

figure;
hold on;
plot(y, 'r', 'LineWidth', 2);
plot(y_t, 'b');
title('выходные процессы');
