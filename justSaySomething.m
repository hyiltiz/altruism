function justSaySomething(wptr,something,waitornot,color)
%justSaySomething.m
if nargin<3
	waitornot=0;
    color=0;
end
if nargin<4
    color=0;
end
oldtxtcolor=Screen('TextColor',wptr);
DrawFormattedText(wptr,something,'center','center',color);
Screen('Flip',wptr);
Screen('TextColor',wptr,oldtxtcolor);
while KbCheck;end
if waitornot
	KbWait;
end
end