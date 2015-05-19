function [value,stime]=getChoice(wptr,items,runmode,moviemode)
%getChoice.m
%20-Feb-2013
%fengchengzhi@suda.edu.cn
ShowCursor;
wrect=Screen('Rect',wptr);
r1=[0 0 wrect(3)/2 30];
r1=CenterRect(r1,wrect);
r1=OffsetRect(r1,0,50);
rs=ArrangeRects(length(items),[0 0 5 30],r1);
Screen('FrameRect',wptr,0,rs');
%drawStim2(wptr,10,0,[0,0,0],x1,y);
for i=1:size(rs,1)
    drawText(wptr,items(i),[0 0 255],rs(i,:));
end
if moviemode
    Screen('AddFrameToMovie',wptr,[],'backbuffer');
    WaitSecs(3);
end
Screen('Flip',wptr,0,1);
tstart=GetSecs;
[x,y,buttons]=GetMouse(wptr);
while any(buttons)
    [x,y,buttons]=GetMouse(wptr);
end
value=0;
while (~any(buttons) || ~value) && ~runmode && ~moviemode
    [x,y,buttons]=GetMouse(wptr);
    for i=1:size(rs,1)
        if IsInRect(x,y,rs(i,:))
            Screen('FillRect',wptr,[169 169 169],UnionRect(rs(1,:),rs(end,:)));
            Screen('FrameRect',wptr,0,rs');
            for j=1:size(rs,1)
                drawText(wptr,items(j),[0 0 255],rs(j,:));
            end
            Screen('FillRect',wptr,[192 192 192],rs(i,:));
            drawText(wptr,items(i),[255 255 0],rs(i,:));
            Screen('Flip',wptr,0,1);
            value=i;
            break;
        else
            value=0;
        end
    end
end
Screen('FillRect',wptr,[169 169 169],UnionRect(rs(1,:),rs(end,:)));
Screen('Flip',wptr,0,1);
tend=GetSecs;
stime=tend-tstart;
HideCursor;
