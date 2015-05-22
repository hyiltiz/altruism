function stat = analysisAVRtoj6AV(dir)

if nargin < 1
    dir = 'AVRtoj6AV/';
end
files = cellstr(ls([dir '*.mat']));


getCenter = statFun('mean', 1); % or choose median
getDispersion = statFun('std', 1); % or choose mad/irq

data = [];
for iSub = 1:numel(files)
    s = load([dir files{iSub}]);
    mC{iSub} = accumarray(s.Trial(:, [6 1 2]), s.Trial(:, 4), [2 2 3], getCenter, NaN);
    sdC{iSub} = accumarray(s.Trial(:, [6 1 2]), s.Trial(:, 4), [2 2 3], getDispersion, NaN);
    [typeAV, typeRegIrreg, avgInterval] = ind2sub(size(mC{iSub}), find(mC{iSub}));
    data = [data; [iSub*ones(size(typeAV)), typeAV, typeRegIrreg, avgInterval, mC{iSub}(:), sdC{iSub}(:)]];
end

keyboard

end