function waterMarked=waterMarkedCenterBW(img, waterMark)
    [originX, originY] = waterMarkOrigin(img, waterMark);
    [width, height, ~] = size(waterMark);
    waterMarked = img;
    
    for x = 1:width
        for y = 1:height
            imgPosX = originX + x - 1;
            imgPosY = originY + y - 1;
            if waterMark(x, y) < Constants.WHITE_THRESHOLD
                waterMarked(imgPosX, imgPosY) = waterMark(x, y);
            end
        end
    end