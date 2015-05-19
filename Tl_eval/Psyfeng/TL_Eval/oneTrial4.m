function [rt,correct,response,value]=oneTrial4(wptr,trial,runmode,moviemode)
%oneTrial4.m
%2011-4-7
%fengchengzhi@suda.edu.cn

if nargin<3
    runmode=0;
    moviemode=0;
end
wrect=Screen('Rect',wptr);
HideCursor;
%begin task one
showFix1(wptr,wrect,trial.fixptr);
if moviemode
    Screen('AddFrameToMovie',wptr,[],'backbuffer');
    WaitSecs(3);
end
Screen('Flip',wptr); 
if ~isnan(trial.fixptr.sound)
    beep;
end
WaitSecs(0.5);
responsed=false;
maskshowed=false;
targetshowed=false;
targetcleared=false;
starttime=0;
if trial.F1==1 %Left target
    if trial.targettime>=trial.F2/1000 && trial.F2~=0
        showFix1(wptr,wrect,trial.fixptr);
        drawStim2(wptr,trial.targetradius,0,trial.targetcolor,trial.leftx,trial.y);
        if moviemode
            Screen('AddFrameToMovie',wptr,[],'backbuffer');
        end
        Screen('Flip',wptr);
        starttime=GetSecs;
        while true
            [mx,my,buttons]=GetMouse(wptr);
            if any(buttons)
                endtime=GetSecs;
                Screen('Flip',wptr);
                responsed=true;
                break;
            end
            if GetSecs-starttime>=trial.F2/1000 && ~maskshowed
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.leftx,trial.y);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.rightx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                maskshowed=true;
                Screen('Flip',wptr,0,1);
            end
            if GetSecs-starttime>=trial.targettime && ~targetcleared
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.targetradius,0,255,trial.leftx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                targetcleared=true;
            end
            if GetSecs-starttime>=((trial.targettime-trial.F2/1000)+trial.masktime)
                Screen('FillRect',wptr,[169 169 169]);
                showFix1(wptr,wrect,trial.fixptr);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                break;
            end
        end
    elseif trial.F2==0
        showFix1(wptr,wrect,trial.fixptr);
        drawStim2(wptr,trial.targetradius,0,trial.targetcolor,trial.leftx,trial.y);
        drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
            trial.maskcolor,trial.leftx,trial.y);
        drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
            trial.maskcolor,trial.rightx,trial.y);
        if moviemode
            Screen('AddFrameToMovie',wptr,[],'backbuffer');
        end
        Screen('Flip',wptr);
        starttime=GetSecs;
        while true
            [mx,my,buttons]=GetMouse(wptr);
            if any(buttons)
                endtime=GetSecs;
                Screen('Flip',wptr);
                responsed=true;
                break;
            end
            if GetSecs-starttime>=trial.targettime && ~targetshowed
                drawStim2(wptr,trial.targetradius,0,255,trial.leftx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                targetshowed=true;
            end
            if GetSecs-starttime>=trial.masktime
                Screen('FillRect',wptr,[169 169 169]);
                showFix1(wptr,wrect,trial.fixptr);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                break;
            end
        end
    elseif trial.targettime<trial.F2/1000
        showFix1(wptr,wrect,trial.fixptr);
        drawStim2(wptr,trial.targetradius,0,trial.targetcolor,trial.leftx,trial.y);
        if moviemode
            Screen('AddFrameToMovie',wptr,[],'backbuffer');
        end
        Screen('Flip',wptr);
        starttime=GetSecs;
        while true
            [mx,my,buttons]=GetMouse(wptr);
            if any(buttons)
                endtime=GetSecs;
                Screen('Flip',wptr);
                responsed=true;
                break;
            end
            if GetSecs-starttime>=trial.targettime && ~maskshowed
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.leftx,trial.y);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.rightx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr);
                maskshowed=true;
            end
            if GetSecs-starttime>=(trial.targettime+trial.F2/1000+trial.masktime)
                Screen('FillRect',wptr,[169 169 169]);
                showFix1(wptr,wrect,trial.fixptr);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                break;
            end
        end
    end
