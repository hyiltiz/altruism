function y = Randrows(x)
% generalized Shuffle, as in sortrows
% note that the Shuffle function provided by Psychtoolbox Shuffles a matrix
% column by column, which, in most cases, is not desired.

% Author: Hormetjan Yiltiz, hyiltiz@gmail.com
% Copyright, 2015
% Released under GPLv3 or later.

if isscalar(x)
  y = randperm(x);
elseif isvector(x)
  y = x(randperm(numel(x)));
elseif ismatrix(x)
  warning('Randperm:ColumnWise','Shuffling column-wise keeping rows as groups.');
  randIndex = randperm(size(x, 1));
  y = x(randIndex, :);
end
