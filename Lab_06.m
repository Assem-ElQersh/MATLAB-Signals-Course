clc;
% syms n
% F1 = sin(n);
% display(ztrans(F1))
% display(iztrans(ztrans(F1)))
% F2 = exp(3*n);
% display(ztrans(F2))
% F3 = n;
% display(ztrans(F3))
% F4 = n*sin(n);
% display(ztrans(F4))
% F5 = sin(n)*exp(5*n);
% display(ztrans(F5))

syms n
F = n * sin(15*n) + exp(-3*n);
Fz = ztrans(F);
Fiz = iztrans(Fz);
display(Fz);
display(Fiz);
