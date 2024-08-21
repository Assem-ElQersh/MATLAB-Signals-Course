%% Assignment

% Clear workspace and command window
clear all; clc;

syms y(n) z Pzt; % Declaring variables
assume(n >= 0 & in(n, "integer")); % Assuming n is a non-negative integer

% Define the given difference equation
f = y(n+2) + 0.12 * y(n) - 0.8 * y(n+1);

% Z-transform
fzt = ztrans(f, n, z); % Z-transform of the difference equation
fzt = subs(fzt, ztrans(y(n), n, z), Pzt);
% Substituting the Z-transform of y(n) with the variable Pzt

% Solnve for Pzt in terms of z
Pzt = solve(fzt, Pzt);

% Inverse Z-transform and simplify
Soln = iztrans(Pzt, z, n);
Soln = simplify(Soln); % Simplifying the symbolic solution.

% Substitute initial conditions
Soln = subs(Soln, [y(0) y(1)], [1 1]);

% Plot the solution against n
nVals = 1:12; % Range n for plotting
Soln_vals = subs(Soln, n, nVals); % Evaluate the soln for each n
Soln_vals = double(Soln_vals); % Convert to double for numerical eval
Soln_vals = real(Soln_vals); % Extract real values.

% Plot the Solution
stem(nVals, Soln_vals);
xlabel('n');
ylabel('y(n)');
title('Solution of the Difference Equation');
grid on;