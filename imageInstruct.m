function ret=imageInstruct(wptr,prefix,postfix,fs)
%imageInstruct.m
%创建时间2011-3-24
%编写：PsyFeng
%edited by whx
if nargin<3
    warndlg('showInstruct函数调用参数不足！','Waring');
    ret=-1;
    return;
end
if nargin<4
    fs=1;
end
for i=1:fs
    imgs(i).('img')=imread([prefix num2str(i) '.' postfix]);
end
curImg=1;
wrect=Screen('Rect',wptr);
Screen('PutImage',wptr,imgs(curImg).img);
trect1=Screen('TextBounds',wptr,'<--向后翻页');
trect2=Screen('TextBounds',wptr,'-->或空格键向前翻页');
trect3=Screen('TextBounds',wptr,[num2str(curImg) '/' num2str(fs)]);

x1=10; y1= wrect(4)-trect1(4)-10;
x2= wrect(3)-trect2(3)-10; y2= wrect(4)-trect2(4)-10;
x3= (wrect(3)-trect3(3))/2; y3= wrect(4)-trect3(4)-10;
Screen('DrawText',wptr,'<--向后翻页',x1,y1);
Screen('DrawText',wptr,'-->或空格键向前翻页',x2 ,y2);
Screen('DrawText',wptr,[num2str(curImg) '/' num2str(fs)],x3,y3);

Screen('Flip',wptr);
leftKey=KbName('3#');
rightKey=KbName('4$');
spaceKey=KbName('3#');
ListenChar(2);
while true
    [~,~,keyCode]=KbCheck;
    if keyCode(spaceKey) && curImg==fs
        break;
    elseif keyCode(leftKey) && curImg>1
        while KbCheck;end
        curImg=curImg-1;
        Screen('PutImage',wptr,imgs(curImg).img);
        trect3=Screen('TextBounds',wptr,[num2str(curImg) '/' num2str(fs)]);
	    x3= (wrect(3)-trect3(3))/2; y3= wrect(4)-trect3(4)-10;
	    Screen('DrawText',wptr,'<--向后翻页',x1,y1);
	    Screen('DrawText',wptr,'-->或空格键向前翻页',x2 ,y2);
	    Screen('DrawText',wptr,[num2str(curImg) '/' num2str(fs)],x3,y3);
        Screen('Flip',wptr);
    elseif (keyCode(rightKey) || keyCode(spaceKey)) && curImg<fs
        while KbCheck;end
        curImg=curImg+1;
        Screen('PutImage',wptr,imgs(curImg).img);
        trect3=Screen('TextBounds',wptr,[num2str(curImg) '/' num2str(fs)]);
	    x3= (wrect(3)-trect3(3))/2; y3= wrect(4)-trect3(4)-10;
	    Screen('DrawText',wptr,'<--向后翻页',x1,y1);
	    Screen('DrawText',wptr,'-->或空格键向前翻页',x2 ,y2);
	    Screen('DrawText',wptr,[num2str(curImg) '/' num2str(fs)],x3,y3);
        Screen('Flip',wptr);
    end        
end
while KbCheck; end
% DrawFormattedText(wptr,'下面开始练习，按任意键继续','center','center');
% Screen('Flip',wptr);
%KbWait;
ListenChar(0);
clear imgs;
ret=0;
end

