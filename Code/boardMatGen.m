function [BoardState] = boardMatGen(v)
%[BoardState] = boardMatGen(v)
%   
%
%   OUTPUT
%
%   BoardState is a 6x6 matrix of all ones. Except for where the 7 blockers
%   have been rolled, where there are zeros.
%
%
%   INPUT
%
%   v is the vector which contains the locations of the blockers. These
%   locations are pairs which point to matrix entries as Row x Column,
%   where Row 1 is the topmost row and Column 1 is the Leftmost row.
%
%
%   HOW IT WORKS
%
%   A 6x6 matrix of all ones is generated, then at each location where
%   there is a blocker, a zero is placed.


BoardState = ones(6,6);

for i = 1:7

    BoardState(v(i,1),v(i,2)) = 0;
    
end

end