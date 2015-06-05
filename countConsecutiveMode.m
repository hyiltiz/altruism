function countBag = countConsecutiveMode(x)
if isvector(x)
    count = 1;
    countBag = [];
    iBag = 1;
    for i=2:numel(x)
        if x(i-1) == x(i)
            count = count + 1;
        else
            countBag(iBag,:) = [count x(i)];
            iBag = iBag + 1;
            count = 1;
        end
    end
    
else
    error('go to die!');
end
end