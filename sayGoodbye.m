function sayGoodbye(wptr,color)
%sayGoodbye.m
%29-May-2013
%fengchengzhi@suda.edu.cn
%edited by wanghaixia; 150320

if nargin<2
    color=0;
end
oldtxtcolor=Screen('TextColor',wptr);
DrawFormattedText(wptr,'实验结束！\n\n非常感谢！\n\n 请按ESC退...','center','center',color);
Screen('Flip',wptr);
Screen('TextColor',wptr,oldtxtcolor);
while true
    [~,~,keyCode]=KbCheck;
    if keyCode(KbName('escape'))
        break;
    end
end
