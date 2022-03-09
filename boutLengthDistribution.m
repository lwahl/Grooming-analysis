M = max(originalData, [], 'all');

countMatrix = 1:M;
countMatrix(2,1) = 0;

for y = 1:size(originalData, 1)

for x = 1:size(originalData, 2)
    if  isnan(originalData(y,x))
        
    else
        countMatrix(2,originalData(y,x)) = countMatrix(2,originalData(y,x))+1;
    end    
end

end