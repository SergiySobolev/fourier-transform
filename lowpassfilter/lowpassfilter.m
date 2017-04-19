clc;
clear all;

Fs = 200e3;
Ts = 1/Fs;
dt = 0:Ts:5e-3-Ts;

f1 = 1e3;
f2 = 20e3;
f3 = 30e3;


y = 5*sin(2*pi*f1*dt) + 5*sin(2*pi*f2*dt) + 10*sin(2*pi*f3*dt);
%plot(dt,y);

nfft = length(y);
nfft2 = 2.^nextpow2(nfft);

fy = fft(y, nfft2);
fy = fy(1:nfft2/2);

xfft = Fs.*(0:nfft2/2-1)/nfft2;
%plot(xfft, abs(fy/max(fy)));

cut_off = 1.5e3/Fs/2;
order = 16;

h = fir1(order, cut_off);
fh = fft(h, nfft2);
fh = fh(1:nfft2/2);


con = conv(y, h);
subplot(3,2,1);
plot(dt,y);
subplot(3,2,3);
stem(h);
subplot(3,2,5);
plot(con);


mul = fh.*fy;
subplot(3,2,2);
plot(xfft, abs(fy/max(fy)),'r'); 
subplot(3,2,4);
plot(xfft, abs(fh/max(fh)),'b'); 
subplot(3,2,6);
plot(abs(mul/max(mul)),'g');



