function [r, g, b] = hsl_to_rgb(h, s, l)
% creating r, g, b arrays of size of h, s, l
[m, n] = size(h);
r = zeros(m, n);
g = zeros(m, n);
b = zeros(m, n);
% Iterating over the h, s, l to calculate r, g, b
for i = 1:numel(r)
    [r(i), g(i), b(i)] = hsl_to_rgb_val(h(i), s(i), l(i));
end
end

function [r, g, b] = hsl_to_rgb_val(h, s, l)
MAX_RGB = 255; 
MAX_H = 239;
MAX_S = 240;
MAX_L = 240;

%Normalizing to range (0,1)
h = h ./ MAX_H;
s = s ./ MAX_S;
l = l ./ MAX_L;

if (s == 0)
    % Achromatic
    r = l;
    g = l;
    b = l;
else
    q = 0;
    if (l < 0.5)
        q = l * (1 + s);
    else
        q = l + s - l * s;
    end
    p = 2 * l - q;
    r = hue_to_rgb(p, q, h + 1/3);
    g = hue_to_rgb(p, q, h);
    b = hue_to_rgb(p, q, h - 1/3);
end
r = round(r .* MAX_RGB);
g = round(g .* MAX_RGB);
b = round(b .* MAX_RGB); 
end

function col = hue_to_rgb(p, q, t)
if (t < 0)
    t = t + 1;
end
if (t > 1)
    t = t - 1;
end    
if (t < 2/3)
    if (t < 1/2) 
      if (t < 1/6)
          col = p + (q - p) .* 6 .* t;
      else
          col = q;
      end
    else     
        col = p + (q - p) .* (2/3 - t) .* 6;
    end
else 
    col = p;
end
end