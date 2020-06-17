function negative=negativeImg(img)
    [width, height, ~] = size(img);
    
    negative = img;
    for x = 1:width
        for y = 1:height
            for color = 1:3
                negative(x, y, color) = 255 - img(x, y, color);
            end
        end
    end