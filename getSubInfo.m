function subinfo=getSubInfo()
prompt = {'被试编号','被试性别[1=男,2=女]','被试年龄','被试利手[1=右利手,2=左利手]'};
dlg_title = '被试信息';
num_lines = 1;
defautanswer = {'01','1','20','1'};
subinfo = inputdlg(prompt,dlg_title,num_lines,defautanswer);
end
