<<<<<<< HEAD
<<<<<<< HEAD

%% option
% 150315

function option_al(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, xuhao, init_item_num)
=======
function option_al(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center,options)
>>>>>>> 1394a75... re-ordered the whole project:
=======
function option_al(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center,options, msg1)
>>>>>>> 11b4c43... add the last part ;

global leftKey  rightKey escapeKey ;

item_con = item_liangbiao(1, xuhao, init_item_num);
al_left = char(item_con(1));
al_right = char(item_con(2));
x_diyihang =  xcenter-2*ziti_size;
txt_diyihang = msg1;
Screen('DrawText',wptr, txt_diyihang, x_diyihang, up_center, 255);
Screen('DrawText',wptr, al_left,  left_center, down_center, 255);
Screen('DrawText',wptr, al_right, right_center, down_center, 255);
Screen('Flip', wptr);
%recordEvents(sub_response, pingmu, dianji, painRating)
recordEvents(NaN, 11, NaN, NaN);

ListenChar(2); %


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

                Screen('DrawText',wptr, txt_diyihang, x_diyihang, up_center, 255);
                [~, ~, bboxL] = DrawFormattedText_box(wptr, double(al_left), left_center, down_center, WhiteIndex(wptr),  [], [], [], [], 0, bbox_left);
                Screen('DrawText',wptr, al_right, right_center, down_center, 255);
                rect = bboxL + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(3, 1, NaN, NaN);

            elseif keyCode(rightKey)

                Screen('DrawText',wptr, txt_diyihang, x_diyihang, up_center, 255);
                Screen('DrawText',wptr, al_left,  left_center, down_center, 255);
                [~, ~, bboxR] = DrawFormattedText_box(wptr, double(al_right), right_center, down_center, WhiteIndex(wptr), [], [], [], [], 0, bbox_right);
                rect = bboxR + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(4, 1, NaN, NaN);

            end

            while KbCheck; end %prevent those who HOLDS DOWN the key
        end
    else
        % he already pushed a button!
    end

    WaitSecs(0.001);
end

recordEvents(NaN, 12, NaN, NaN);

ListenChar(0);
end
