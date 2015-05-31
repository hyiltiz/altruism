
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
  for ii = 1: sum(seq(1,:)==i) % this is 4 altruism
    % we only need the item_con.all
    options = item_con.all(seq(4*(i-1) + ii, [3 4]))';
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
