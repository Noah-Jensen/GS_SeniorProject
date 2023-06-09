function fileNum = forToFileNum(aa,bb,cc,dd,ee,ff,gg)
%fileNum = forToFileNum(aa,bb,cc,dd,ee,ff,gg)
%
%
%   OUTPUTS
%
%   fileNum is the number of the solution file from the default genius
%   square dice which the particular input creates
%
%
%   INPUTS
%
%   aa,bb,...,gg are the particular entries for genius square dice, which
%   use the dice stored in specRoll.m, aa comes from D1, bb comes from D2,
%   etc.
%
%
%   HOW IT WORKS
%
%   Matlab uses the order of the dice to correctly find the right solution
%   number.


fileNum = 31104*(aa-1) + 7776*(bb-1) + 1296*(cc-1) + 216*(dd-1) + 36*(ee-1) + 6*(ff-1) + gg;

end