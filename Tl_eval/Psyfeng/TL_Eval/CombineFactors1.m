function [R]=CombineFactors1(varargin)
%CombineFactors1.m
%2011-4-7
%fengchengzhi@suda.edu.cn
tmpNum=1;
for i=1:length(varargin)
    tmpNum=tmpNum*length(varargin{i});
end
R=zeros(tmpNum,length(varargin));
for i=1:size(R,1)
    tmp=tmpNum;
    for j=1:length(varargin)
        if j~=1
            tmp=tmp/length(varargin{j-1});
        end
        for k=1:length(varargin{j})
            R(i,j)=varargin{j}(ceil((mod(i-1,tmp)+1)/(tmp/length(varargin{j}))));
        end
    end
end
return