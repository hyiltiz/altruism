function jitter = myRand(low, high)
% produce the jitter time [1 - 3]
% 150422 by whx
jitter = low + rand() * (high - low);
end
