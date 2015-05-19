% blocks : 36 3x3design
% blocks ; 4 altruism trials + 4 shock trials
% created by whx
% 150316

function results = repTrials_run4(wptr, trials)
LisstenChar(2);
for i = 1:2
    index = randi(length(trials));
    oneTrial(wptr, trials(index, 1));
end

%justSaySometing(wptr, '请做好准备，下面开始正式实验，按任意键开始',1);

WaitSecs(0.5);
for j = 1:length(trials)
    WaitSecs(0.5);
    [rt, correct, response] = oneTrial(wptr, trials(i));
    trials(i, 1).rt = rt;
    trials(i, 1).correct = correct;
    trials(i, 1).response = response;
end
ListenChar(0);
results = trials;

