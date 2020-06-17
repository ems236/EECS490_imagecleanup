function [xvals, yvals]=linearTransferFunc(img)
    [min, max] = minMax(img);
    xvals = [0:255];
    yvals = [0:255];
    for x = 1:256
        yvals(x) = uint8((x - min) * (255 / (max - min)));
    end