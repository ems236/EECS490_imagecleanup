function [xvals, yvals]=histogramTransferFunc(img)
    [width, height] = size(img);
    px = width * height;
    histogram = histFor(img, 1);
    cumulativeVals = histCumulative(histogram);
    
    xvals = [0:255];
    yvals = [0:255];
    for x = 1:256
        yvals(x) = uint8(255 * (cumulativeVals(x) / px));
    end