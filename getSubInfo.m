function subinfo=getSubInfo()
prompt = {'���Ա��','�����Ա�[1=��,2=Ů]','��������','��������[1=������,2=������]'};
dlg_title = '������Ϣ';
num_lines = 1;
defautanswer = {'01','1','20','1'};
subinfo = inputdlg(prompt,dlg_title,num_lines,defautanswer);
end
