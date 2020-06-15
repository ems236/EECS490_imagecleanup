function [r,g,b]=unpackColorPx(px)
    r = px(1, 1, Constants.R);
    g = px(1, 1, Constants.G);
    b = px(1, 1, Constants.B);