
function initializeSeq(wptr, ziti_size, xcenter, ycenter, wrect)

seq = genSequence;

% altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
item_con = item_liangbiao;

counterOption = 1;
counterShock = 1;

for i = 1:numel(unique(seq(:,1))) % 27
  
  % while 1 % <--- why is this? we already had a [for ii] loop below
  % could just put things in the for loop
  zhi_dao_yu(wptr, seq(i,2)); % instruct
  jitter_isi(wptr, wrect)  % cross
  for ii = 1: numel([seq(1,:)==i]) % this is 4 altruism
    % we only need the item_con.all
    option1 = item_con.all(seq(4*(i-1) + counterOption, 3));
    option2 = item_con.all(seq(4*(i-1) + counterOption, 4));
    options = [option1 option2];
    oneTrial(wptr, seq(i, 2), ziti_size, xcenter, ycenter, wrect, options);
    counterOption = counterOption + 1;
  end
  %         if counterOption == 5
  %             break;
  %         else
  %             % do nothing
  %         end
  %     end
  
  if counterOption == 5
    % could initialize now
    counterOption = 0;
  else
    error(['Trials in this block: ' num2str(i) ' is not 4!']);
  end
  
  
  % is this kongping? I think we need one here below
  jitter_isi(wptr, wrect)  % cross
  
  for iii=1:4 % this is shock
    
    shock_trial(seq(i, 5));

    % I suggest using two different functions: oneTrial for normal ones,
    % and another: oneShockTrial
    oneShockTrial(wptr, seq(i, 5), ziti_size, xcenter, ycenter, wrect);
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
