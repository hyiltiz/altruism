
%% initialize conditions
% 150314
% created by wanghaixia, with the help of yuermai and Dr. chen Lihan

function initializeConditions2(wptr, ziti_size, xcenter, ycenter, wrect)

yinsu1 = 3; %factor 1: altruism and control 1 and control 2
yinsu2 = 3; %factor 2: 1 and 4 and 6
treatments = CombineFactors([yinsu1, yinsu2]);
%volt = Replace(treatments, [1 4 6]);
seq = genTrials(1, 4, [9, 3]);

%shock_type = Shuffle(repmat(1:3, [1, 16]));
treatments = Shuffle(treatments);

yin_su1 = Shuffle(1:3);
% xuhao = rand(24, 1);
% init_item_num = Shuffle([1:24, 1:24]);


for i = 1:length(seq)
    if yin_su1 == 1
        
    elseif yin_su == 2
    
    elseif yin_su == 3
        
    end
    
end









for i = 1:size(treatments, 1)
    
    for j = 1:length(block_num)
        if treatments(i, 1) == 1 % 利他条件
            for aa = 1:4
                oneTrial(wptr, 1,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
            end
            for ss = 1:4
                
                oneTrial(wptr, 4,ziti_size, xcenter, ycenter, wrect,  shock_type(ss) ); % shock 4 times
            end
            
            
        elseif treatments(i, 1) == 2 % 利己条件
            for aa = 1:4
                oneTrial(wptr, 2,ziti_size, xcenter, ycenter, wrect ); % zili 4 times
            end
            for ss = 1:4
                
                oneTrial(wptr, 4,ziti_size, xcenter, ycenter, wrect, shock_type(ss) ); % shock 4 times
            end
            
        elseif treatments(i, 1) == 3 % 字体条件
            for aa = 1:4
                oneTrial(wptr, 3,ziti_size, xcenter, ycenter, wrect ); % ziti 4 times
            end
            for ss = 1:4
                
                oneTrial(wptr, 4,ziti_size, xcenter, ycenter, wrect, shock_type(ss) ); % shock 4 times
            end
            
        end % treatments
    end % block
    
end

end


%% show pic

function show_pic(prefix, postfix, wptr)
im = imread([prefix '.' postfix]);
t88 = Screen('MakeTexture', wptr, im);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(4);
end


