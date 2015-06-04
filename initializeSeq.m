function initializeSeq(wptr, ziti_size, xcenter, ycenter, wrect, seq)


%% block altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
item_con = item_liangbiao;
msg1 = item_con.msg1;

for i = 1:numel(unique(seq(:,1))) % 27

    zhi_dao_yu(wptr, seq(4*i,2)); % instruct
    jitter_isi(wptr, wrect, getTime('CrossBeforeTrial'));  % cross
    for ii = 1: sum(seq(:,1)==i) % this is 4 altruism
        options = item_con.all(seq(4*(i-1) + ii, [3 4]))';
        oneTrial(wptr, seq(4*i, 2), ziti_size, xcenter, ycenter, wrect, options, msg1);
    end


    % is this kongping? I think we need one here below
    % i will recheck with profressor Xie
    % NOTE: jitter time [1,3] could be wrong!
    jitter_isi(wptr, wrect, myRand(1,3));  % cross

    for iii=1:sum(seq(:, 1)==i) % this is shock
        oneShockTrial(wptr, seq(4*(i-1) + iii, 5), ziti_size, xcenter, ycenter, wrect);
    end

    jitter_isi(wptr, wrect, myRand(4,8)); % cross

end

%% for predicted altruism: one option is altruism and the other is zili

seq_shock = genseq_choice(); % lianxu shocks too much

for j = 1:size(seq_shock(:, 3), 1)
    options = item_con.all(seq_shock(i, [1 2]))';
    oneAl_Zili_Trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1);
end


end
