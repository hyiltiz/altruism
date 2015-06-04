function time = getTime(type)
switch type
    case {'TrialDuration'}
        % Trial ISI
        time = 4;
    case {'DummyScan'}
        % dummy time
        time = 10;
        case {'Instruction'}
        time = 4;
        case {'CrossBeforeAltruism'}
        time = 1;
        case {'CrossBeforeShocks'}
        time = myRand(1,3);
        case {'CrossAfterEachShock'}
        time = myRand(4,8);
        case {'CrossAfterShocks'}
        time = myRand(4,8);

end
end
