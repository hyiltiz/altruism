function fix=fixation(wptr,type,color,backgroundcolor)
%fixation.m
%2011-3-26
%PsyFeng
if nargin<2
    type='+';
    color=0;
    backgroundcolor=255;
end
if nargin<3
    color=0;
    backgroundcolor=255;
end
if nargin<4
    backgroundcolor=255;
end    
wrect=Screen('Rect',wptr);
fixationSize=max(wrect(3),wrect(4))*3/100;
txtSize=floor(fixationSize);
if ~mod(fixationSize,2)
    fixationSize=fixationSize+1;
end
offptr=Screen('OpenOffscreenWindow',wptr,backgroundcolor,[0,0,fixationSize,fixationSize]);
switch lower(type)
    case {'.' '.+s'}
        Screen('FillOval',offptr,color);
        fix.ptr=offptr;
        fix.rect=[0 0 fixationSize fixationSize];
    case {'o' 'o+s'}
        Screen('FrameArc',offptr,color,[],0,360,fixationSize/2-2);
        fix.ptr=offptr;
        fix.rect=[0 0 fixationSize fixationSize];
    case {'*' '*+s'}
        oldsize=Screen('TextSize',offptr,txtSize);
        DrawFormattedText(offptr,'*','center','center',color);
        Screen('TextSize',offptr,oldsize);
        fix.rect=[0 0 fixationSize fixationSize];
        fix.ptr=offptr;
    case {'s'}
        fix.sound=1;
        fix.ptr=NaN;
    otherwise
        Screen('DrawLine',offptr,color,0,fixationSize/2,fixationSize,fixationSize/2,3);
        Screen('DrawLine',offptr,color,fixationSize/2,0,fixationSize/2,fixationSize,3);
        fix.ptr=offptr;
        fix.rect=[0 0 fixationSize fixationSize];
end
if ~isempty(strfind(lower(type),'s'))
    fix.sound=1;
else
    fix.sound=NaN;
end
end
