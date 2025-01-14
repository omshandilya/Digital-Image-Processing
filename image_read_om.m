clear all;
close all;
clc;
coloring=imread("Bleach-for-desktop.jpg");
imshow(coloring);
%Showing the value of pixel
colorPixel=coloring(1,3,:);
disp(colorPixel);