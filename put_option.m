function put_option(wptr, which_font, ziti_size, xcenter, left_center, right_center, up_center, down_center,options, msg1, trialType)

% can use the same function with a switch block for all altruism, zili and ziti
% for altruism and ziti, provide the same which_font which does nothing
% then for ziti, change the ziti according to the value of which_font

global leftKey rightKey escapeKey ;

optionLeft = char(options(1));
optionRight = char(options(2));

if which_font == 0 % xieti on the left
    % 0=normal,1=bold,2=italic,4=underline,8=outline,32=condense,64=extend.
    % NOTE: 1 is *BOLD*. Do we want this? If yes, use 1 and 3 instead!
    markLeft = 2;
    markRight = 0; % right option
elseif which_font == 1 % xieti on the right
    markLeft = 0;
    markRight = 2; % right option
elseif isnan(which_font)
    markLeft = 0;
    markRight = 0;
else
  save buggy;
end

% first screen for subjects to choose
Screen(wptr,'TextStyle',0);
Screen('DrawText',wptr, double(msg1), xcenter-2*ziti_size, up_center, 255);
Screen(wptr,'TextStyle', markLeft);
Screen('DrawText',wptr, double(optionLeft),  left_center, down_center, 255);
Screen(wptr,'TextStyle',markRight);
Screen('DrawText',wptr, double(optionRight), right_center, down_center, 255);
Screen('Flip', wptr);

if trialType == 1
    recordEvents(NaN, 11, NaN, NaN);
elseif trialType == 2
    recordEvents(NaN, 21, NaN, NaN);
elseif trialType == 3
    recordEvents(NaN, 31, NaN, NaN);
end


ListenChar(2);

t_init = GetSecs;
t_now = GetSecs;

flag_isResponse = 0;

while t_now - t_init < getTime('TrialDuration') % 4s
    
    t_now = GetSecs;
    
    if flag_isResponse == 0
        [ keyIsDown, ~, keyCode ] = KbCheck;
        
        % If the user is pressing a key, then display its code number and name.
        if keyIsDown && ~isempty(find(keyCode, 1))
            event_key = NaN;
            if keyCode(leftKey)
                bbox_left = [left_center-4*ziti_size down_center left_center+4*ziti_size down_center];
                %bbox_right = [right_center-4*ziti_size down_center right_center+4*ziti_size down_center];
                Screen(wptr,'TextStyle', 0);
                Screen('DrawText',wptr, double(msg1), xcenter-2*ziti_size, up_center, 255);
                Screen(wptr,'TextStyle', markLeft);
                [~, ~, bboxL] = DrawFormattedText_box(wptr, double(optionLeft), left_center, down_center, WhiteIndex(wptr),  [], [], [], [], 0, bbox_left);
                Screen(wptr,'TextStyle', markRight);
                Screen('DrawText',wptr, double(optionRight), right_center, down_center, 255);
                
                rect = bboxL + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                event_key = 3;
                %recordEvents(3, 3, NaN, NaN);
                
            elseif keyCode(rightKey)
                %bbox_left = [left_center-4*ziti_size down_center left_center+4*ziti_size down_center];
                
                bbox_right = [right_center-4*ziti_size down_center right_center+4*ziti_size down_center];
                Screen(wptr,'TextStyle', 0);
                Screen('DrawText',wptr, double(msg1), xcenter-2*ziti_size, up_center, 255);
                Screen(wptr,'TextStyle', markLeft);
                Screen('DrawText',wptr, double(optionLeft),  left_center, down_center, 255);
                Screen(wptr,'TextStyle', markRight);
                [~, ~, bboxR] = DrawFormattedText_box(wptr, double(optionRight), right_center, down_center, WhiteIndex(wptr), [], [], [], [], 0, bbox_right);
                
                rect = bboxR + ziti_size*[-0.3 -0.2 0.3 0.6];
                Screen('FrameRect', wptr, [255,0,0], rect, 1);
                Screen('Flip', wptr);
                flag_isResponse = 1;
                event_key = 4;
                %recordEvents(4, 3, NaN, NaN);
                
            elseif keyCode(escapeKey)
                recordEvents(9, 9, 9, 9);
                error('Manually aborted!')
            end
            
            if trialType == 1
                recordEvents(event_key, 12, NaN, NaN);
            elseif trialType == 2
                recordEvents(event_key, 22, NaN, NaN);
            elseif trialType == 3
                recordEvents(event_key, 32, NaN, NaN);
            else
                % both 3 and 4 were not pressed
                error('Unknown trial type');
            end
            
            while KbCheck; end %prevent those who HOLDS DOWN the key
        end
    else
        % sub. press a button.
    end
    
    WaitSecs(0.001);
end

if flag_isResponse == 0
    % still no respone
    event_key = NaN;
    if trialType == 1
        recordEvents(event_key, 12, NaN, NaN);
    elseif trialType == 2
        recordEvents(event_key, 22, NaN, NaN);
    elseif trialType == 3
        recordEvents(event_key, 32, NaN, NaN);
    else
        % both 3 and 4 were not pressed
        error('Unknown trial type');
    end
end

ListenChar(0);
end
