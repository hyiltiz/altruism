%TL_Eval.m
%2011-7-6
%fengchengzhi@suda.edu.cn
clear all;
global mainfilename;
mainfilename=mfilename;
subinfo=getSubInfo2;
if isempty(subinfo)
    return;
else
    if exist(['Sub' subinfo{1} '.mat'],'file') || exist(['Sub' subinfo{1} '.xls'],'file')
        resp=questdlg({['The file ' '"Sub' subinfo{1} '.mat" or "Sub' subinfo{1} ...
            '.xls" already exists']; 'do you want to overwrite it?'},...
            'duplicate warning','Cancel','Ok','Ok');
        if ~strcmp(resp,'Ok')
            clc;
            disp('Experiment aborted!')
            return
        end
    end
end
KbName('UnifyKeyNames');
Screen('Preference', 'SkipSyncTests', 1); 
try
    [wptr,trials]=initializeConditions6(str2double(subinfo{1}));
    if isnan(wptr)
        sca;
        return;
    end
    if mod(str2double(subinfo{1}),2)
        txtInstruct(wptr,[mainfilename '_1.txt']);
    else
        txtInstruct(wptr,[mainfilename '_2.txt']);
    end
    results=repTrials_Run8(wptr,trials,str2double(subinfo{5}),50,...
        str2double(subinfo{6}),str2double(subinfo{7}));
    justSaySomething(wptr,'Now the datamerge is running, please wait...');
    if ~str2double(subinfo{7})
        results=dataMerge5(subinfo,results);
        justSaySomething(wptr,'Now analysis is running, please wait...');
        [avg,cr]=dataAnalysis5(results);
        justSaySomething(wptr,['Your average RT is ' num2str(avg) '\n'...
            'Your correct rate is ' num2str(cr*100) '%\nPress any key continue'],1);
    end
    sayGoodbye(wptr);
    sca;
    ShowCursor;
catch
    psychrethrow(psychlasterror);
    sca;
    ShowCursor;
end
return;
