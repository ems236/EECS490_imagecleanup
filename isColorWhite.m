function isColorWhite=isColorWhite(px)
    %[r, g, b] = unpackColorPx(px);
    %isColorWhite = r >= Constants.WHITE_THRESHOLD && g >= Constants.WHITE_THRESHOLD && b >= Constants.WHITE_THRESHOLD;
    brightness = colorToGray(px);
    isColorWhite = brightness >= Constants.WHITE_THRESHOLD;
    