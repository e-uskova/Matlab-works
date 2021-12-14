clear, clc

function [hz]=H(z)
    hz = (0.505 - 1.01 * z^-1 + 0.505 * z^-2) ./ (1 - 0.7478 * z^-1 + 0.2722 * z^-2)
endfunction

b0 = 0.505 
b1 = -1.01
b2 = 0.505
a0 = 1
a1 = -0.7478
a2 = 0.2722

b = [0.505 -1.01 0.505]
a = [1 -0.7478 0.2722]

poly_b = poly(b, 'z', "coeff")
poly_a = poly(a, 'z', "coeff")

z=poly(0,'z');
sys=(0.505 - 1.01 * z + 0.505 * z^2) / (1 - 0.7478 * z + 0.2722 * z^2)
rep=freq(sys("num"),sys("den"),[0,0.9,1.1,2,3,10,20])
//disp(poly(a, 'z', "coeff"))

//disp(sys)

//A=diag([-1,-2]);B=[1;1];C=[1,1];
//Sys=syslin('c',A,B,C);
//Systf=ss2tf(Sys)
//frq=0:0.02:5;
//w=frq*2*%pi;
//repf=repfreq(Sys,frq);
//disp(Sys)

//sys = tf2ss(sys)
//repf=repfreq(sys, frq)

x = 1:100
plot(H(x), 'g')

