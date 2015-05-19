function ret=dataMerge5(subinfo,results)
%dataMerge5.m
%2011-4-8
%fengchengzhi@suda.edu.cn
if isfield(results,'fixptr') 
    results=rmfield(results,'fixptr');
end
if isfield(results,'y') 
    results=rmfield(results,'y');
end
if isfield(results,'targetcolor') 
    results=rmfield(results,'targetcolor');
end
if isfield(results,'maskcolor') 
    results=rmfield(results,'maskcolor');
end

for i=1:length(results)
    if isempty(results(i,1).response)
        results=results(1:i-1,:);
        break;
    end
    results(i,1).sub=str2double(char(subinfo(1)));
    results(i,1).trialno=i;
    if str2double(char(subinfo(2)))==1
        results(i,1).gender='male';
    else
        results(i,1).gender='female';
    end
    results(i,1).age=str2double(char(subinfo(3)));
    
    if str2double(char(subinfo(4)))==1
        results(i,1).dominanteye='left';
    else
        results(i,1).dominanteye='right';
    end
%    results(i,1).correct=results(i,1).correct;
%    results(i,1).response=results(i,1).response;
%    results(i,1).rt=results(i,1).rt;
end
if length(results)<1
    ret=results;
end
save(['Sub' char(subinfo(1)) '.mat'],'results');
if isfield(results,'response')
    columnheader={'sub','gender','age','dominanteye','trialno','F1','F2',...
        'correctKey','response','correct','rt1','rt2','value','targetradius',...
        'maskoutradius','maskinnerradius','leftx','rightx','targettime','masktime'};
    results=orderfields(results,columnheader);
    ret=[columnheader;struct2cell(results)'];
    xlswrite(['Sub' char(subinfo(1)) '.xls'],ret);
    save(['Sub' char(subinfo(1)) '.mat'],'ret','results');
    disp('The raw data of result is listed below');
    disp(ret);
else
    ret=-1;
end
end