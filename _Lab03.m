%% Drill problem 2.4

clear all; clc
t = -10:0.1:10;
impulse_response = (t >= -1).*exp(-2*t-2);
input = exp(-abs(t));

output = conv(input, impulse_response, 'same');
t_conv = -10:0.1:10;

%% Plotting

subplot(3, 1, 1);
plot(t, input);
xlabel('t');
ylabel('x(t)');
title('Input x(t)');
%  = e^{-|t|}

subplot(3, 1, 2);
plot(t, impulse_response);
xlabel('t');
ylabel('h(t)');
title('Impulse Response h(t)');
%  = u(t+1) * e^{-2t-2}

subplot(3, 1, 3);
plot(t_conv, output);
xlabel('t');
ylabel('y(t)');
title('Output y(t)');

sgtitle('Convolution of input x(t) and impulse response h(t)');