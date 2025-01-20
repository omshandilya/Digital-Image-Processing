# Color Channel Visualization and Histogram Equalization in MATLAB

## Overview
This MATLAB script demonstrates basic image processing techniques, focusing on:
1. Separating and visualizing individual color channels (Red, Green, Blue) from a given image.
2. Performing histogram equalization on a grayscale version of the image to enhance contrast.

---

## Code Functionality

### Part 1: Color Channel Visualization
1. Reads and displays the original image.
2. Extracts and displays grayscale representations of the image.
3. Splits the image into individual RGB color channels.
4. Creates images emphasizing only the Red, Green, or Blue channels.
5. Displays all the channels alongside the original image using a montage.

### Part 2: Histogram Equalization
1. Converts the color image to grayscale.
2. Computes the histogram of the grayscale image.
3. Performs histogram equalization to enhance contrast.
4. Displays the original histogram, equalized histogram, and the enhanced image.

---

## Requirements
- MATLAB installed with the Image Processing Toolbox.
- An image file (`image.jpg`) placed in the same directory as the script.

---

## How to Run
1. Open the script in MATLAB.
2. Ensure `image.jpg` is in the working directory.
3. Run the script and view the results.

---

## Output
The script generates:
1. Visualization of the original image and its separated RGB channels.
2. Grayscale and color histograms before and after equalization.
3. Enhanced image after applying histogram equalization.

---

## Code

### Color Channel Visualization
```matlab
clc;
clear all;
close all;

% Read and display the original image
colorImage = imread('image.jpg');
figure;
imshow(colorImage);
title('Original Image');

% Convert to grayscale and display
grayImage = rgb2gray(colorImage);
figure;
imshow(grayImage);
title('Grayscale Image');

% Split into RGB channels
redChannel = colorImage(:, :, 1);
greenChannel = colorImage(:, :, 2);
blueChannel = colorImage(:, :, 3);

% Create images highlighting individual channels
onlyRed = cat(3, redChannel, zeros(size(redChannel)), zeros(size(redChannel)));
onlyGreen = cat(3, zeros(size(greenChannel)), greenChannel, zeros(size(greenChannel)));
onlyBlue = cat(3, zeros(size(blueChannel)), zeros(size(blueChannel)), blueChannel);

% Display montage of the color-separated images
montage({colorImage, onlyRed, onlyGreen, onlyBlue}, 'Size', [1 4]);
title('Original and Color-Separated Images');


