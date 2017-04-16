samplingFrequency = 1000;
timeStamp = 1/samplingFrequency;
ts = timeStamp;
dt = 0:ts:5-ts;
f1 = 10;
f2 = 30;
f3 = 70;

y1 = 10 * sin(2*pi*f1*dt);
y2 = 10 * sin(2*pi*f2*dt);
y3 = 10 * sin(2*pi*f3*dt);
y4 = y1 + y2 + y3;

% subplot(4,1,1);
% plot(dt,y1,'r');
% subplot(4,1,2);
% plot(dt,y2,'b');
% subplot(4,1,3);
% plot(dt,y3,'g');
% subplot(4,1,4);
% plot(dt,y4,'y');

nfft = length(y4);
nfft2 = 2^nextpow2(nfft);
ff = fft(y4, nfft2);
fff = ff(1:nfft2/2);
xfft = samplingFrequency * (0 : nfft2/2 - 1) / nfft2;

subplot(2,1,1);
plot(dt,y4);
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Time domain signal');

subplot(2,1,2);
plot(xfft, abs(fff));
xlabel('Frequency (Hz)');
ylabel('Normalized amplitude');
title('Frequency domain signal');

