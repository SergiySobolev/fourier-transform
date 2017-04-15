function [Xk] = myDFT2(xn)
len = length(xn);
w = 2*pi*linspace(0,1,len);
n = 1:len;
Xk = exp(-1j*w'*n)*xn';