
function initializeSeq(wptr, ziti_size, xcenter, ycenter, wrect)
% deals with the seqence, using the genTrials of Dr. Chen

%seq = genTrials(1, [4, 3], 9); %108 trials; 3x3 design
seq = genTrials(1, 4, [9, 3]);
la_ding_fang1 = [41 44 46  44 46 41  46 41 44]';
la_ding_fang2 = [44 46 41  46 41 44  41 44 46]';
la_ding_fang3 = [46 41 44  41 44 46  44 46 41]';


for i=1:length(seq)
    j = 0;
     
    
    if seq(i,3)==1
        
        show_pic('lita', 'png', wptr);% 指导语1  first type block
       
            oneTrial(wptr, 1,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
            j = j + 1;
            if seq(i,1)==1 % 电击强度1
                oneTrial(wptr, 41,ziti_size, xcenter, ycenter, wrect); % shock 1 score
            elseif seq(i,1)==2% 强度2
                oneTrial(wptr, 44,ziti_size, xcenter, ycenter, wrect); % shock 4 score
            elseif seq(i,1)==3% 强度3
                oneTrial(wptr, 46,ziti_size, xcenter, ycenter, wrect); % shock 6 score
                
            elseif seq(i, 1) == 4 %第4个shock trial
                m = 1;
                qiang_du = la_ding_fang1(m);
                m = m + 1;
                oneTrial(wptr, qiang_du,ziti_size, xcenter, ycenter, wrect);
            end
            
    end
    
    
    
    
    
    
    if  seq(i,3)==2
        show_pic('liji', 'png', wptr);% 指导语2  second type block
       
            oneTrial(wptr, 2,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
            j = j + 1;
            
            if seq(i,1)==1 % 电击强度1
                oneTrial(wptr, 41,ziti_size, xcenter, ycenter, wrect); % shock 1 score
            elseif seq(i,1)==2% 强度2
                oneTrial(wptr, 44,ziti_size, xcenter, ycenter, wrect); % shock 4 score
            elseif seq(i,1)==3% 强度3
                oneTrial(wptr, 46,ziti_size, xcenter, ycenter, wrect); % shock 6 score
            elseif seq(i, 1) == 4 %第4个shock trial
                m = 1;
                qiang_du = la_ding_fang2(m);
                m = m + 1;
                oneTrial(wptr, qiang_du,ziti_size, xcenter, ycenter, wrect);
                
            end
        end
       
    
    
    
    
    
    
    if  seq(i,3)==3
        show_pic('ziti', 'png', wptr); % 指导语3  third type block
       
            oneTrial(wptr, 3,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
            j = j + 1;
            if seq(i,2)==1 % 电击强度1
                oneTrial(wptr, 41,ziti_size, xcenter, ycenter, wrect); % shock 1 score
            elseif seq(i,2)==2% 强度2
                oneTrial(wptr, 44,ziti_size, xcenter, ycenter, wrect); % shock 4 score
            elseif seq(i,2)==3% 强度3
                oneTrial(wptr, 46,ziti_size, xcenter, ycenter, wrect); % shock 6 score
                
            elseif seq(i, 1) == 4 %第4个shock trial
                m = 1;
                qiang_du = la_ding_fang3(m);
                m = m + 1;
                oneTrial(wptr, qiang_du,ziti_size, xcenter, ycenter, wrect);
            end
        end
        
    
    
    
end % for length

%36 trials; 选择利他任务
for j = 1:36
    xuan_al_zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num);
end

end



%% %% show pic
function show_pic(prefix, postfix, wptr)
im = imread([prefix '.' postfix]);
t88 = Screen('MakeTexture', wptr, im);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(4);
end
