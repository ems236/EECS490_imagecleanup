function imgCopy=applyMedianFilter(img)
    [width, height, cols] = size(img);
    
    imgCopy = img;
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                imgCopy(x, y, color) = median5x5(img, x, y, color);
            end
        end
    end