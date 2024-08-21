%% Assignment

t = -10:0.01:10;
w = linspace(-pi, pi, length(t));

x_t = 5 * (t == 0);
y_t = cos(0.5 * pi * t) .* (t >= 0);


X_w = fftshift(fft(x_t));
Y_w = fftshift(fft(y_t));


H_w = Y_w ./ X_w;
h_t = ifft(ifftshift(H_w));

%% Plotting
figure; 

subplot(3, 2, 1);
plot(w, abs(H_w));
title('Frequency Response |H(ω)|');
xlabel('Frequency (ω)');
ylabel('|H(ω)|');

subplot(3, 2, 2);
plot(t, real(h_t));
title('Impulse Response h(t)');
xlabel('Time (t)');
ylabel('h(t)');

subplot(3, 2, 3);
plot(t, x_t);
title('Input Signal x(t)');
xlabel('Time (t)');
ylabel('x(t)');

subplot(3, 2, 4);
plot(t, y_t);
title('Output Signal y(t)');
xlabel('Time (t)');
ylabel('y(t)');

subplot(3, 2, 5);
plot(w, abs(X_w));
title('Magnitude Spectrum |X(ω)|');
xlabel('Frequency (ω)');
ylabel('|X(ω)|');

subplot(3, 2, 6);
plot(w, abs(Y_w));
title('Magnitude Spectrum |Y(ω)|');
xlabel('Frequency (ω)');
ylabel('|Y(ω)|');

%% Plot h(5t) using downsampling
figure;
h_5t = downsample(h_t, 5);
t_5t = downsample(t, 5);
plot(t_5t, h_5t);
title('Impulse Response h(5t)');
xlabel('Time (5t)');
ylabel('h(5t)');