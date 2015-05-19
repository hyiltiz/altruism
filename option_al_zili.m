

function [choice, decTime] = option_al_zili(wptr,  ziti_size, xcenter, left_center, right_center, up_center, down_center)

global leftKey rightKey;
item_con = xuanze_item;
al_left = char(item_con(1));
al_right = char(item_con(2));
x_diyihang =  xcenter-2*ziti_size;
txt_diyihang = 'Œ“—°‘Ò';
Screen('DrawText',wptr, txt_diyihang, x_diyihang, up_center, 255);
Screen('DrawText',wptr, al_left,  left_center, down_center, 255);
Screen('DrawText',wptr, al_right, right_center, down_center, 255);

Screen('Flip', wptr);
recordEvents(8, 3);

t_init = GetSecs;
t_now = GetSecs;
while t_now - t_init < 4;
    t_now = GetSecs;
    KbWait;
    [~, ~, KC] = KbCheck;
    if KC(leftKey)
        choice = 1;
        decTime = GetSecs;
        break;
    elseif KC(rightKey)
        choice = 0;
        decTime = GetSecs;
        break;
    end
end
return;