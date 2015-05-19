
function oneBlock(wptr, block_type, qiang_du)
% 利他：9个block

if block_type == 1
    al_block(wptr, qiang_du);
elseif block_type == 2
    zili_block(wptr, qiang_du);
elseif block_type == 3
    ziti_block(wptr, qiang_du);
end

return;

%% %% al_block
function al_block(wptr, qiang_du)


% 指导语4s
cover_story = imread('lita.png');
t88 = Screen('MakeTexture', wptr, cover_story);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(4);

% 4个利他
for aa = 1:4
    oneTrial(wptr, 1,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
end

% 空屏6s
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,6);
Screen('Flip', wptr);

% 4个shock
for ss = 1:4
    oneTrial(wptr, 4,ziti_size, xcenter, ycenter, wrect, qiang_du); % shock 4 times
end

% ITI 4-7s
jitter = myRand(4,7);
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,jitter);
Screen('Flip', wptr);

return;

%% %% zili_block
function zili_block(wptr, qiang_du)

% 指导语4s
cover_story = imread('liji.png');
t88 = Screen('MakeTexture', wptr, cover_story);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(4);

% 4个利他
for aa = 1:4
    oneTrial(wptr, 2,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
end

% 空屏6s
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,6);
Screen('Flip', wptr);

% 4个shock
for ss = 1:4
    oneTrial(wptr, 4,ziti_size, xcenter, ycenter, wrect, qiang_du); % shock 4 times
end

% ITI 4-7s
jitter = myRand(4,7);
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,jitter);
Screen('Flip', wptr);

return;

%% %% ziti_block
function ziti_block(wptr, qiang_du)

% 指导语4s
cover_story = imread('ziti.png');
t88 = Screen('MakeTexture', wptr, cover_story);
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(4);

% 4个利他
for aa = 1:4
    oneTrial(wptr, 3,ziti_size, xcenter, ycenter, wrect); % altruism 4 times
end

% 空屏6s
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,6);
Screen('Flip', wptr);

% 4个shock
for ss = 1:4
    oneTrial(wptr, 4,ziti_size, xcenter, ycenter, wrect, qiang_du); % shock 4 times
end

% ITI 4-7s
jitter = myRand(4,7);
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,jitter);
Screen('Flip', wptr);

return;