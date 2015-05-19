
%% this code
% deals with the fMRI exp. of altruism lowers pain

% created by wang haixia,
% with the tremendous help of yuermai 玉尔麦提江·伊里提孜, yuqinlin 余亲林, keqin可钦
% and Dr. chen lihan 陈立翰老师

% as well as the wonderful book
% entitled 《psychtoolbox工具箱及MATLAB编程实例》 by Dr. feng chenzhi.

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
KbName('UnifyKeyNames');
leftKey=KbName('3#');
rightKey=KbName('4$');
escapeKey=KbName('escape');

subinfo = getSubInfo;


if isempty(subinfo)
    return;
end
HideCursor;


%Screen('Preference', 'SkipSyncTests', 1); %正式实验要去掉

try
    AssertOpenGL;%Check if PTB-3 is properly installed on the system

    screens=Screen('Screens');
    screenNumber=max(screens);
    
    [wptr, wrect] = Screen('OpenWindow', screenNumber,0,  [300,50, 1300, 600]);% FOR debug
    %[wptr, wrect] = Screen('OpenWindow', screenNumber,0);  % for formal  exp.
    [xcenter,ycenter] = RectCenter(wrect);
    
    Screen(wptr,'TextStyle',1);
    Screen('TextFont', wptr, '宋体');
    
    trigger_mri(wptr, wrect, 1); % send s to trigger and dummy scan for 10s
    %zhidaoyu(wptr);
    initializeSeq(wptr, 28, xcenter, ycenter, wrect);
    
    sayGoodbye(wptr, 255);
    sca;
    
    ShowCursor;
    
    filename = [subinfo{1} '_'];
    save(filename,'Events');
    save all;
catch
    psychrethrow(psychlasterror);
    sca;
    ShowCursor;
    save all;
end
return;
