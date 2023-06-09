function M = UnsolvableBoards(FolderLoc)
%M = UnsolvableBoards(FolderLoc)
%   
%
%   OUTPUTS
%
%   M is a matrix which contains a matrix representation of a board with
%   only blockers on it. This matrix is an unsolvable matrix.
%
%
%   INPUTS
%
%   FolderLoc is a string of the folder where all of the .txt files are
%   that contain information of the unsolvable boards.
%
%
%   HOW IT WORKS
%
%   First, we retrieve all of the numbers at the end of each unsolvable
%   board file. These are in order in the vector N. Then we create a list
%   of empty 6x6 matrices with length(N) entries. Then we use
%   readUnsolveDice to retrieve the dice for a particular unsolvable board.
%   This is followed by finding the blockers on that board and placing them
%   in a 6x6 matrix of zeros. This matrix is saved into the list of 6x6
%   matrices that is length(N).



N = readUnsolveNum(FolderLoc);

NL = length(N);

M = zeros(6,6,NL);

v = zeros(7,2);

B = zeros(6,6);

for i = 1:NL
    
    [D1, D2, D3, D4, D5, D6, D7] = readUnsolveDice(FolderLoc,N(i));

    v = readUnsolveBlockers(FolderLoc,N(i),D1,D2,D3,D4,D5,D6,D7);

    B = 1 - boardMatGen(v);

    M(:,:,i) = B;


end





end