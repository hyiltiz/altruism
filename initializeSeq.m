
function initializeSeq(wptr, ziti_size, xcenter, ycenter, wrect)

seq = genSequence;

% altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
item_con = item_liangbiao;


for i = 1:numel(unique(seq(:,1))) % 27
    
    % while 1 % <--- why is this? we already had a [for ii] loop below
    % could just put things in the for loop
    zhi_dao_yu(wptr, seq(i,2)); % instruct
    jitter_isi(wptr, wrect);  % cross
    %for ii = 1: sum(seq(1,:)==i) % this is 4 altruism
    % there are four trials, as sum(seq(1, :) == 1)=1 is not what we want
    for ii = 1: 4 % four trials by whx
        
        % we only need the item_con.all
        % comment by whx; need all three types otherwise all ziti trials
        switch seq(i, 2)
            case 1
                options = item_con.al_item(seq(4*(i-1) + ii, [3 4]))';
            case 2
                options = item_con.zili_item(seq(4*(i-1) + ii, [3 4]))';
            case 3
                options = item_con.all(seq(4*(i-1) + ii, [3 4]))';
            otherwise 
                error('bad!');
        end
        oneTrial(wptr, seq(i, 2), ziti_size, xcenter, ycenter, wrect, options);
    end
    
    
    % is this kongping? I think we need one here below
    jitter_isi(wptr, wrect);  % cross
    
    for iii=1:sum(seq(1,:)==i) % this is shock
        
        % I suggest using two different functions: oneTrial for normal ones,
        % and another: oneShockTrial
        oneShockTrial(wptr, seq(i, 5), ziti_size, xcenter, ycenter, wrect);
    end
    
    
    jitter_isi(wptr, wrect); % cross
    
end

end
