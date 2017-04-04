I=imread('stp1.gif');
F=fft2(double(I));
S = fftshift( fftshift(F), 2 );
L=log2(S);
A=abs(L);
imagesc(A)