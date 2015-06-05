function trigger_mri(wptr, dummyTime)
%% trigger the MRI
% 150324
% created by shenbo FROM TD_MRI for hangzhou fMRI EXP., edited by whx

% global iCounter Events time_init;
trigger_button = KbName('s');

% Hide the mouse cursor:
HideCursor;
% Returns as default the mean gray value of screen:
GrayIndex(wptr,0.0);

KbCheck;
WaitSecs(0.0001);
GetSecs;
% Set priority for script execution to realtime priority:
priorityLevel=MaxPriority(wptr);
Priority(priorityLevel);

message = '请用中指选 左侧选项\n请有食指选 右侧选项\n\n实验马上开始\n请按照真实情况\n作出选择';
DrawFormattedText_box(wptr,double(message),'center','center', WhiteIndex(wptr),[],[],[],2);
% Update the display to show the instruction text:
Screen('Flip', wptr);
% initialize KbCheck and variables to make sure they're properly
% initialized/allocted by Matlab - this to avoid time delays in the
% critical reaction time measurement part of the script:
[~, ~, KeyCode] = KbCheck;
while KeyCode(trigger_button) == 0
    [~, ~, KeyCode] = KbCheck;
    WaitSecs(0.00001);
end
% give a fixation when enter the program during Dummy Scan
%recordEvents(sub_response, pingmu, dianji, painRating);
recordEvents(NaN, 81, NaN, NaN);
%fix=fixation(wptr, '+ ', 255, 0);

%%%%%%%%%%%%%%%%%% DUMMY SCAN HERE dummy scan here %%%%%%%%%%%%%%%%%%%%
coverStory = imread('coverStory.png');
t88 = Screen('MakeTexture', wptr, coverStory);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(dummyTime);

%showFix(wptr,wrect,fix,dummyTime);
recordEvents(5, 82, NaN, NaN);
% whos('global');
% disp(iCounter);
% disp(Events);
end
