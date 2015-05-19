function subinfo=getSubInfo2()
%getSubInfo2.m
%2011-4-2
%fengchengzhi@suda.edu.cn
prompt = {'被试编号','被试性别[1=男,2=女]','被试年龄',...
    '被试优势眼[1=左眼,2=右眼]','练习次数','测试模式',...
    '录像模式(生成单试次影片，需安装Quick Time)'};
dlg_title = '被试信息';
num_lines = 1;
defautanswer = {'1','1','20','1','10','0','0'};
subinfo = inputdlg(prompt,dlg_title,num_lines,defautanswer);
end
