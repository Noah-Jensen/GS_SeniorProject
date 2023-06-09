function [forNum] = fileNumToFor(FileNum)
%[forNum] = fileNumToFor(FileNum)
%
%
%   OUTPUTS
%
%   forNum is a vector with 7 entries that contains the particular entries
%   from each die in specRoll.m that generate the FileNum th  solution.
%
%
%   INPUTS
%
%   FileNum is the number of the solution which we want to find the dice
%   that produce it.
%
%   
%   HOW IT WORKS
%
%   Using the properties of how the dice are ordered in specRoll.m, matlab
%   narrows down the possible entries from each die until it has found the
%   particular ones used to generate the FileNum solution.


First = floor(FileNum/31104);

aa = First;

Temp = FileNum - (aa*31104);

Second = floor(Temp/7776);

bb = Second;

Temp = Temp - (bb*7776);

Third = floor(Temp/1296);

cc = Third;

Temp = Temp - (cc*1296);

Fourth = floor(Temp/216);

dd = Fourth;

Temp = Temp - (dd*216);

Fifth = floor(Temp/36);

ee = Fifth;

Temp = Temp - (ee*36);

Sixth = floor(Temp/6);

ff = Sixth;

gg = Temp - (ff*6);

forNum = [aa + 1 ; bb + 1 ; cc + 1 ; dd + 1 ; ee + 1 ; ff + 1 ; gg];



end