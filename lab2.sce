T = 2;
Ti = 1;
t = [-Ti/2:0.01:Ti/2];
xt = - 4 * abs (t) + 1;
a0 = sum( - 4 * abs (t) + 1) / (T / 0.01 + 1);
disp(a0);
//plot(t, xt);
//xgrid(5);
k = 1;
omega1 = %pi / 2;
x1 = (- 4 * abs (t) + 1) .* cos(k * omega1 * t);
//plot(t, x1);
//xgrid(5);
a1 = sum((- 4 * abs (t) + 1) .* cos(k * omega1 * t)) / (T / 0.01 + 1);
//disp(a1);
k = 2;
x2 = (- 4 * abs (t) + 1) .* cos(k * omega1 * t);
a2 = sum((- 4 * abs (t) + 1) .* cos(k * omega1 * t)) / (T / 0.01 + 1);
//disp(a2);
//plot(t, x2);
//xgrid(5);
//ak = zeros(10);
for k = [1 : 10]
//    disp(k);
//    xk = (- 4 * abs (t) + 1) .* cos(k * omega1 * t);
    ak(k) = sum((- 4 * abs (t) + 1) .* cos(k * omega1 * t)) / (T / 0.01 + 1);
end
ak = abs(ak);
disp(ak);
//bar(ak', width = 0.1);
//xgrid(5);

k = [1:10];
//disp(size(t));
cosk = cos(k' * omega1 * t);
xn = sum(ak' * cosk, 'r')
eps = xt - sum(ak' * cosk, 'r')
disp(sqroot(sum(eps .* eps)));
plot(eps, 'r')
set(gca(), "auto_clear", "off")
plot(xt, 'g')
plot(xn, 'b')


