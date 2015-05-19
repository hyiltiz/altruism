function ret=dataMerge(subinfo,results)
%dataMerge.m
if isfield(results,'textureIndex')
    results=rmfield(results,'textureIndex');
end
for i=1:length(results)
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
end
columnheader={'sub','gender','age','dominanteye','trialno','alias','correctKey','response','correct','rt'};
results=orderfields(results,columnheader);
ret=[columnheader;struct2cell(results)'];
xlswrite(['Sub' char(subinfo(1)) '.xls'],ret);
save(['Sub' char(subinfo(1)) '.mat'],'ret');
disp('The raw data of result is listed below');
disp(ret);
end