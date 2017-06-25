function [h, s, l] = rgb_to_hsl(r, g, b)
% creating h, s, l arrays of size of r, g, b
[m, n] = size(r);
h = zeros(m, n);
s = zeros(m, n);
l = zeros(m, n);
% Iterating over the r, g, b to calculate h, s, l
for i = 1:numel(r)
    [h(i), s(i), l(i)] = rgb_to_hsl_val(r(i), g(i), b(i));
end
end

function [h, s, l] = rgb_to_hsl_val(r, g, b)

MAX_RGB = 255; 
MAX_H = 239;
MAX_S = 240;
MAX_L = 240;

%Normalizing to range (0,1)
r = r ./ MAX_RGB;
g = g ./ MAX_RGB;
b = b ./ MAX_RGB;
%Calculating MAX
max_rg = max(r, g);
max_rgb = max(max_rg, b);
min_rg = min(r, g);
min_rgb = min(min_rg, b);
%Setting h, s and l values
h = ((max_rgb + min_rgb) ./ 2);
s = ((max_rgb + min_rgb) ./ 2);
l = ((max_rgb + min_rgb) ./ 2);

if (max_rgb == min_rgb)
    h = 0;
    s = 0;
else
    dif = max_rgb - min_rgb;
    if (l > 0.5)
        s = dif ./ (2 - max_rgb - min_rgb);
    else
        s = dif ./ (max_rgb + min_rgb);
    end
    switch max_rgb
        case r
            h = (g - b) ./ dif;
            if (g < b)
                h = h + 6;
            end
        case g
            h = 2 + (b - r) ./ dif;
        case b
            h = 4 + (b - r) ./ dif;
    end
    h = h / 6;
end
%Converting to MS Paint range
%Can be rounded but bad in case of accuracy
%
h = (h .* MAX_H);
s = (s .* MAX_S);
l = (l .* MAX_L);
end
