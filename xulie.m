
clear all; clc;
seq = genTrials(1, 4, [9, 3]);
la_ding_fang = [1 4 6 4 6 1 6 1 4 4 6 1 6 1 4 1 4 6 6 1 4 1 4 6 4 6 1]';

%seq(:,2) = randperm(108)';
%seq(:,2) = mod(seq(:,2),3);
%seq(:, 1) = mod(seq(:, 1), 3);