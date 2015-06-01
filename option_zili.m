function option_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, options)
%% option zili
% 150315

<<<<<<< HEAD
function option_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num)

=======
>>>>>>> 1394a75... re-ordered the whole project:
global leftKey rightKey escapeKey;

item_con = item_liangbiao(2, xuhao, init_item_num);
zili_left = char(item_con(1));
zili_right = char(item_con(2));
txt_diyihang = '我选择';
Screen('DrawText',wptr, txt_diyihang, xcenter-2*ziti_size, up_center, 255);
Screen('DrawText',wptr, zili_left,  left_center, down_center, 255);
Screen('DrawText',wptr, zili_right, right_center, down_center, 255);
Screen('Flip', wptr);
recordEvents(NaN, 21, NaN, NaN);

ListenChar(2); % ������MATLAB����������İ�����Ϊ��

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

        bbox_left = [left_center-4*ziti_size down_center left_center+4*ziti_size down_center];
        bbox_right = [right_center-4*ziti_size down_center right_center+4*ziti_size down_center];


        if keyIsDown && ~isempty(find(keyCode, 1))
            if keyCode(leftKey)
Screen('DrawText',wptr, txt_diyihang, xcenter-2*ziti_size, up_center, 255);
                [~, ~, bboxL] = DrawFormattedText_box(wptr, double(zili_left), left_center, down_center, WhiteIndex(wptr),  [], [], [], [], 0, bbox_left);
                Screen('DrawText',wptr, zili_right, right_center, down_center, 255);

                rect = bboxL + ziti_size*[-0.3 -0.2 0.3 0.6];

                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(3, 2, NaN, NaN);

            elseif keyCode(rightKey)
Screen('DrawText',wptr, txt_diyihang, xcenter-2*ziti_size, up_center, 255);
                Screen('DrawText',wptr, zili_left,  left_center, down_center, 255);

                [~, ~, bboxR] = DrawFormattedText_box(wptr, double(zili_right), right_center, down_center, WhiteIndex(wptr), [], [], [], [], 0, bbox_right);

                rect = bboxR + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(4, 2, NaN, NaN);

            end

            while KbCheck; end %prevent those who HOLDS DOWN the key
        end
    else
        % sub. already press a button
    end
    WaitSecs(0.001);
end

recordEvents(NaN, 22, NaN, NaN);

ListenChar(0);
end
