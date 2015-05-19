
%% one trial
% 150322
% created by whx, with the help of yuermai

function oneTrial(wptr, trial_type, ziti_size, xcenter, ycenter, wrect,   shock_type )


if nargin < 7
    shock_type = [];
end


xuhao = rand(18, 1);
init_item_num = Shuffle([1:18 1:18]);


if trial_type == 1 % altruism trial
    
    altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num);
    
elseif trial_type == 2 % self-interest
    
    zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num);
    
elseif trial_type == 3 % xieti
    
    ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num);
    
elseif trial_type == 41 % shock 1 score
   shock_trial(wptr,ziti_size, xcenter, ycenter, wrect, shock_type);

elseif trial_type == 44 % shock 4 score
   shock_trial(wptr,ziti_size, xcenter, ycenter, wrect, shock_type);

elseif trial_type == 46 % shock 6 score
    shock_trial(wptr,ziti_size, xcenter, ycenter, wrect, shock_type);
    
elseif trial_type == 5  % xuanze
    
    xuan_al_zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num);
end

return;

%% %%
function  altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_al(wptr, ziti_size,  xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num);

jitter_isi(wptr, wrect);

return;

%% %%
function ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

%which_font = round(rand);
if rand > 0.5 
    which_font = 1;
else
    which_font = 0;
end
option_ziti(wptr, which_font, ziti_size, xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num);

jitter_isi(wptr, wrect);

return;

%% %%
function  zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num);

jitter_isi(wptr, wrect);

return;

%% %%
function  xuan_al_zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, xuhao, init_item_num)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_al_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num)

jitter_isi(wptr, wrect);

return;


%% %%
function  shock_trial(wptr,ziti_size, xcenter, ycenter, wrect, shock_type)

left_center = xcenter - 6*ziti_size;
right_center = xcenter + 6*ziti_size;
up_center = ycenter - 2*ziti_size;

get_shock(wptr, shock_type); % intensity : 1 4 6


jitter_isi(wptr, wrect);
pain_rating(wptr,right_center, left_center, ycenter, up_center);

jitter_isi(wptr, wrect);

return;

%% %%
function get_shock(wptr, shock_type)
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
return;



