clear all  clc

b1 = [1  -1 1];
a1 = [1 -0.5];
a2 = [1 -2];
a3 = [1 -1];

first = conv(a1,a2);
second = conv(first,a3);
% residuez is for partial fractions
[r,p,k] = residuez(b1,second);
zplane(b1,second)
hold on
plot(p,'^r')
hold off