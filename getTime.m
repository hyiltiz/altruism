function MyTime = getTime(type)

isDebug = 0; % shortens time

switch type
    case {'DummyScan'}
        % dummy MyTime , also for cover story
        MyTime = 10;
    case {'Instruction'}
        % instruction for each conditions
        MyTime = 4;
    case {'CrossBeforeEvents'}
        % time between instructions and events
        MyTime = 1;
    case {'TrialDuration'}
        % Trials: altruism, zili,ziti all lasts for 4s.
        MyTime = 4;
    case {'CrossBetweenEvents'}
        % time between two events(altruism, liji, ziti, altruism and liji)
        MyTime = myRand(1,3);
    case {'CrossLinkEventsShock'}
        % time between 4 events and 4 shocks
        MyTime = 6;
    case {'ShockDuration'}
        % time for shock
        MyTime = 3;
      case {'PainRatingWait'}
        MyTime = 5;
    case {'CrossBetweenShockAndRating'}
        % time between shock and painRating
        MyTime = myRand(1,3);
    case {'CrossBetweenShockTrials'}
        % time between two shock trials
        MyTime = myRand(4,7);
    case {'CrossBetweenBlocks'}
        % time between two blocks
        MyTime = myRand(4,7);
    case {'CrossBeforePredictedAl'}
        % time between the main part and the predicted altruism part
        MyTime = 6;
      case {'goodbye'}
        MyTime = 6;
end

if isDebug
MyTime = 0.1* MyTime;
end

end
