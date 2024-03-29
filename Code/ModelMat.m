function [A,b] = ModelMat(v, MonomSeries, DomSeries, TromLSeries, TromISeries, TetromISeries, TetromSqSeries, TetromTSeries, TetromZSeries, TetromLSeries, PolyNum)
%[A,b] = ModelMat(v, MonomSeries, DomSeries, TromLSeries, TromISeries, TetromISeries, TetromSqSeries, TetromTSeries, TetromZSeries, TetromLSeries, PolyNum)
%
%
%   OUTPUTS
%
%   A is the binary matrix generated which needs to be solved to find a
%   board solution.
%
%   b is the binary vector generated which is used to solve Ax=b once given
%   to a solver.
%
%
%   INPUTS
%
%   v is the vector which contains the locations of the blockers. These
%   locations are pairs which point to matrix entries as Row x Column,
%   where Row 1 is the topmost row and Column 1 is the Leftmost row.
%
%   MonomSeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible monomino positions. It should contain all the valid
%   positions for Monominoes on the board generated by v.
%
%   DomSeries is the matrix that is a size of 6x6xL, where L is the number
%   of possible domino positions. It should contain all the valid positions
%   for dominoes on the board generated by v.
%
%   TromLSeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible L-shape tromino positions. It should contain all the
%   valid positions for L-shape trominoes on the board generated by v.
%
%   TromISeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible I-shape tromino positions. It should contain all the
%   valid positions for I-shape trominoes on the board generated by v.
%
%   TetromISeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible I-shape tetromino positions. It should contain all the
%   valid positions for I-shape tetrominoes on the board generated by v.
%
%   TetromSqSeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible square-shape tetromino positions. It should contain all the
%   valid positions for square-shape tetrominoes on the board generated by v.
%
%   TetromTSeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible T-shape tetromino positions. It should contain all the
%   valid positions for T-shape tetrominoes on the board generated by v.
%
%   TetromZSeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible Z-shape tetromino positions. It should contain all the
%   valid positions for Z-shape tetrominoes on the board generated by v.
%
%   TetromLSeries is the matrix that is a size of 6x6xL, where L is the
%   number of possible L-shape tetromino positions. It should contain all the
%   valid positions for L-shape tetrominoes on the board generated by v.
%
%   PolyNum is the total number of possible polyomino positions,
%   effectively the L length of each series matrix added together.
%
%
%   HOW IT WORKS
%
%   It first preallocates space for 2 matrices, one will be the output (A), the
%   other is a dummy (B) that will be filled. Then the information will be transferred
%   to A.
%
%   Next, a vector is generated that will give the location of the all zero
%   rows in A.
%
%   Following this, the length of each polyomino series is found, then used
%   to generate the last 9 rows of A, these rows indicate which columns
%   come from which series.
%
%   Now, using multiple for loops, the board data from each series is
%   effectively unwound into a long vector in B.
%
%   Once unwound, the data is copied from B to A and b is generated as a
%   vector of ones, with zeros where the rows with all zeros in A are.



A = zeros(45,PolyNum);
B = zeros(36,PolyNum);


%figuring out which rows will be 0 in b
emptRow = zeros(7,1);

for p = 1:7

    emptRow(p) = ((v(p,1) - 1) * 6 ) + v(p,2);
 
end


ML = size(MonomSeries,3);

DL = size(DomSeries,3);

TrLL = size(TromLSeries,3);

TrIL = size(TromISeries,3);

TeIL = size(TetromISeries,3);

TeSL = size(TetromSqSeries,3);

TeTL = size(TetromTSeries,3);

TeZL = size(TetromZSeries,3);

TeLL = size(TetromLSeries,3);


A(37,1:ML) = 1;
A(38,((1:DL)+ML)) = 1;
A(39,((1:TrLL)+ML+DL)) = 1;
A(40,((1:TrIL)+ML+DL+TrLL)) = 1;
A(41,((1:TeIL)+ML+DL+TrLL+TrIL)) = 1;
A(42,((1:TeSL)+ML+DL+TrLL+TrIL+TeIL)) = 1;
A(43,((1:TeTL)+ML+DL+TrLL+TrIL+TeIL+TeSL)) = 1;
A(44,((1:TeZL)+ML+DL+TrLL+TrIL+TeIL+TeSL+TeTL)) = 1;
A(45,((1:TeLL)+ML+DL+TrLL+TrIL+TeIL+TeSL+TeTL+TeZL)) = 1;




%Listing the full board matrix starting from the top left entry, going
%through the row, then doing the next row until finished as a column of
%B/A.

%Monominoes

for k = 1:ML %Cycles the monominoes from the monomino series list


for i = 1:36

    row = floor((i-1)/6) + 1;
    col = mod((i-1),6) + 1;


B(i,k) = MonomSeries(row,col,k);

end


end

%Dominoes

for k = 1:DL

    BCol = k + ML;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = DomSeries(row,col,k);

    end

end


%L Trominoes

for k = 1:TrLL

    BCol = k + ML + DL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TromLSeries(row,col,k);

    end

end

%I Trominoes

for k = 1:TrIL

    BCol = k + ML + DL + TrLL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TromISeries(row,col,k);

    end

end

%I Tetrominoes

for k = 1:TeIL

    BCol = k + ML + DL + TrLL + TrIL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TetromISeries(row,col,k);

    end

end

%Square Tetrominoes

for k = 1:TeSL

    BCol = k + ML + DL + TrLL + TrIL + TeIL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TetromSqSeries(row,col,k);

    end

end

%T Tetrominoes

for k = 1:TeTL

    BCol = k + ML + DL + TrIL + TrLL + TeIL + TeSL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TetromTSeries(row,col,k);

    end

end

%Z Tetrominoes

for k = 1:TeZL

    BCol = k + ML + DL + TrLL + TrIL + TeIL + TeSL + TeTL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TetromZSeries(row,col,k);

    end

end

%L Tetrominoes

for k = 1:TeLL

    BCol = k + ML + DL + TrIL + TrLL + TeIL + TeSL + TeZL + TeTL;

    for i = 1:36
    
        row = floor((i-1)/6) + 1;
        col = mod((i-1),6) + 1;
    
        B(i,BCol) = TetromLSeries(row,col,k);

    end

end

%Transfer from B to A.

r = 1:36;

A(r,:) = B(r,:);


b = ones(45,1);
b(emptRow) = 0;





end