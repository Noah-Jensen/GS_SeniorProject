function [A, v] = genSqProbGen(fileLocName)
%[A, v] = genSqProbGen(fileLocName)
%
%
%   OUTPUTS
%
%   A is the binary matrix generated which needs to be solved to find a
%   board solution. It will be needed for genSqSolRead. 
%
%   v is the vector which contains the locations of the blockers. These
%   locations are pairs which point to matrix entries as Row x Column,
%   where Row 1 is the topmost row and Column 1 is the Leftmost row.
%
%
%   INPUTS
%
%   fileLocName is a string of the location of the lp file on your computer
%   that you want to write to.
%
%
%   HOW IT WORKS
%
%   This function uses defaultBoardRoll, polyMatGen, ModelMat, and
%   polyomino_lp_write to generate a random board state and create and lp file
%   at the specified location to be given to CPLEX to solve. After the lp has
%   been solved and a solution has been generated, you need to use genSqSolRead to find
%   the explicit solution.


v = defaultBoardRoll; %Generating a random board state within the standard game rules.

[m, d, trl, tri, tei, tes, tet, tez, tel, n] = polyMatGen(v); %Generating all the matrices which contain the possible board states.

[A,b] = ModelMat(v, m, d, trl, tri, tei, tes, tet, tez, tel, n); %Generating the Binary matrix and vector to be fed to the lp file writing function.

polyomino_lp_write(fileLocName, 'Randomly Generated Genius Square Problem', 45, n, A, b) %Generating the lp file at the specified file location.


end