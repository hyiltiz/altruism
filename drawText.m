function drawText(wptr,text,color,rect)
%drawText.m
%28-May-2013
%fengchengzhi@suda.edu.cn
if nargin<2
    return;
end
if nargin<3
    color=0;
    rect=Screen('Rect',wptr);
end
if nargin<4
    rect=Screen('Rect',wptr);
end
trect=Screen('TextBounds',wptr,text);
trect=CenterRect(trect,rect);
Screen('DrawText',wptr,text,trect(1),trect(2),color);
end
