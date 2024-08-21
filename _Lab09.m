clearvars; clc; % Clear variables and command window
syms s t

Xs = (3*s + 4) / ((s + 1)*(s + 2)^2); % Define the transfer function X(s)

% Plot poles and zeros using pzmap
[num, den] = numden(Xs);
H = tf(sym2poly(num), sym2poly(den));
figure;
pzmap(H);
title('Poles and Zeros');

x_t = ilaplace(Xs); % Determine the inverse Laplace transform

% Plot x(t) for t = 0 to 10
t_range = 0:0.01:10;
figure;
fplot(matlabFunction(x_t), [0 10]);
xlabel('Time (s)');
ylabel('x(t)');
title('Inverse Laplace Transform');
grid on;