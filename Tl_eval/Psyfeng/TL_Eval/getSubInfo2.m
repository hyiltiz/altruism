function subinfo=getSubInfo2()
%getSubInfo2.m
%2011-4-2
%fengchengzhi@suda.edu.cn
prompt = {'���Ա��','�����Ա�[1=��,2=Ů]','��������',...
    '����������[1=����,2=����]','��ϰ����','����ģʽ',...
    '¼��ģʽ(���ɵ��Դ�ӰƬ���谲װQuick Time)'};
dlg_title = '������Ϣ';
num_lines = 1;
defautanswer = {'1','1','20','1','10','0','0'};
subinfo = inputdlg(prompt,dlg_title,num_lines,defautanswer);
end
