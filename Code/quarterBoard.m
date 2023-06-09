function QBoard = quarterBoard(p1,p2,p3,p4,p5,p6,p7)
%QBoard = quarterBoard(p1,p2,p3,p4,p5,p6,p7)
%   
%
%   OUTPUTS
%   A 3x3 matrix which has 1s where blockers are
%
%
%   INPUTS
%   p1 through p7 are numbers in the set {1,2,3,4,5,6,7,8,9} which
%   correspond to the 9 squares in a quadrant.
%
%
%   HOW IT WORKS
%   There is a hardcoded 9x2 vector, each row contains coordinates for a
%   particular square in the 3x3. InVec is set up to contain p1 through
%   p7. An 3x3 matrix of zeros is made, and then the for each nonzero entry of
%   InVec, a 1 is placed in the matrix.


PlacementVec = [ 1 1 ; 1 2 ; 1 3 ; 2 1 ; 2 2 ; 2 3 ; 3 1 ; 3 2 ; 3 3 ];

InVec = [ p1 ; p2 ; p3 ; p4 ; p5 ; p6 ; p7 ];

QBoard = zeros(3);

for i = 1 : 7

    if (InVec(i) == 0) %If the entry is zero, then don't place a blocker

    else

    QBoard(PlacementVec(InVec(i),1),PlacementVec(InVec(i),2)) = 1; %place a blocker with the Invec(i)th row of PlacementVec

    end

end


end