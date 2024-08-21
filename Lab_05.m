clc;
clear all;
clearvars
% syms a b t;
% f = a*sin(b*t);
% fFT = fourier(f);
% 
% display(fFT);


% Given parameters
a = 5;

% Time vector creation
Ts = 1/200;
t = 0:Ts:10-Ts;  % Alternatively, t = linspace(0, 10, 1000);

% Generate the signal x(t) = e^(-at) * u(t)
y = exp(-a * t) .* heaviside(t);

% Compute the Fourier Transform of the signal
Y = fftshift(fft(y));

% Calculate the sampling frequency
Fs = 1 / (t(2) - t(1));

% Frequency vector creation
f = linspace(-Fs/2, Fs/2, length(Y));

% Create a figure with a super-title
figure;
sgtitle('Original Signal and Fourier Transforms');

% Plot the magnitude spectrum
subplot(2, 1, 1);
plot(f, abs(Y));
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

% Apply a tolerance to remove small values
Tol = 1e-6;
Y(abs(Y) < Tol) = 0;

% Calculate the phase spectrum
theta = angle(Y);

% Plot the phase spectrum
subplot(2, 1, 2);
plot(f, theta/pi);  % Normalize phase by pi for better visualization
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase / \pi');

% Adding grid for better visualization
grid on;

% % Given parameters
% a = 1;
% 
% % Frequency range for plotting
% f = linspace(-10, 10, 1000);
% 
% % Calculate the Fourier transform
% X = 1 ./ (a + 1j * 2 * pi * f);
% 
% % Plot the magnitude
% figure;
% subplot(2, 1, 1);
% plot(f, abs(X));
% title('Magnitude Spectrum');
% xlabel('Frequency (Hz)');
% ylabel('|X(f)|');
% 
% % Plot the phase
% subplot(2, 1, 2);
% plot(f, angle(X));
% title('Phase Spectrum');
% xlabel('Frequency (Hz)');
% ylabel('Phase (radians)');



