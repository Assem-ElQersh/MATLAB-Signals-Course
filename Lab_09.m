clearvars ; clc;
syms t
e = exp(-5*t);
f = (0.25*(t^2)*sin(3*t)*heaviside(t))+(e*heaviside(t));
F = laplace(f);
display(F)

[n,d] = numden(F);
num= sym2poly(n);
den= sym2poly(d);

H = tf(num,den);
pzmap(H);
grid on