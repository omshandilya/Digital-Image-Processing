clear all; close all; clc;
i = imread("Lenna_(test_image).png");
i_gray = rgb2gray(i);
[LL, LH, HL, HH] = dwt2(i_gray, 'haar');
subplot(2,2,1), imshow(LL, []), title('Approximation');
subplot(2,2,2), imshow(LH, []), title('Horizontal detail');
subplot(2,2,3), imshow(HL, []), title('Vertical detail');
subplot(2,2,4), imshow(HH, []), title('Diagonal detail');
x = LL+LH+HL+HH;
figure;
subplot(121)
imshow(i_gray);
title("Original image");
subplot(122)
imshow(x, []);
title("Decomposed image");