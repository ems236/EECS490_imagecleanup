function waterMarked=waterMarkedCenterColor(img, waterMark)
    [originX, originY] = waterMarkOrigin(img, waterMark);
    [width, height, ~] = size(waterMark);
    waterMarked = img;
    
    for x = 1:width
        for y = 1:height
            imgPosX = originX + x - 1;
            imgPosY = originY + y - 1;
            if ~isColorWhite(waterMark(x, y, :))
                for color = 1:3
                    waterMarked(imgPosX, imgPosY, color) = waterMark(x, y, color);
                end
            end
        end
    end