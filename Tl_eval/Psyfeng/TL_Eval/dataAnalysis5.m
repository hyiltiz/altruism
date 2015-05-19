function [average, correctRate]=dataAnalysis5(results)
%dataAnalysis5.m
%2011-7-7
%fengchengzhi@suda.edu.cn
if length(results)<2
    average=NaN;
    correctRate=NaN;
    return;
end
data=NaN*ones(size(results,1)-1,4);
for i=2:size(results,1) %
    if isempty(results{i,9})
        data=data(1:i-2,:);
        break;
    end
    data(i-1,1)=results{i,6};%F1 Present
    data(i-1,2)=results{i,7};%F2 SOA
    data(i-1,3)=results{i,10};%Correct
    data(i-1,4)=results{i,11};%RT1
    data(i-1,5)=results{i,12};%RT2
    data(i-1,6)=results{i,13};%value
end
soa=unique(data(:,2));
cR=zeros*ones(length(soa),1);
aR1=zeros*ones(length(soa),1);
aR2=zeros*ones(length(soa),1);
visibility=zeros*ones(length(soa),1);

for i=1:length(soa)
    cR(i)=mean(data(data(:,2)==soa(i),3));
    aR1(i)=mean(data(data(:,2)==soa(i) & data(:,3)==1,4));
    aR2(i)=mean(data(data(:,2)==soa(i) & data(:,3)==1,5));
    visibility(i)=mean(data(data(:,2)==soa(i) & data(:,3)==1,6));
end
figure1=figure;
subplot1=subplot(2,2,1,'Parent',figure1);
plot(soa,aR1,'r.-','Parent',subplot1,'LineWidth',2);
xlabel('SOA (ms)');
ylabel('Reaction Time (s)');
title('Effect of SOA on Metacontrast (RT1)');
set(gca,'XTick',soa);
subplot2=subplot(2,2,2,'Parent',figure1);
plot(soa,cR,'go:','Parent',subplot2,'LineWidth',2);
xlabel('SOA (ms)');
ylabel('Proportion of Correct');
title('Effect of SOA on Metacontrast (Correct)');
set(gca,'XTick',soa);
ylim([0.1,1.0]);
subplot3=subplot(2,2,3,'Parent',figure1);
plot(soa,aR2,'bx-.','Parent',subplot3,'LineWidth',2);
xlabel('SOA (ms)');
ylabel('Reaction Time (s)');
set(gca,'XTick',soa);
title('Effect of SOA on Metacontrast (RT2)');

subplot4=subplot(2,2,4,'Parent',figure1);
plot(soa,visibility,'m+--','Parent',subplot4,'LineWidth',2);
xlabel('SOA (ms)');
ylabel('visibility');
set(gca,'XTick',soa);
title('Effect of SOA on Metacontrast (Visibility)');

disp(aR1);
correctRate=mean(cR);
average=mean(aR1(~isnan(aR1)));
return;

