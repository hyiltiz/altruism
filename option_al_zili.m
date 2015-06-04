

function  option_al_zili(wptr,  ziti_size, xcenter, left_center, right_center, up_center, down_center, options, msg1)

global leftKey  rightKey escapeKey ;

optionLeft = char(options(1));
optionRight = char(options(2));
x_diyihang =  xcenter-2*ziti_size;
txt_diyihang = msg1;
Screen('DrawText',wptr, txt_diyihang, x_diyihang, up_center, 255);
Screen('DrawText',wptr, optionLeft,  left_center, down_center, 255);
Screen('DrawText',wptr, optionRight, right_center, down_center, 255);
Screen('Flip', wptr);
%recordEvents(sub_response, pingmu, dianji, painRating)
recordEvents(NaN, 61, NaN, NaN);

ListenChar(2); %


t_init = GetSecs;
t_now = GetSecs;

flag_isResponse = 0;

while t_now - t_init < getTime('TrialDuration') % 4s
    
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
                [~, ~, bboxL] = DrawFormattedText_box(wptr, double(optionLeft), left_center, down_center, WhiteIndex(wptr),  [], [], [], [], 0, bbox_left);
                Screen('DrawText',wptr, optionRight, right_center, down_center, 255);
                rect = bboxL + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(3, 62, NaN, NaN);
                
            elseif keyCode(rightKey)
                
                Screen('DrawText',wptr, txt_diyihang, x_diyihang, up_center, 255);
                Screen('DrawText',wptr, optionLeft,  left_center, down_center, 255);
                [~, ~, bboxR] = DrawFormattedText_box(wptr, double(optionRight), right_center, down_center, WhiteIndex(wptr), [], [], [], [], 0, bbox_right);
                rect = bboxR + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                recordEvents(4, 62, NaN, NaN);
                
            elseif keyCode(escapeKey)
                recordEvents(9, 9, 9, 9);
                error('Manually aborted!')
                
            end
            
            while KbCheck; end %prevent those who HOLDS DOWN the key
        end
    else
        % he already pushed a button!
    end
    
    WaitSecs(0.001);
end

if flag_isResponse == 0
    % still no respone
    recordEvents(NaN, 62, NaN, NaN);
end

%recordEvents(NaN, 62, NaN, NaN);

ListenChar(0);
end
