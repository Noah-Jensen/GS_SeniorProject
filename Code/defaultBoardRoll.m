function [DiceRoll] = defaultBoardRoll()
%[DiceRoll] = DefaultBoard()
%   
%
%   OUTPUT
%
%   DiceRoll is the 7x2 vector containing the locations of the 7
%   quasi-randomly rolled blockers.
%
%   
%   HOW IT WORKS
%
%   A 7x2 matrix is preallocated, then with hardcoded dice, 7 blocker
%   positions are rolled. These are subsequently placed in the DiceRoll
%   matrix.



DiceRoll = zeros(7,2);

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


    %Now to generate the dice roll by taking a random pair from each die.

 DiceRoll(1,:) = D1(randi(2),:);
 DiceRoll(2,:) = D2(randi(4),:);
 DiceRoll(3,:) = D3(randi(6),:);
 DiceRoll(4,:) = D4(randi(6),:);
 DiceRoll(5,:) = D5(randi(6),:);
 DiceRoll(6,:) = D6(randi(6),:);
 DiceRoll(7,:) = D7(randi(6),:);



end