% abs(xlabel)
% fft(x)
% fftshift(x)
% angle(x) => phase angle
%%
close all;
clearvars;
%%
Ts = 1/81;
t = 0:Ts:10-Ts;
x = sin(2*pi*15*t - (pi/4)) + sin(2*pi*40*t);
subplot(4,1,1)
plot(t,x)
xlabel('Time (seconds)')
ylabel('Amplitude')
%%
y = fft(x);
fs = 1/Ts;
f = (0:length(y)-1)*fs/length(y);
subplot(4,1,2)
plot(f,abs(y))
xlabel('Frequency (Hz)')
ylabel('Magnitude') 
title('Magnitude')
%% Zero-Centered
n = length(x);
fshift = (-n/2:n/2-1)*(fs/n);
yshift = fftshift(y);
subplot(4,1,3)
plot(fshift,abs(yshift))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
%% Phase
tol = 1e-6;
yshift(abs(yshift) < tol)=0;
theta = angle(yshift);
subplot(4,1,4)
stem(f,theta/pi)