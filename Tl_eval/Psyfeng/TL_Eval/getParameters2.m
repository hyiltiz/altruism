function paras=getParameters2()
%getParameters2.m
%2011-4-7
%fengchengzhi@suda.edu.cn
global mainfilename;
prompt = {'目标及掩蔽刺激内、外半径(默认10、12、30像素） ',...
    '左右间距(默认150像素)','目标及掩蔽刺激颜色（默认黑、黑）',...
    '目标和掩蔽刺激呈现时间(默认30、50ms)','SOA(毫秒)',...
    '每种条件重复次数','鼠标有效按键(1=左键,3=右键)',...
    '窗口大小（1全屏,2=1/2等）'};
dlg_title = '参数设置';
num_lines = 1;
defaultanswer=[];
if exist([mainfilename '.ini'],'file')
    fid=fopen([mainfilename '.ini'],'r');
    if fid~=-1
        while true
            line=fgetl(fid);
            if ~ischar(line),break,end
            defaultanswer=[defaultanswer,{line}];
        end
        fclose(fid);
    end
else
    defaultanswer = {'10 12 30','150','0 0 0;0 0 0','30 50',...
        '0   16.67   33.33   50   66.67   83.33  100  116.67  133.33  150','10','1 3','1'};
end
option.WindowStyle='modal';
paras = inputdlg(prompt,dlg_title,num_lines,defaultanswer,option);
end
