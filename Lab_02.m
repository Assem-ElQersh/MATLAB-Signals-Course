%% Example 2.1
clear all; clc;

t = (-3:3);
h = [0 0 1 2 1 0 0];
subplot( 3, 1, 1);
stem( t, h, 'b');
xlabel('n'); ylabel('h[n]'); title('System input signal h[n]');

x = [0 0 0 2 3 -2 0];
subplot( 3, 1, 2);
stem( t, x, 'r');
xlabel('n'); ylabel('x[n]'); title('System input signal x[n]');

y = conv( x, h);     %y[n]
%Convoluted function requires a wider range to be plotted completely. range=x+h-1
t2=-6:6;

subplot( 3, 1, 3);
stem( t2, y, 'k', '', 'MarkerEdgeColor','black');
xlabel('n'); ylabel('y[n]'); title('Convoluted signal y[n]');

%%============================================================
%% Example 2.2
clear all; clc
n = 0:15; 		% both functions start from 0 because of (u(n))

h = (3/4).^n; 
subplot( 5, 1, 1);
stem( n, h, 'b', '');
xlabel('n'); ylabel('h[n]'); title('System function h[n]');

% to view the flipped filter response function h
h_flipped = fliplr(h)
subplot( 5, 1, 2);
stem( n, h_flipped, 'g', '');
xlabel('n'); ylabel('h_f[n]'); title('Flipped Version of h[n]');

x = ones(1,numel(n));
subplot( 5, 1, 3);
stem( n, x, 'r', '');
xlabel('n'); ylabel('x[n]'); title('Input signal x[n]');

n_conv = 0:30;			% both functions start from 0, so convolution will also start from 0
y = conv( x, h);           %y[n]
subplot( 5, 1, 4);
stem( n_conv, y, 'k', '', 'MarkerEdgeColor','black');
xlabel('n'); ylabel('y[n]'); title('Convoluted (Output) signal y[n]');

% to view the convolution at n = -5:
y_5 = [ 0 0 0 0 0 y];
subplot( 5, 1, 5);
stem( [-5:-1 n_conv], y_5);
xlabel('n'); ylabel('y[n]'); title('Convoluted (Output) signal y[n]');


%%============================================================
%% Example 2.3
clear all; clc;

t_h = 0:9;
h = ones(1,10);
subplot( 3, 1, 1);
stem( t_h, h, 'b', ''); axis([0 10 0 2]);
xlabel('n'); ylabel('h[n]'); title('System function h[n]');

t_x = 2:6;
x = ones(1,5);
subplot( 3, 1, 2);
stem( t_x, x, 'r', ''); axis([0 10 0 2]);
xlabel('n'); ylabel('x[n]'); title('Input Signal x[n]');

y = conv( x, h);           %y[n]
t_conv = 2:15;
subplot( 4, 1, 4);
stem( t_conv, y, 'k', '', 'MarkerEdgeColor','black'); axis([0 18 0 6]);
xlabel('n'); ylabel('y[n]'); title('Convoluted (Output) signal y[n]');
