function seq = genSequence()

nTrialWithinBlock = 4;

goodFlag = 0;
while ~goodFlag
    A1 = reshape(Shuffle(repmat([ 1:20], [1 4])'), [], 2); %18 altruism items
    A2 = reshape(Shuffle(repmat([21:40], [1 4])'), [], 2); %18 liji items

    %ziti items = 18 + 18
    A3 = [reshape(Shuffle(repmat([ 1:20],[1 2])'), [], 2); reshape(Shuffle(repmat([21:40], [1 2])'), [], 2)];

    A3 = cell2mat(Shuffle(enCell(A3, nTrialWithinBlock)));

    if any(diff([A1;A2;A3],1,2) == 0)
        % do nothing
    else
        % we are good
        goodFlag = 1;
    end
end


A1 = [A1 1*ones(size(A1,1),1)];
A2 = [A2 2*ones(size(A2,1),1)];
A3 = [A3 3*ones(size(A3,1),1)];

A1cell = enCell(A1, nTrialWithinBlock);
A2cell = enCell(A2, nTrialWithinBlock);
A3cell = enCell(A3, nTrialWithinBlock);
A = cell2mat(Shuffle([A1cell; A2cell; A3cell]));

% % maybe simply first choosing 1 2 3 and then append a latin square
% sequence will be more efficient than searching through all possible
% experiment desing sequenses
% goodFlag = 0;
% i = 0;
% T = [];
% while ~goodFlag
%     B1 = Shuffle(repmat([1 4 6], [1 12])');
%     B2 = Shuffle(repmat([1 4 6], [1 12])');
%     B3 = Shuffle(repmat([1 4 6], [1 12])');
%     B = reshape([B1; B2; B3], 4,[]);
%     C = mat2cell(B, 4, ones(size(B,2),1));
%
%     if i>1e3
%         keyboard
%     end
%
%     if sum(cellfun(@(x) countMode(x), C) > 2)
%         % do nothing
%         i = i+1;
%         T(i) = sum(cellfun(@(x) countMode(x), C) > 2);
%         warning(num2str([i sum(cellfun(@(x) countMode(x), C) > 2) cellfun(@(x) countMode(x), C)] ));
%     else
%         % we are good
%         goodFlag = 1;
%     end
% end

% great control over the sequence
% -------------------------------solution 1: 1 4 6-------------------------
% B for shock : 1 4 6
% B1 = Replace(Shuffle([repmat([1:3]', 1, 9); [1 2 3 2 3 1 3 1 2]]), 1:3, [1 4 6]);
% B2 = Replace(Shuffle([repmat([1:3]', 1, 9); [1 2 3 2 3 1 3 1 2]]), 1:3, [1 4 6]);
% B3 = Replace(Shuffle([repmat([1:3]', 1, 9); [1 2 3 2 3 1 3 1 2]]), 1:3, [1 4 6]);
% -------------------------------solution 1: 1 4 6-------------------------

% -------------------------------solution 2: 1 3 5 7-----------------------
% solution 2: shock ¡¾1 3 5 7¡¿
B1 = Replace(Shuffle(repmat([1:4]', 1,10)), 1:4, [1 3 5 7]);
B2 = Replace(Shuffle(repmat([1:4]', 1,10)), 1:4, [1 3 5 7]);
B3 = Replace(Shuffle(repmat([1:4]', 1,10)), 1:4, [1 3 5 7]);

AB = [A nan(size(A,1),1)];
AB(AB(:,3)==1,end) = B1(:);
AB(AB(:,3)==2,end) = B2(:);
AB(AB(:,3)==3,end) = B3(:);

seqBlock = repmat(1:size(AB,1)/nTrialWithinBlock, [nTrialWithinBlock 1]);
AB(:,5) = seqBlock(:);

seq = AB(:, [5 3 1 2 4]);
end

function outCell =  enCell(x, num)
outCell = mat2cell(x, num*ones(size(x,1)/num, 1), size(x, 2));
end

function b = countMode(x)
[a, b] = mode(x);
end
