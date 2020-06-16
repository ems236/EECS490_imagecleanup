function retVal=maximin(vals)
    count = size(vals);
    groupSize = ceil(count(1) / 2);
    mins = zeros(groupSize, 1);

    for i = 1:groupSize
       mins(i) = 255;
       for j = 0:(groupSize - 1)
           mins(i) = min(mins(i), vals(i + j)); 
       end
    end
    
    retVal = max(mins);