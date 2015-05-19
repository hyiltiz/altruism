% repetition
% 150316

function chongfu_trial(trial_type, num)
% 1: altruism trial
% 2: zili trial
% 3: ziti trial
% 4: al_zili trial
% num : chongfu cishu

if trial_type == 1
    do_trial = altruism_trial;
elseif trial_type == 2
    do_trial = zili_trial;
elseif trial_type == 3
    do_trial = ziti_trial;
elseif trial_type == 4
    do_trial = al_zili_trial;
end


for ii = 1:4
    do_trial
end

%% %% chongfu cishu
function chongfucishu(m)
