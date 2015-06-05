function initializeSeq(wptr, ziti_size, xcenter, ycenter, wrect, seq, seqChoice)


%% block altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
item_con = item_liangbiao;
msg1 = item_con.msg1;

for i = 1:numel(unique(seq(:,1))) % 27

    zhi_dao_yu(wptr, seq(4*i,2)); % instruct
    jitter_isi(wptr, wrect, getTime('CrossBeforeEvents'));  % cross
    for ii = 1: sum(seq(:,1)==i) % this is 4 altruism
        options = item_con.all(seq(4*(i-1) + ii, [3 4]))';
        oneTrial(wptr, seq(4*i, :), ziti_size, xcenter, ycenter, wrect, options, msg1);
    end


    % is this kongping? I think we need one here below
    % i will recheck with profressor Xie
    % NOTE: jitter time [1,3] could be wrong!
    jitter_isi(wptr, wrect, getTime('CrossLinkEventsShock'));  % cross for 6s

    for iii=1:sum(seq(:, 1)==i) % this is shock
        oneShockTrial(wptr, seq(4*(i-1) + iii, 6), ziti_size, xcenter, ycenter, wrect);
    end

    jitter_isi(wptr, wrect, getTime('CrossBetweenBlocks')); % cross

end

%% for predicted altruism: one option is altruism and the other is zili

jitter_isi(wptr, wrect, getTime('CrossBeforePredictedAl')); % cross
zhi_dao_yu(wptr, 4); % instruct of myChoice


for j = 1:size(seqChoice(:, 3), 1)
    options = item_con.all(seqChoice(j, [1 2]))';
    oneAl_Zili_Trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1);
end


end
