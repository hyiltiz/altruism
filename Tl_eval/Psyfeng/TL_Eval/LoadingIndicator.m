function LoadingIndicator(wptr,currentpercent,tiptext,color)
%LoadingIndicator.m
%2011-6-29
%fengchengzhi@suda.edu.cn
if nargin<4
    color=0;
end
wrect=Screen('Rect',wptr);
width=wrect(3)/2;
textWidth=Screen('TextBounds',wptr,[num2str(round(currentpercent)) '%']);
curR=AlignRect([0,0,round(width*currentpercent/100),40],[wrect(3)/4,...
    wrect(4)/2,wrect(3)/4+5,wrect(4)/2+5],'left','top');
textsize=24;
oldcolor=Screen('TextColor',wptr);
Screen('FillRect',wptr,[0 0 255],curR);
DrawFormattedText(wptr,'Initializing & Loading ...','center',wrect(4)/2-40,color);
[centerX,centerY]=RectCenter(curR);
if  round(currentpercent)~=100
    Screen('DrawText',wptr,[num2str(round(currentpercent)) '%'],...
        (centerX-textWidth(3)/2),centerY-textsize/2,[0,0,0]);
    Screen('DrawText',wptr,[num2str(round(currentpercent)) '%'],...
        (centerX-textWidth(3)/2)-1,centerY-textsize/2-1,[255 255 0]);
    Screen('DrawText',wptr,'->',curR(3),centerY-textsize/2,[255 255 0]);
elseif round(currentpercent)==100
    textWidth=Screen('TextBounds',wptr,tiptext);
    Screen('DrawText',wptr,tiptext,(centerX-textWidth(3)/2),...
        centerY-textsize/2,[0,0,0]);
    Screen('DrawText',wptr,tiptext,(centerX-textWidth(3)/2)-1,...
        centerY-textsize/2-1,[255 255 0]);
end
Screen('TextColor',wptr,oldcolor);
return