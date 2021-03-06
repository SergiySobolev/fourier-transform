I = imread('stp1.gif');
% convert to double
ID = im2double(I);
%  transform to frequency domain
FID = fft2(ID);
% insert image arithmetic operations here
% convert back to spatial domain
IFID = ifft2(FID);
% convert back to uint8
I8 = im2uint8(IFID);
imshow(I8)