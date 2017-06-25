function [hue, sat, lum] = rgbImg2hsl(image)
%Read Image
I = imread(image);
I = double(I);
%Separating the RGB components
Red = I(:,:,1);
Green = I(:,:,2);
Blue = I(:,:,3);
%Getting Hue, Sat, Lum matrices from Red, Green, Blue
[hue, sat, lum] = rgb_to_hsl(Red, Green, Blue);
end