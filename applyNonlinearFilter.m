function imgCopy=applyNonlinearFilter(img, func)
    [width, height, cols] = size(img);
    
    imgCopy = img;
    for color = 1:cols
        for x = 1:width
            for y = 1:height
                imgCopy(x, y, color) = nonlinear5x5Val(img, x, y, color, func);
            end
        end
    end