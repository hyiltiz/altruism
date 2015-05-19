
%% initialize conditions
% 150314
% created by wanghaixia, with the help of yuermai and Dr. chen Lihan

function initializeBlocks(wptr)


block_num = Shuffle(1:27);
seq = genTrials(1, 4, [9, 3]);
shock_seq =seq(:,1);
la_ding_fang1 = [41 44 46  44 46 41  46 41 44]';
la_ding_fang2 = [44 46 41  46 41 44  41 44 46]';
la_ding_fang3 = [46 41 44  41 44 46  44 46 41]';

la_ding_fang = [la_ding_fang1; la_ding_fang2; la_ding_fang3];

m = 1;
for i = 1:length(shock_seq)
     
    if shock_seq(i,1)==1 % 电击强度1
        qiang_du = 41; % shock 1 score
    elseif shock_seq(i,1)==2% 强度2
        qiang_du = 44; % shock 4 score
    elseif shock_seq(i,1)==3% 强度3
        qiang_du = 46; % shock 6 score
        
    elseif shock_seq(i, 1) == 4 %第4个shock trial
      qiang_du = la_ding_fang(m);
      m = m + 1;  
    end
   
end


for i = 1:length(block_num)
    if mod(block_num, 3) == 0 % altruism
        oneBlock(wptr, 1, qiang_du);
    elseif mod(block_num, 3) == 1
        oneBlock(wptr, 2, qiang_du); % self-interest
    elseif mod(block_num, 3) == 2
        oneBlock(wptr, 3, qiang_du); % ziti
    end
    
end

%36 trials; 选择利他任务
for j = 1:36
    xuan_al_zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num);
end

return;



