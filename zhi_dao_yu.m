function zhi_dao_yu(wptr, type)

% deals with the zhi dao yu at the very beginning of each block
% one pic for 4 seconds
lita = imread('lita.png');
liji = imread('liji.png');
ziti = imread('ziti.png');

whichContent = {lita, liji, ziti};
t88 = Screen('MakeTexture', wptr, whichContent{type});
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(getTime('Instruction'));

% NOTE: maybe a record event here

end
