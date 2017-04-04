f = zeros(30,30);
f(5:24,13:17) = 1;


F = fft2(f);
F2 = log(abs(F));
%imshow(F2,[-1 5],'InitialMagnification','fit');
%colormap(jet); colorbar

F = fft2(f,256,256);
imshow(log(abs(F)),[-1 5]); colormap(jet); colorbar