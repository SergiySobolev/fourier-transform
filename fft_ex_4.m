img = imread('in2.jpg');  %# Load a sample image
imshow(img);
fft = fft2(img);   %# Get the Fourier transform
inv = ifft2(fft);  %# Get the inverse Fourier transform
inv = uint8(inv);  %# Convert to uint8
%imshow(inv);       %# Show the image
disp(isequal(img,inv));