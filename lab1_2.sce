Frec = 33;
Fsample = 260;
a = 0;
b = 0.5;
t1 = [a:1/Fsample:b];
t2 = [a:1/(2 * Fsample):b];
t3 = [a:1/(0.5 * Fsample):b];
x1 = sin(2 * %pi * Frec * t1);
x2 = sin(2 * %pi * Frec * t2);
x3 = sin(2 * %pi * Frec * t3);
plot(t1, x1);
figure;
plot(t2, x2);
set(gca(), "auto_clear", "off");
plot(t3, x3, 'r');
