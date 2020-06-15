function negative=negativeImg(img)
    [width, height, ~] = size(img);
    
    negative = img;
    for x = 1:width
        for y = 1:height
            for color = 1:3
                negative(x, y, color) = mod(255 - negative(x, y, color), 255);
            end
        end
    end