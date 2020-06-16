function newVal=median5x5(img, x, y, color)
    %does the + shape instead of a square
    CENTER = 3;
    vals = zeros(9);
    for maskX = 1:5
        offsetX = maskX - CENTER;
        pxVal = pxInBounds(img, x + offsetX, y, color);
        vals(maskX) = pxVal;
    end
    
    yVals = [1, 2, 4, 5];
    for maskY = 1:4
        offsetY = yVals(maskY) - CENTER;
        pxVal = pxInBounds(img, x, y + offsetY, color);
        vals(5 + maskY) = pxVal;
    end
    
    %median really should be quite fast for 9 values.  Don't need
    %pseudomedian
    %median has dumb dimensions?
    medianRes = median(vals);
    newVal = medianRes(1);