
function initializeTrials()

seq = genTrials(1, [12, 3], 3);

for i = length(seq)
    if seq(i,3) == 1 %�ж��Ƿ�������
        for j = 1: 9 %һ����9��block
            if seq(i, 2) == 1 % �ж��Ƿ���һ��ǿ��
                oneTrial();
            end
            if seq(i, 2) == 2 % �ж��Ƿ���4��ǿ��
                oneTrial();
            end
            if seq(i, 2) == 3 % �ж��Ƿ���6��ǿ��
                oneTrial();
            end
        end
    end
    
    if seq(i,3) == 1 %�ж��Ƿ�������
        for j = 1: 9 %һ����9��block
            if seq(i, 2) == 1 % �ж��Ƿ���һ��ǿ��
                oneTrial();
            end
            if seq(i, 2) == 2 % �ж��Ƿ���4��ǿ��
                oneTrial();
            end
            if seq(i, 2) == 3 % �ж��Ƿ���6��ǿ��
                oneTrial();
            end
        end
    end
    
    if seq(i,3) == 1 %�ж��Ƿ�������
        for j = 1: 9 %һ����9��block
            if seq(i, 2) == 1 % �ж��Ƿ���һ��ǿ��
                oneTrial();
            end
            if seq(i, 2) == 2 % �ж��Ƿ���4��ǿ��
                oneTrial();
            end
            if seq(i, 2) == 3 % �ж��Ƿ���6��ǿ��
                oneTrial();
            end
        end
    end
        
end

return;