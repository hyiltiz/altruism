
% zhidaoyu
% 150323

function zhidaoyu(wptr)

%global leftKey  rightKey;
%ListenChar(2);
pic1 = imread('picInstruct1.png');
pic2 = imread('picInstruct2.png');
pic3 = imread('picInstruct3.png');

t88 = Screen('MakeTexture', wptr, pic1);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(2);

t88 = Screen('MakeTexture', wptr, pic2);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(2);

t88 = Screen('MakeTexture', wptr, pic3);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(2);

%ListenChar(0);
return;

