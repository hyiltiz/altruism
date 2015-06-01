function  option_ziti(wptr, which_font, ziti_size, xcenter, left_center, right_center, up_center, down_center, options)
%% option
% 150315
<<<<<<< HEAD

function  option_ziti(wptr, which_font, ziti_size, xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num)

=======
>>>>>>> 1394a75... re-ordered the whole project:
global leftKey  rightKey escapeKey ;

item_con = item_liangbiao(3, xuhao, init_item_num);
ziti_left = char(item_con(1));
ziti_right = char(item_con(2));

if which_font == 0
    mark_ziti = 1;
    mark_ziti2 = 2;
elseif which_font == 1
    mark_ziti = 2;
    mark_ziti2 = 1;
end

% first screen for subjects to choose
Screen(wptr,'TextStyle',1);
Screen('DrawText',wptr, '我选择', xcenter-2*ziti_size, up_center, 255);
Screen(wptr,'TextStyle', mark_ziti);
Screen('DrawText',wptr, ziti_left,  left_center, down_center, 255);
Screen(wptr,'TextStyle',mark_ziti2);
Screen('DrawText',wptr, ziti_right, right_center, down_center, 255);
Screen('Flip', wptr);
recordEvents(NaN, 31, NaN, NaN);

ListenChar(2); % 监听除MATLAB命令窗口以外的按键行为，

t_init = GetSecs;
t_now = GetSecs;

flag_isResponse = 0;

while t_now - t_init < 4

    t_now = GetSecs;

    if flag_isResponse == 0
        [ keyIsDown, ~, keyCode ] = KbCheck;

        % If the user is pressing a key, then display its code number and name.
        if keyIsDown && keyCode(escapeKey)
            break;
        end


        if keyIsDown && ~isempty(find(keyCode, 1))
            if keyCode(leftKey)
                bbox_left = [left_center-4*ziti_size down_center left_center+4*ziti_size down_center];
                %bbox_right = [right_center-4*ziti_size down_center right_center+4*ziti_size down_center];
                Screen(wptr,'TextStyle', 1);
                Screen('DrawText',wptr, '我选择', xcenter-2*ziti_size, up_center, 255);
                Screen(wptr,'TextStyle', mark_ziti);
                [~, ~, bboxL] = DrawFormattedText_box(wptr, double(ziti_left), left_center, down_center, WhiteIndex(wptr),  [], [], [], [], 0, bbox_left);
                Screen(wptr,'TextStyle', mark_ziti2);
                Screen('DrawText',wptr, ziti_right, right_center, down_center, 255);

                rect = bboxL + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(3, 3, NaN, NaN);

            elseif keyCode(rightKey)
                %bbox_left = [left_center-4*ziti_size down_center left_center+4*ziti_size down_center];

                bbox_right = [right_center-4*ziti_size down_center right_center+4*ziti_size down_center];
                Screen(wptr,'TextStyle', 1);
                Screen('DrawText',wptr, '我选择', xcenter-2*ziti_size, up_center, 255);
                Screen(wptr,'TextStyle', mark_ziti);
                Screen('DrawText',wptr, ziti_left,  left_center, down_center, 255);
                Screen(wptr,'TextStyle', mark_ziti2);
                [~, ~, bboxR] = DrawFormattedText_box(wptr, double(ziti_right), right_center, down_center, WhiteIndex(wptr), [], [], [], [], 0, bbox_right);

                rect = bboxR + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(4, 3, NaN, NaN);

            end

            while KbCheck; end %prevent those who HOLDS DOWN the key
        end
    else
        % sub. press a button.
    end

    WaitSecs(0.001);
end
recordEvents(NaN, 32, NaN, NaN);
ListenChar(0);
end