else %Right Target
     if trial.targettime>=trial.F2/1000 && trial.F2~=0
        showFix1(wptr,wrect,trial.fixptr);
        drawStim2(wptr,trial.targetradius,0,trial.targetcolor,trial.rightx,trial.y);
        if moviemode
            Screen('AddFrameToMovie',wptr,[],'backbuffer');
        end
        Screen('Flip',wptr);
        starttime=GetSecs;
        while true
            [mx,my,buttons]=GetMouse(wptr);
            if any(buttons)
                endtime=GetSecs;
                Screen('Flip',wptr);
                responsed=true;
                break;
            end
            if GetSecs-starttime>=trial.F2/1000 && ~maskshowed
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.leftx,trial.y);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.rightx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                maskshowed=true;
                Screen('Flip',wptr,0,1);
            end
            if GetSecs-starttime>=trial.targettime && ~targetcleared
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.targetradius,0,255,trial.rightx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                targetcleared=true;
            end
            if GetSecs-starttime>=((trial.targettime-trial.F2/1000)+trial.masktime)
                Screen('FillRect',wptr,[169 169 169]);
                showFix1(wptr,wrect,trial.fixptr);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                break;
            end
        end
    elseif trial.F2==0
        showFix1(wptr,wrect,trial.fixptr);
        drawStim2(wptr,trial.targetradius,0,trial.targetcolor,trial.rightx,trial.y);
        drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
            trial.maskcolor,trial.leftx,trial.y);
        drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
            trial.maskcolor,trial.rightx,trial.y);
        if moviemode
            Screen('AddFrameToMovie',wptr,[],'backbuffer');
        end
        Screen('Flip',wptr);
        starttime=GetSecs;
        while true
            [mx,my,buttons]=GetMouse(wptr);
            if any(buttons)
                endtime=GetSecs;
                Screen('Flip',wptr);
                responsed=true;
                break;
            end
            if GetSecs-starttime>=trial.targettime && ~targetshowed
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.targetradius,0,255,trial.rightx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                targetshowed=true;
            end
            if GetSecs-starttime>=trial.masktime
                Screen('FillRect',wptr,[169 169 169]);
                showFix1(wptr,wrect,trial.fixptr);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                break;
            end
        end
    elseif trial.targettime<trial.F2/1000
        showFix1(wptr,wrect,trial.fixptr);
        drawStim2(wptr,trial.targetradius,0,trial.targetcolor,trial.rightx,trial.y);
        if moviemode
            Screen('AddFrameToMovie',wptr,[],'backbuffer');
        end
        Screen('Flip',wptr);
        starttime=GetSecs;
        while true
            [mx,my,buttons]=GetMouse(wptr);
            if any(buttons)
                endtime=GetSecs;
                Screen('Flip',wptr);
                responsed=true;
                break;
            end
            if GetSecs-starttime>=trial.targettime && ~maskshowed
                showFix1(wptr,wrect,trial.fixptr);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.leftx,trial.y);
                drawStim2(wptr,trial.maskoutradius,trial.maskinnerradius,...
                    trial.maskcolor,trial.rightx,trial.y);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr);
                maskshowed=true;
            end
            if GetSecs-starttime>=(trial.targettime+trial.F2/1000+trial.masktime)
                Screen('FillRect',wptr,[169 169 169]);
                showFix1(wptr,wrect,trial.fixptr);
                if moviemode
                    Screen('AddFrameToMovie',wptr,[],'backbuffer');
                end
                Screen('Flip',wptr,0,1);
                break;
            end
        end
    end
end
while ~responsed && ~runmode && ~moviemode
    [mx,my,buttons]=GetMouse(wptr);
    [wd,secs,keyCode]=KbCheck;
    if any(buttons)
        endtime=GetSecs;
        break;
    end
    if keyCode(KbName('escape'))
        rt=-1;
        correct=-1;
        response=-1;
        value=0;
        return;
    end
end
items='-12345+';
[value,stime]=getChoice(wptr,items,runmode,moviemode);

if runmode || moviemode
    rt=[rand rand];
    correct=randi(2)-1;
    response=0;
    value=randi(length(items));
    WaitSecs(rand);
else
    rt(1)=endtime-starttime;
    rt(2)=stime;
    correct=buttons(trial.correctKey);
    response=find(buttons);
    WaitSecs(1);
end
