function [R]=CombineFactors(factors)
%CombineFactors.m
%2011-3-29
%fengchengzhi@suda.edu.cn
tmpNum=1;
%factors=[3 2 3];
for i=1:length(factors)
    tmpNum=tmpNum*factors(i);
end
R=zeros(tmpNum,length(factors));
for i=1:size(R,1)
    tmp=tmpNum;
    for j=1:length(factors)
        if j~=1
            tmp=tmp/factors(j-1);
        end
        R(i,j)=ceil((mod(i-1,tmp)+1)/(tmp/factors(j)));
    end
end
return