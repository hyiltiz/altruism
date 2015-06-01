function oneShockTrial(wptr, intensity, ziti_size, xcenter, ycenter, wrect)

left_center = xcenter - 6*ziti_size;
right_center = xcenter + 6*ziti_size;
up_center = ycenter - 2*ziti_size;

put_shock(wptr, intensity); % intensity : 1 4 6


%jitter_isi(wptr, wrect);
pain_rating(wptr,right_center, left_center, ycenter, up_center);

jitter = 4 + (8 -4 )*rand();
jitter_isi(wptr, wrect, jitter);

end

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
WaitSecs(3);
end
