
function seq_shock = genseq_choice()

% this code
% deals with the sequence of one altruism one zili and three shocks
% with 36 trials ¡¾solution 2: 40 trials¡¿
% structure [altruism_num zili_num shock]

% =====deals with lianxu===
% goodFlag = 0;
% while ~goodFlag
%     A1 = Shuffle([1:20 1:20]); %20 altruism items
%     A2 = Shuffle([21:40 21:40]); %20 liji items
%     if any(diff([A1;A2],1,2) == 0)
%         % do nothing
%     else
%         % we are good
%         goodFlag = 1;
%     end
% end
% op_items = [A1' A2'];
%======don't need in this part===

A1 = Shuffle([1:20 1:20]); %20 altruism items
A2 = A1 + 20; % corresponding liji items 
op_items = [ A2' A1'];

goodFlag = 0;
while ~goodFlag
    shock_num = genTrials(1,1,[10 4]);
    shockNum = shock_num(:,3);
    CC = countConsecutiveMode(shockNum);
    if any(CC(:,1)>2) % >2 meaning no consecutive 3 same shocks
        % do nothing
    else
        % we are good
        goodFlag = 1;
    end
end

shockNum = Replace(shockNum, 1:4, [1 3 5 7]);
seq_shock = [op_items shockNum];

end