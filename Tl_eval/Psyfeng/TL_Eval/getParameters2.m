function paras=getParameters2()
%getParameters2.m
%2011-4-7
%fengchengzhi@suda.edu.cn
global mainfilename;
prompt = {'Ŀ�꼰�ڱδ̼��ڡ���뾶(Ĭ��10��12��30���أ� ',...
    '���Ҽ��(Ĭ��150����)','Ŀ�꼰�ڱδ̼���ɫ��Ĭ�Ϻڡ��ڣ�',...
    'Ŀ����ڱδ̼�����ʱ��(Ĭ��30��50ms)','SOA(����)',...
    'ÿ�������ظ�����','�����Ч����(1=���,3=�Ҽ�)',...
    '���ڴ�С��1ȫ��,2=1/2�ȣ�'};
dlg_title = '��������';
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
