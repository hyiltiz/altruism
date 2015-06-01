
function seq_shock = genseq_choice()

% this code
% deals with the sequence of one altruism one zili and three shocks
% with 36 trials
% structure [altruism_num zili_num shock]

goodFlag = 0;
while ~goodFlag
    A1 = Shuffle([1:18 1:18]); %18 altruism items
    A2 = Shuffle([19:36 19:36]); %18 liji items  
    if any(diff([A1;A2],1,2) == 0)
        % do nothing
    else
        % we are good
        goodFlag = 1;
    end
end
op_items = [A1' A2'];
shock_num = genTrials(1,1,[12 3]);
shockNum = shock_num(:,3);

seq_shock = [op_items shockNum];

end