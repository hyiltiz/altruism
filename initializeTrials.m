
function initializeTrials()

seq = genTrials(1, [12, 3], 3);

for i = length(seq)
    if seq(i,3) == 1 %判断是否是利他
        for j = 1: 9 %一共有9个block
            if seq(i, 2) == 1 % 判断是否是一分强度
                oneTrial();
            end
            if seq(i, 2) == 2 % 判断是否是4分强度
                oneTrial();
            end
            if seq(i, 2) == 3 % 判断是否是6分强度
                oneTrial();
            end
        end
    end
    
    if seq(i,3) == 1 %判断是否是利己
        for j = 1: 9 %一共有9个block
            if seq(i, 2) == 1 % 判断是否是一分强度
                oneTrial();
            end
            if seq(i, 2) == 2 % 判断是否是4分强度
                oneTrial();
            end
            if seq(i, 2) == 3 % 判断是否是6分强度
                oneTrial();
            end
        end
    end
    
    if seq(i,3) == 1 %判断是否是字体
        for j = 1: 9 %一共有9个block
            if seq(i, 2) == 1 % 判断是否是一分强度
                oneTrial();
            end
            if seq(i, 2) == 2 % 判断是否是4分强度
                oneTrial();
            end
            if seq(i, 2) == 3 % 判断是否是6分强度
                oneTrial();
            end
        end
    end
        
end

return;