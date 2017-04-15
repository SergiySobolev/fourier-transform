fs = 1000;
t = 0 : 1/fs : 1.5 - 1/fs;
f1 = 20;
f2 = 30;
f3 = 40;

x = 3*cos(2*pi*f1*t + 0.2) + 1*cos(2*pi*f2*t - 0.3) + 2*cos(2*pi*f3*t + 2.4);
    
X = myDFT(x);
X2 = fft(x);

%disp(X(1:5));

X_mag = abs(X);
plot(X_mag);

%X_diff = X2 -X;
%disp(X_diff(1:5));


X_phase = angle(X);

disp(X_phase(31));

disp(X_phase(46));

disp(X_phase(61));



    