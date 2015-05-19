function ret=txtInstruct(wptr,filename,align,color,title)
%txtInstruct.m
%2011-3-25
%Writer:PsyFeng
if nargin<2
    ret=-1;
    return;
end
if nargin<3
    align='left';
    color=0;
    title='实验指导语';
end
if nargin<4
    color=0;
    title='实验指导语';
end
if nargin<5
    title='实验指导语';
end
fid=fopen(filename,'r');
nofile=false;
if(fid<0)
    nofile=true;
end
[ws,hs]=Screen('WindowSize',wptr);
wrect=Screen('Rect',wptr);
wrect=GrowRect(wrect,-80,-60);
if wrect(3)<wrect(1) || wrect(4)<wrect(2)
    ret=-1;
    return;
end
Screen('FrameRect',wptr,0,wrect,3);
ts=Screen('TextBounds',wptr,'实');
linewords=floor((wrect(3)-wrect(1))/ts(3));
lineH=0;
if nofile
    tline=filename;
else
    tline=fgetl(fid);
end
i=1;
while ischar(tline)
    if isempty(tline)
        txts(i).('rect')=NaN;
        i=i+1;
        
    else
        linelen=length(tline);
        if mod(linelen,linewords)
            linelines=[1:linewords:linelen;linewords:linewords:linelen+linewords];
        else
            linelines=[1:linewords:linelen;linewords:linewords:linelen];
        end
        if mod(linelen,linewords)
            linelines(2,ceil(linelen/linewords))=linelen;
        end
        for j=1:ceil(linelen/linewords)
            txts(i).('content')=tline(linelines(1,j):linelines(2,j));
            txts(i).('rect')=Screen('TextBounds',wptr,tline(linelines(1,j):linelines(2,j)));
            switch lower(align)
                case {'center'} %center
                    txts(i).('x')=(ws-txts(i).rect(3))/2;
                case {'right'} %right
                    txts(i).('x')=wrect(3)-txts(i).rect(3)-(wrect(3)-wrect(1)-linewords*ts(3))/2;
                otherwise  %left
                    txts(i).('x')=wrect(1)+(wrect(3)-wrect(1)-linewords*ts(3))/2;
            end
            lineH=max(txts(i).rect(4),lineH);
            i=i+1;
        end
    end
    if nofile
        break;
    else
        tline=fgetl(fid);
    end
end
if ~nofile
    fclose(fid);
end
lines=length(txts);
pagelines=min(lines,floor((wrect(4)-wrect(2))/lineH));
pages=ceil(lines/pagelines);
if mod(lines,pagelines)
    pageline=[1:pagelines:lines;pagelines:pagelines:lines+pagelines];
else
    pageline=[1:pagelines:lines;pagelines:pagelines:lines];
end
if mod(lines,pagelines)
    pageline(2,pages)=lines;
end


for i=1:size(pageline,2)
    y=wrect(2)+(wrect(4)-wrect(2)-pagelines*lineH)/2;
    for j=pageline(1,i):pageline(2,i)
        txts(j).('y')=y;
        y=y+lineH;
    end
end

KbName('UnifyKeyNames');
leftKey=KbName('LeftArrow');
rightKey=KbName('RightArrow');
spaceKey=KbName('space');
oldcolor=Screen('TextColor',wptr,color);
curPage=1;
for i=pageline(1,curPage):pageline(2,curPage)
    if ~isnan(txts(i).rect)
        Screen('DrawText',wptr,txts(i).content,txts(i).x,txts(i).y);
    end
end

trect1=Screen('TextBounds',wptr,'<--向后翻页');
trect2=Screen('TextBounds',wptr,'-->或空格键向前翻页');
trect3=Screen('TextBounds',wptr,[num2str(curPage) '/' num2str(pages)]);
trect4=Screen('TextBounds',wptr,title);
x1=10; y1= hs-trect1(4)-10;
x2= ws-trect2(3)-10; y2= hs-trect2(4)-10;
x3= (ws-trect3(3))/2; y3= hs-trect3(4)-10;
x4=(ws-trect4(3))/2;y4=(60-trect4(4))/2;
Screen('TextColor',wptr,oldcolor);
Screen('DrawText',wptr,'<--向后翻页',x1,y1);
Screen('DrawText',wptr,'-->或空格键向前翻页',x2 ,y2);
Screen('DrawText',wptr,[num2str(curPage) '/' num2str(pages)],x3,y3);
Screen('DrawText',wptr,title,x4,y4);
Screen('Flip',wptr);
ListenChar(2);
while true
    [wd,secs,keyCode]=KbCheck;
    if keyCode(spaceKey) && curPage==pages
        break;
    elseif keyCode(leftKey) && curPage>1
        while KbCheck;end
        curPage=curPage-1;
        Screen('FrameRect',wptr,0,wrect,3);
        oldcolor=Screen('TextColor',wptr,color);
        for i=pageline(1,curPage):pageline(2,curPage)
            if ~isnan(txts(i).rect)
                Screen('DrawText',wptr,txts(i).content,txts(i).x,txts(i).y);
            end
        end
        trect3=Screen('TextBounds',wptr,[num2str(curPage) '/' num2str(pages)]);
	    x3= (ws-trect3(3))/2; y3= hs-trect3(4)-10;
	    Screen('TextColor',wptr,oldcolor);
        Screen('DrawText',wptr,'<--向后翻页',x1,y1);
	    Screen('DrawText',wptr,'-->或空格键向前翻页',x2 ,y2);
	    Screen('DrawText',wptr,[num2str(curPage) '/' num2str(pages)],x3,y3);
        Screen('DrawText',wptr,title,x4,y4);
        Screen('Flip',wptr);
    elseif (keyCode(rightKey) || keyCode(spaceKey)) && curPage<pages
        while KbCheck;end
        curPage=curPage+1;
        Screen('FrameRect',wptr,0,wrect,3);
        oldcolor=Screen('TextColor',wptr,color);
        for i=pageline(1,curPage):pageline(2,curPage)
            if ~isnan(txts(i).rect)
                Screen('DrawText',wptr,txts(i).content,txts(i).x,txts(i).y);
            end
        end
        trect3=Screen('TextBounds',wptr,[num2str(curPage) '/' num2str(pages)]);
	    x3= (ws-trect3(3))/2; y3= hs-trect3(4)-10;
        Screen('TextColor',wptr,oldcolor);
	    Screen('DrawText',wptr,'<--向后翻页',x1,y1);
	    Screen('DrawText',wptr,'-->或空格键向前翻页',x2 ,y2);
	    Screen('DrawText',wptr,[num2str(curPage) '/' num2str(pages)],x3,y3);
        Screen('DrawText',wptr,title,x4,y4);
        Screen('Flip',wptr);
    end        
end
while KbCheck; end
if ~nofile
    DrawFormattedText(wptr,'下面开始练习，按任意键继续','center','center');
    Screen('Flip',wptr);
    KbWait;
end
ListenChar(0);
clear txts pageline;
ret=0;
end