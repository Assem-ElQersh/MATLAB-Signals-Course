%% Assignment

% Clear workspace and command window
clear all; clc;

syms z n; % Declaring variables

% Define the given rational function
Xz = (16*z^2 - 4*z + 1) / (8*z^2 + 2*z - 1);

% Inverse Z-transform to get the time-domain signal
xt = iztrans(Xz, z, n);
xt = simplify(xt);

% Plot poles and zeros of transfer function
figure;
zplane([16 -4 1], [8 2 -1]);
title('Poles and Zeros');

% Plot the output for n = 1:10
nValues = 1:10;
xtValues = subs(xt, n, nValues);
xtValues = double(xtValues);

figure;
stem(nValues, xtValues);
xlabel('n');
ylabel('x(n)');
title('Output of the Inverse Z-transform');
grid on;
