function pain_rating(wptr,right_center, left_center,  ycenter, up_center)
%% pain rating
% 150315
% created by whx, with the help of yuermai and keqin and DR. chen lihan

global leftKey  rightKey escapeKey ;

x_changdu = right_center-left_center;

x_changdu_unit = x_changdu / 10;
changdu_juzheng = [];
for i = 0:10
    x_zuobiao = left_center + i * x_changdu_unit;
    changdu_juzheng = [changdu_juzheng; x_zuobiao];
    %zuobiao_init = changdu_juzheng;
end
changdu_list = sort(changdu_juzheng);
changdu_juzheng = Shuffle(changdu_juzheng);
changdu = changdu_juzheng(1);
% save all;

Screen(wptr,'TextStyle',0);
Screen('DrawLine', wptr, 255, left_center, ycenter, right_center, ycenter);
Screen('gluDisk', wptr, 255, changdu, ycenter, 15);
%left and right endpoint
left_info = '不痛';
DrawFormattedText(wptr, double(left_info), left_center - 30, ycenter + 35, 255);
right_info = '最痛';
DrawFormattedText(wptr, double(right_info), right_center - 25, ycenter + 35, 255);
title = '请评价刚才的疼痛感受：';
x_title = left_center + x_changdu/2 - 4*x_changdu_unit;
y_title = up_center - x_changdu_unit + 15;
DrawFormattedText(wptr, double(title), x_title , y_title , 255);

Screen('Flip', wptr);


ListenChar(2); % 监听除MATLAB命令窗口以外的按键行为，

t_init = GetSecs;
t_now = GetSecs;
changdu_cn=changdu;
%recordEvents(sub_response, pingmu, dianji, painRating)
recordEvents(NaN, 51,NaN,find(abs(changdu_list - changdu_cn) < .0001, 1)); %list元素都减
%recordEvents(8, 51,NaN,changdu_cn,NaN,NaN);
while t_now - t_init < getTime('PainRatingWait')

    t_now = GetSecs;

    [ keyIsDown, ~, keyCode ] = KbCheck;

    % If the user is pressing a key, then display its code number and name.
    if keyIsDown && keyCode(escapeKey)
        break;
    end

    if keyIsDown && ~isempty(find(keyCode, 1))
        if keyCode(leftKey)

            changdu_cn = changdu_cn - x_changdu_unit;

            if  changdu_cn<= left_center
                changdu_cn = left_center;
            end
            %recordEvents(sub_response, pingmu, dianji, painRating)
            %save all
            recordEvents(3, 52, NaN, find(abs(changdu_list - changdu_cn) < .0001, 1) );

        elseif keyCode(rightKey)

            changdu_cn = changdu_cn + x_changdu_unit;

            if changdu_cn> right_center
                changdu_cn = right_center;
            end
            recordEvents(4, 52, NaN, find(abs(changdu_list - changdu_cn) < .0001, 1) );

        end

        %sub_response = find(keyCode, 1);

        Screen('DrawLine', wptr, 255, left_center, ycenter, right_center, ycenter);
        %left and right endpoint
        left_info = '不痛';
        DrawFormattedText_box(wptr, double(left_info), left_center - 30, ycenter + 35, 255);
        right_info = '最痛';
        DrawFormattedText_box(wptr, double(right_info), right_center - 25, ycenter + 35, 255);
        title = '请评价刚才的疼痛感受：';
        DrawFormattedText_box(wptr, double(title), x_title, y_title , 255);
        Screen('gluDisk', wptr, [255 0 0], changdu_cn, ycenter, 15);
        Screen('Flip', wptr);
        %recordEvents(NaN, 5,NaN,find(changdu_list==changdu_cn),NaN);

        while KbCheck; end %prevent those who HOLDS DOWN the key
        %recordEvents(sub_response, pingmu, dianji, painRating)

    end

    WaitSecs(0.001);
end
%recordEvents(sub_response, pingmu, dianji, painRating)
recordEvents(NaN, 52,NaN,find(abs(changdu_list - changdu_cn) < .0001, 1));

end
