function grayScale=toGrayScale(img)
%toGrayscale - copies an image and converts it to grayscale
% img: color image 
% greyScale: return value, the greyScale version of this img

[width, height, ~] = size(img);
grayScale = zeros(width, height);

for