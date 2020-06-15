function isColorWhite=isColorWhite(px)
    [r, g, b] = unpackColorPx(px);
    isColorWhite = r >= Constants.WHITE_THRESHOLD && g >= Constants.WHITE_THRESHOLD && b >= Constants.WHITE_THRESHOLD;

    