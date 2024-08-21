%% Assignment

syms n
x_n = exp(-10 * n) * heaviside(n);
y_n = (1 + n) * heaviside(n);

X_z = ztrans(x_n);
Y_z = ztrans(y_n);

F_z = simplify(X_z * Y_z);

f_n = iztrans(F_z);

% Display the results
display(X_z);
display(Y_z);
display(F_z);
display(f_n);
