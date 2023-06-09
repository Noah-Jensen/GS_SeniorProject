function [v,d1,d2,d3,d4,d5,d6,d7] = qBoardBuild(Q1,Q2,Q3,Q4)
%[v,d1,d2,d3,d4,d5,d6,d7] = qBoardBuild(Q1,Q2,Q3,Q4)
%   
%
%   OUTPUTS
%   v is the vector which contains the coordinates of all 7 blockers
%   d1 through d7 are the coordinates from v split into 7 different pairs.
%   This is done for the sake of making the output files easier.
%
%
%   INPUTS
%   Q1,Q2,Q3,Q4 are all of the quadrants of the 6x6 board and fill in the
%   board in this way:
%
%       Q1 | Q2
%       ---|---
%       Q4 | Q3
%
%
%
%   HOW IT WORKS
%   First B is preallocated as a board of 0s. Then v is preallocated. B is
%   then filled in by Q1 Q2 Q3 and Q4. A locator vector is then made to
%   find the blockers in B. v is then filled in by the entries of the
%   locator vector. Last, d1 through d7 is filled by the rows of v.
%   

B = zeros(6);

v = zeros(7,2);

B((1:3),(1:3)) = Q1;
B((1:3),(4:6)) = Q2;
B((4:6),(4:6)) = Q3;
B((4:6),(1:3)) = Q4;


Loc = find(B) - 1;

for i = 1 : 7

    row = mod(Loc(i),6) + 1;
    col = floor(Loc(i)/6) + 1;

    v(i,:) = [row col];

end

d1 = v(1,:);
d2 = v(2,:);
d3 = v(3,:);
d4 = v(4,:);
d5 = v(5,:);
d6 = v(6,:);
d7 = v(7,:);



end