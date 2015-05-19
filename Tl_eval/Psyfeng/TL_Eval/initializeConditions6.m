function [wptr,conditions]=initializeConditions6(subid)
%initializeConditions6.m
%2011-4-3
%fengchengzhi@suda.edu.cn
global mainfilename;
paras=getParameters2;
if isempty(paras)
    wptr=NaN;
    conditions=NaN;
    return;
end
radiuses=sscanf(paras{1},'%d ');
distance=str2double(paras{2});
colors=sscanf(paras{3},'%d %d %d;%d %d %d');
targetmaskcolor=NaN*ones(2,3);
for j=1:2
    cc=NaN*ones(1,3);
    for i=1:3
        cc(i)=colors(i+(j-1)*3);
    end
    targetmaskcolor(j,:)=cc;
end
presenttimes=sscanf(paras{4},'%d ');
soas=sscanf(paras{5},'%d ');
replication=str2double(paras{6});
validbuttons=sscanf(paras{7},'%d ');
wsize=str2double(paras{8});
fid=fopen([mainfilename '.ini'],'w');
if fid~=-1
    for i=1:length(paras)
        fprintf(fid,'%s\r\n',paras{i});
    end

    fclose(fid);
end
if wsize==0
    wsize=1;
end
scr=max(Screen('Screens'));
[sw,sh]=Screen('WindowSize',scr);
wptr=Screen('OpenWindow',scr,[169 169 169],CenterRect([0 0 sw/wsize sh/wsize],[0 0 sw sh]));

fix=fixation(wptr,'+',[0 0 0],[169 169 169]);
conditions=struct([]);
treatments=CombineFactors1([1 2],soas);
wrect=Screen('Rect',wptr);
for i=1:size(treatments,1)
    conditions(i,1).F1=treatments(i,1);
    conditions(i,1).F2=treatments(i,2);
    conditions(i,1).targetcolor=targetmaskcolor(1,:);
    conditions(i,1).maskcolor=targetmaskcolor(2,:);
    conditions(i,1).targetradius=radiuses(1);
    conditions(i,1).maskoutradius=radiuses(3);
    conditions(i,1).maskinnerradius=radiuses(2);
    conditions(i,1).leftx=wrect(3)/2-distance;
    conditions(i,1).rightx=wrect(3)/2+distance;
    conditions(i,1).y=wrect(4)/2;
    conditions(i,1).targettime=presenttimes(1)/1000;
    conditions(i,1).masktime=presenttimes(2)/1000;
    conditions(i,1).fixptr=fix;
    switch treatments(i,1)
        case 1 %left target
            if mod(subid,2) %ÆæÊý±»ÊÔ
                conditions(i,1).correctKey=validbuttons(1);
            else
                conditions(i,1).correctKey=validbuttons(2);
            end
        case 2 %right target
            if mod(subid,2)
                conditions(i,1).correctKey=validbuttons(2);
            else
                conditions(i,1).correctKey=validbuttons(1);
            end
    end
    LoadingIndicator(wptr,i/size(treatments,1)*100,'Initializing Completed.');
    Screen('Flip',wptr);
end 
conditions=Shuffle(repmat(conditions,replication,1));
return
