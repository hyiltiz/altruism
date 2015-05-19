
%% %% oneTrial
% 150316

function [rt, correct, response] = one_trial(wptr, trial, time)
global validKeys
Screen('CopyWindow', wptr, 0, 0);
Screen('Flip', wptr);
WaitSecs(0.5);
startTime = GetSecs;
while true
    [~, ~, keyCode] = KbCheck;
    if sum(keyCode(validKeys))
        endTime = GetSecs;
        Screen('Flip', wptr);
        break;
    end
    
    if GetSecs - startTime  >= time
        Screen('Flip', wptr);
    end
end

rt = endTime - startTime;
correct = sum(keyCode(trial.correctKey));
response = find(keyCode);
