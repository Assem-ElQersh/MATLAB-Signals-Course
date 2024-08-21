clearvars, clc;
%% Intial Value
fs = 5000;
cf = 800;
t = 0:1/fs:0.1-(1/fs);
x = sin(4000* pi*t) + 3*sin(1000*pi*t);
%% Before and After Buffer in time domain
[b1,a1] = butter(6,cf/(fs/2));
y1 = filter(b1,a1 ,x);

subplot(8,1,1)
plot(t,x)

subplot(8,1,2)
plot(t,y1)
%% Before and After Buffer in Frequency domain

    %Before
xf = fft(x);
xff = fftshift(xf)/fs;
f = linspace(-fs/2, fs/2, length(xff));
subplot(8,1,3)
plot(f, abs(xff))

    %After
y1f = fft(y1);
y1ff = fftshift(y1f)/fs;
f2 = linspace(-fs/2, fs/2, length(y1ff));
subplot(8,1,4)
plot(f2, abs(y1ff))
%% After Cheby1 in Time domain
[b2,a2] = cheby1(6,10,cf/(fs/2));
y2 = filter(b2,a2 ,x);
subplot(8,1,5)
plot(t,y2)
%% After Cheby1 in Frequency domain
y2f = fft(y2);
y2ff = fftshift(y2f)/fs;
f3 = linspace(-fs/2, fs/2, length(y2ff));
subplot(8,1,6)
plot(f3, abs(y2ff))
%% 
[h,w] = freqz(b1,a1,6);
subplot(8,1,7)
plot(w/pi,20*log10(abs(h)))

%%
[h,w] = freqz(b2,a2,6);
subplot(8,1,8)
plot(w/pi,20*log10(abs(h)))
