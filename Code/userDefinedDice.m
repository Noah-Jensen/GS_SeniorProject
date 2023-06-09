function v = userDefinedDice(D1,D2,D3,D4,D5,D6,D7,d1l,d2l,d3l,d4l,d5l,d6l,d7l)
%v = userDefinedDice(D1,D2,D3,D4,D5,D6,D7,d1l,d2l,d3l,d4l,d5l,d6l,d7l)
%   
%
%   OUTPUTS
%
%   v is a vector which contains the locations of 7 blockers.
%
%
%   INPUTS
%
%   D1 through D7 are 7 dice as defined by the user
%
%   d1l through d7l are particular entries on each die, like the first pair
%   of coordinates on the first die for example.
%
%
%   HOW IT WORKS
%
%   The code extracts the relevant entries from each die, then puts them
%   into a 7 by 2 matrix, v.

d1Roll = D1(d1l,:);
d2Roll = D2(d2l,:);
d3Roll = D3(d3l,:);
d4Roll = D4(d4l,:);
d5Roll = D5(d5l,:);
d6Roll = D6(d6l,:);
d7Roll = D7(d7l,:);




v = [d1Roll ; d2Roll ; d3Roll ; d4Roll ; d5Roll ; d6Roll ; d7Roll ];






end