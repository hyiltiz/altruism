function results=repTrials_Run8(wptr,trials,practicetrials,trialsperblock,...
    runmode,moviemode)
%repTrials_Run8.m
%2011-4-2
%fengchengzhi@suda.edu.cn
global mainfilename
ListenChar(2);
if moviemode
    tempfilename=[pwd '\' mainfilename '.mov'];
    movieptr=Screen('CreateMovie',wptr,tempfilename,[],[],2);
    Screen('AddFrameToMovie',wptr,[],'backbuffer');
else
    movieptr=0;
end
for i=1:practicetrials
    index=randi(length(trials));
    oneTrial4(wptr,trials(index,1),runmode,moviemode);
end
if moviemode
    Screen('FinalizeMovie',movieptr);
    results=trials;
    ListenChar(0);
    return;
end
if ~runmode
    justSaySomething(wptr,'请做好准备，下面开始正式实验，按任意键开始',1);
    WaitSecs(2);
end
for i=1:length(trials)
    if ~runmode
        WaitSecs(0.5);
    end
    [rt,correct,response,value]=oneTrial4(wptr,trials(i),runmode,moviemode);
    if rt<0
        disp(['The exit no. ' num2str(i)]);
        trials(i,1).correct=[];
        trials(i,1).response=[];
        trials(i,1).rt1=[];
        trials(i,1).rt2=[];
        trials(i,1).value=0;
        break;
    end
    trials(i,1).rt1=rt(1);
    trials(i,1).rt2=rt(2);
    trials(i,1).value=value;
    trials(i,1).correct=correct;
    trials(i,1).response=response;
    if mod(i,trialsperblock)==0 && i<length(trials) && ~runmode
        tips=['Block_' num2str(floor(i/trialsperblock)) '/' ...
            num2str(ceil(length(trials)/trialsperblock)) ...
            ' finished.\n\nPlease take a break.\n\nAny key to Continue!'];
        justSaySomething(wptr,tips,1);
        WaitSecs(1);
    end
end
ListenChar(0);
results=trials;