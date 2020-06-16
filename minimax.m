function retVal=minimax(vals)
    count = size(vals);
    groupSize = ceil(count(1) / 2);
    maxs = zeros(groupSize, 1);
    for i = 1:groupSize
       for j = 0:(groupSize - 1)
           maxs(i) = max(maxs(i), vals(i + j)); 
       end
    end
    
    retVal = min(maxs);