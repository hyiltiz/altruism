function zhi_dao_yu(wptr, type)

% deals with the zhi dao yu at the very beginning of each block
% one pic for 4 seconds
lita = imread('lita.png');
liji = imread('liji.png');
ziti = imread('ziti.png');
myChoice = imread('myChoice.png');

recordEvents(NaN, 81, NaN, NaN);
whichContent = {lita, liji, ziti, myChoice};
t88 = Screen('MakeTexture', wptr, whichContent{type});
Screen('DrawTexture', wptr, t88);
Screen('Flip', wptr);
WaitSecs(getTime('Instruction'));

% NOTE: maybe a record event here
%recordEvents(sub_response, pingmu, dianji, painRating);
recordEvents(NaN, 82, NaN, NaN);
end
