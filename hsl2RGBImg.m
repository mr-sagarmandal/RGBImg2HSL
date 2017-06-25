function [image] = hsl2RGBImg(hue, sat, lum)
%Red Green Blue matrices from hue, sat, lum
[Red, Green, Blue] = rgb_to_hsl(hue, sat, lum);
%combining them all
newI = cat(3, Red, Green, Blue);
image = double(newI);
imshow(image);
end