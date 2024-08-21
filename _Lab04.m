%%
close all;
clearvars;

%% Creating a figure with a super-title
figure;
sgtitle('Original Signal and Fourier Transforms');

%% Signal Generation and Plotting
fs = 200;
Ts = 1/fs;
t = 0:Ts:1;
x = 2*cos(2*pi*10*t - pi/2) - sin(2*pi*30*t);

subplot(3,1,1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Plotting the Magnitude Spectrum
n = length(x);
y = fft(x)/n;
yshift = fftshift(y);
frequency_vector = (-n/2:n/2-1)*fs/n;

subplot(3,1,2);
plot(frequency_vector, abs(yshift));
title('Magnitude Spectrum');
ylabel('|X(f)|');

%% Adding Noise to the Signal and Plotting
noise_amplitude = 0.4;
noise = noise_amplitude * randn(size(t));
x_with_noise = x + noise;
y_with_noise = fft(x_with_noise)/n;

subplot(3,1,3);
plot(frequency_vector, abs(fftshift(y_with_noise)));
title('Magnitude Spectrum [with Noise]');
ylabel('|X_{with_noise}(f)|');
