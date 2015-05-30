function initializeSeq()

seq = genSequence;
block_num = 27; % seq(:,1)

% altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
item_con = item_liangbiao;

counterOption = 1;
counterShock = 1;

for i = 1:numel(unique(seq(:,1))) % 27
    for ii = 1: numel([seq(1,:)==i]) % 4
        zhidaoyu(seq(i,2));
        zhu_shi_dian();
        option1 = item_con.al_item(seq(4*(i-1) + counterOption, 3));
        option2 = item_con.al_item(seq(4*(i-1) + counterOption, 4));
        
        switch seq(i, 2)
            case 1% altruism
                al_trial(option1, option2)
            case 2
                four_zili_trials()
            case 3
                four_ziti_trials()
            otherwise
                error('Bad Condition!');
        end
        counterOption = counterOption + 1;
    end
    
    
    if counterOption == 5
        % could initialize now
        counterOption = 0;
    else
        error(['Trials in this block: ' num2str(i) ' is not 4!']);
    end
    
    for iii=1:4 % this is shock
        
        qiangdu_shock(seq(i, 5));
        
        counterShock = counterShock+ 1;
    end
    
    
    if counterShock == 5
        % could initialize now
        counterShock = 0;
    else
        error(['Trials in this block: ' num2str(i) ' is not 4!']);
    end
    zhu_shi_dian();
    
end

end
