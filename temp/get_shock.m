% shock screen
% 150315

function get_shock(wptr, shock_type)
dianji = imread('dianji.png');
t88 = Screen('MakeTexture', wptr, dianji);
Screen('DrawTexture', wptr, t88);

DAC = [1 4 6] % intensity: 1 4 6

if shock_type == 1
    DAC = 1;
elseif shock_type == 2
    DAC = 2;
elseif shock_type == 3
    DAC = 3;
end

BitsPlusPlus('DIOCommand', window, repetitions, mask, data, command , 0, 2, [0 0], DAC);

Screen('Flip', wptr);
WaitSecs(3);
end