%% Q_1
clearvars; clc;
syms s t;
f_1 = int(t^3 * (sin(50*t))^7); % integrating first function
f_2 = diff(-3*t^2*(cos(60*t))^8); % differentiating second function

f_1_s = laplace(f_1); % returns the Laplace Transform of f_1 
f_2_s = laplace(f_2); % returns the Laplace Transform of f_2

f_s = f_1_s*f_2_s; 

f_s = simplify(f_s); % performs algebraic simplification of f_s

f_t = ilaplace(f_s); % returns the Inverse Laplace Transform of f_s
f_t = simplify(f_t); % performs algebraic simplification of f_t
t_s = -10:0.1:10-0.1; % 
f = subs(f_t, t, t_s); % returns a copy of f_t, replacing all occurrences of t with t_s

subplot(2, 1, 1);
fplot(f_t);

[num, den] = numden(f_s); %getting numerator and denominator 
nums = sym2poly(num); % converting num from symblic to polynomial
dens = sym2poly(den); % converting den from symbolic to polynomial
subplot(2, 1, 2); % subplot (rows,columns,position) 
pzmap(tf(nums,dens)); % converting dynamic system models to transfer function form.

%% Q_2
y= t^3; %Function
f_t = diff(diff(y,t)) - 3 * diff(y,t)+4*y+5; %
int_value=int(f_t,5,10); %computing integration of f_t
display(int_value);