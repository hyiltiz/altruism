function s = altruism_pain()
%% this code
% deals with the fMRI exp. of altruism lowers pain

% created by whx and yuermai. And yuermai instructs the process.
% with the tremendous help of yuqinlin , keqin
% and Dr. chen lihan
% as well as the wonderful book
% by Dr. feng chenzhi.

% Jakob Thomassen (and huangyao) : control the output of analogue pulse
% from bits sharp  with matlab

% much still needs to be done to make sure it will work in fomral fMRI exp.
% keep fighting
% 150315

clear all;
global leftKey  rightKey escapeKey iCounter Events time_init;
time_init = GetSecs;
iCounter = 1;
Events = NaN(2, 5);

subinfo = getSubInfo  ;
seq = genSequence;
a = item_liangbiao;
design = [num2cell(seq(:, [1 2])) a.all(seq(:,[3 4])) num2cell(seq(:, 5))];
disp(design);
% keyboard;


try
    if exist('./data', 'dir') ~= 7
      mkdir('data');
    end

    AssertOpenGL; % Check if PTB-3 is properly installed on the system

    KbName('UnifyKeyNames');
    leftKey=KbName('3#');
    rightKey=KbName('4$');
    escapeKey=KbName('escape');
    %Screen('Preference', 'SkipSyncTests', 1); % drop for formal exp.

    screens=Screen('Screens');
    screenNumber=max(screens);

    %[wptr, wrect] = Screen('OpenWindow', screenNumber,0,  [300,50, 1300, 600]);% FOR debug
    [wptr, wrect] = Screen('OpenWindow', screenNumber,0);  % for formal  exp.
    [xcenter,ycenter] = RectCenter(wrect);
    HideCursor;

    Screen(wptr,'TextStyle',0);
    Screen('Preference', 'TextRenderer', 1);
    Screen('Preference', 'TextAntiAliasing', 1);
    Screen('TextFont', wptr, 'Microsoft Yahei'); % or `Microsoft Simsun`?

    trigger_mri(wptr, getTime('DummyScan')); % send s to trigger and dummy scan for 10s

    initializeSeq(wptr, 28, xcenter, ycenter, wrect, seq);

    sayGoodbye(wptr, 255);

    filename = [subinfo{1} '_' datestr(now, 30)];
    save(['./data/' filename],'Events');
    save(['./data/' filename '_full']);
    save all;
    s = load('all');
    sca;
    ListenChar(0);
    ShowCursor;
catch
    filename = [subinfo{1} '_' datestr(now, 30)];
    save(['./data/' filename '_buggy']);
    save all;
    s = load('all');
    sca;
    psychrethrow(psychlasterror);
    ListenChar(0);
    ShowCursor;
end

end
