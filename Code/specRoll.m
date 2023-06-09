function v = specRoll(d1,d2,d3,d4,d5,d6,d7)
%v = specRoll(d1,d2,d3,d4,d5,d6,d7)
%   
%
%   OUTPUT
%
%   v is the vector which contains the locations of the blockers. These
%   locations are pairs which point to matrix entries as Row x Column,
%   where Row 1 is the topmost row and Column 1 is the Leftmost row.
%
%
%   INPUTS
%
%   d1 is the row from the first die (D1) Possible entries 1,2
%
%   d2 is the row from the first die (D2) Possible entries 1,2,3,4
%
%   d3 is the row from the first die (D3) Possible entries 1,2,3,4,5,6
%
%   d4 is the row from the first die (D4) Possible entries 1,2,3,4,5,6
%
%   d5 is the row from the first die (D5) Possible entries 1,2,3,4,5,6
%
%   d6 is the row from the first die (D6) Possible entries 1,2,3,4,5,6
%
%   d7 is the row from the first die (D7) Possible entries 1,2,3,4,5,6
%
%
%   HOW IT WORKS
%
%   The 7 inputs are used as the rows from each Die matrix (D1-D7) to pull
%   the correct coordinates for each blocker. They are then placed into a
%   7x2 matrix (v).


%1st die

    D1 = [ 1 6 ; 6 1 ];

%2nd die

    D2 = [ 1 5 ; 2 6 ; 5 1 ; 6 2 ];

%3rd die

    D3 = [ 1 1 ; 3 1 ; 4 1 ; 4 2 ; 5 2 ; 6 3 ];

%4th die

    D4 = [ 1 2 ; 1 3 ; 2 1 ; 2 2 ; 2 3 ; 3 2 ];

%5th die

    D5 = [ 2 4 ; 3 3 ; 3 4 ; 4 3 ; 4 4 ; 5 3 ];

%6th die

    D6 = [ 4 5 ; 5 4 ; 5 5 ; 5 6 ; 6 4 ; 6 5 ];

%7th die

    D7 = [ 1 4 ; 2 5 ; 3 5 ; 3 6 ; 4 6 ; 6 6 ];


%Picking out the pairs from each die

v = [D1(d1,:);D2(d2,:);D3(d3,:);D4(d4,:);D5(d5,:);D6(d6,:);D7(d7,:)];




end