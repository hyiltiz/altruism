function put_shock(wptr, shock_type)
dianji = imread('dianji.png');
t88 = Screen('MakeTexture', wptr, dianji);
Screen('DrawTexture', wptr, t88);


DAC = [1 4 6]; % intensity: 1 4 6

if shock_type == 41
    DAC = 1;
elseif shock_type == 44
    DAC = 2;
elseif shock_type == 46
    DAC = 3;
end

%justSaySomething(wptr,num2str(DAC),1,0);

% justSaySomething(wptr, ['shock intensity is ' num2str(shock_type)], 1);
% BitsPlusPlus('DIOCommand', window, 4, mask, data, command , 0, 2, [0 0], DAC);

Screen('Flip', wptr);
WaitSecs(getTime('ShockDuration'));

end