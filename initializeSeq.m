
function initializeSeq(wptr, ziti_size, xcenter, ycenter, wrect)

seq = genSequence;

% altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
item_con = item_liangbiao;

counterOption = 1;
counterShock = 1;

for i = 1:numel(unique(seq(:,1))) % 27
    
    while 1
        zhi_dao_yu(wptr, seq(i,2)); % instruct
        jitter_isi(wptr, wrect)  % cross
        for ii = 1: numel([seq(1,:)==i]) % this is 4 altruism
            switch seq(i, 2)
                case 1 % altruism
                    option1 = item_con.al_item(seq(4*(i-1) + counterOption, 3));
                    option2 = item_con.al_item(seq(4*(i-1) + counterOption, 4));
                case 2 % zili
                    option1 = item_con.zili_item(seq(4*(i-1) + counterOption, 3));
                    option2 = item_con.zili_item(seq(4*(i-1) + counterOption, 4));
                case 3 % ziti
                    option1 = item_con.all(seq(4*(i-1) + counterOption, 3));
                    option2 = item_con.all(seq(4*(i-1) + counterOption, 4));
                otherwise
                    error('Bad conditions!');
            end
            options = [option1 option2];
            oneTrial(wptr, seq(i, 2), ziti_size, xcenter, ycenter, wrect, options)
            counterOption = counterOption + 1
        end
        if counterOption == 5
            break;
        else
            % do nothing
        end
    end
    
    if counterOption == 5
        % could initialize now
        counterOption = 0;
    else
        error(['Trials in this block: ' num2str(i) ' is not 4!']);
    end
    
    for iii=1:4 % this is shock
        
        shock_trial(seq(i, 5));
        options = []; % shock trial , no options
        oneTrial(wptr, seq(i, 5), ziti_size, xcenter, ycenter, wrect, options)
        counterShock = counterShock+ 1;
    end
    
    
    if counterShock == 5
        % could initialize now
        counterShock = 0;
    else
        error(['Trials in this block: ' num2str(i) ' is not 4!']);
    end
    jitter_isi(wptr, wrect) % cross
    
end

end
