clearvars;
clc;
syms y(n) z pZT
assume(n>=0 & in(n, 'integer'))
f = y(n) + 2*y(n-1) - (1/8) * y(n-3) +3 * heaviside(n) - (1/4) * heaviside(n-1);
fZT = ztrans(f,n,z);

fZT = subs(fZT, ztrans(y(n),n,z),pZT);
pZT = solve(fZT,pZT);
pZT = subs(pZT,[y(-1) y(-2) y(-3)], [0 0 0]);
[a, b] = numden(pZT);
a = sym2poly(a);
b = sym2poly(b);
%poles and zeros
figure
zplane(a,b) %2

pSol = iztrans(pZT,z,n);
n_interval = 1:10;
pSolValues = subs(pSol,n,n_interval);
pSolValues = real(pSolValues);
figure;
stem(n_interval,pSolValues) %3