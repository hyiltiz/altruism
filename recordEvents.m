
function  recordEvents(sub_response, pingmu, dianji, painRating)

%% record events with time
% created by yuermai 玉尔麦提江·伊里提孜, 
% edited by whx, with the help of lujunshi
% 150331

%% sub_response : sub responses 
% 3 左键：leftkey 
% 4 右键：rightkey
% 5 trigger S
% NaN no response

%% pingmu content:
% 1 利他： altruism trial
% 11 begin 12 end
% 2 自利： self-interest
% 3 字体： xieti
% 4 电击： shock; 
% 5 评价： pain rating
% 51 begin
% 52 end
% 6 选择： xuanze
% 7 十字： isi or ITI

%% dianji : shock intensity
% 1 : 1 score intensity
% 4 : 4 score intensity
% 6 : 6 score intensity
%  NaN

%% painRating
% 0 ---- 10
% NaN no need

%whos('global')

global iCounter Events time_init;

%% test
% tmp = iCounter;
% whos('global');
% disp(iCounter);
% disp(Events);

% 后面全部改为手动
% if nargin < 3
%     dianji = NaN;
%     painRating = NaN;  
% end

%% record
time_now = GetSecs - time_init;

Events(iCounter, :) = [time_now sub_response pingmu dianji painRating ];
iCounter = iCounter + 1;

end
