
function  recordEvents(sub_response, pingmu, dianji, painRating)

%% record events with time
% created by yuermai ������Ὥ����������, 
% edited by whx, with the help of lujunshi
% 150331

%% sub_response : sub responses 
% 3 �����leftkey 
% 4 �Ҽ���rightkey
% 5 trigger S
% NaN no response

%% pingmu content:
% 1 ������ altruism trial
% 11 begin 12 end
% 2 ������ self-interest
% 3 ���壺 xieti
% 4 ����� shock; 
% 5 ���ۣ� pain rating
% 51 begin
% 52 end
% 6 ѡ�� xuanze
% 7 ʮ�֣� isi or ITI

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

% ����ȫ����Ϊ�ֶ�
% if nargin < 3
%     dianji = NaN;
%     painRating = NaN;  
% end

%% record
time_now = GetSecs - time_init;

Events(iCounter, :) = [time_now sub_response pingmu dianji painRating ];
iCounter = iCounter + 1;

end