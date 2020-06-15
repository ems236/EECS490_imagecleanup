function [positionX, positionY]=waterMarkOrigin(img, watermark)
    [width, height, ~] = size(img);
    centerX = ceil(width / 2);
    centerY = ceil(height / 2);
    
    [waterWidth, waterHeight, ~] = size(watermark);
    offsetWaterX = ceil(waterWidth / 2) - 1;
    offsetWaterY = ceil(waterHeight / 2) - 1;
    
    offsetWaterX = offsetWaterX - (mod(width, 2) * mod(waterWidth, 2));
    offsetWaterY = offsetWaterY - (mod(height, 2) * mod(waterHeight, 2));
    
    %assumes watermark is smaller than img
    positionX = centerX - offsetWaterX;
    positionY = centerY - offsetWaterY;

    