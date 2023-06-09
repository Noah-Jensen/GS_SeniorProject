function v = readUnsolveBlockers(FolderLoc,FileNum,D1,D2,D3,D4,D5,D6,D7)
%v = readUnsolveBlockers(FolderLoc,FileNum,D1,D2,D3,D4,D5,D6,D7)
%
%
%   OUTPUTS
%
%   v is the 7x2 matrix which contains the 7 pairs of coordinates of
%   blockers on the board.
%
%   
%   INPUTS
%
%   FolderLoc is the folder which contains the unsolvable .txt files we are
%   trying to read.
%
%   FileNum is the number at the end of a particular .txt file as each one
%   is of the form 'Dice Pattern #####'.
%
%   D1 through D7 are the dice retrieved from the FileNum dice pattern .txt
%   file.
%
%
%   HOW IT WORKS
%
%   Matlab reads the particular file, then finds 'ly:' in the file, which
%   is followed by the entries on the dice which produce the unsolvable
%   board. Then it saves all the text after 'ly:', saves only the numbers,
%   and then uses those numbers to retrieve the appropriate pairs from D1
%   through D7
    

k = append(FolderLoc,'\Dice Pattern ', string(FileNum), '.txt');

TxtFile = fopen(k,'r');
format = '%s';
Read = fscanf(TxtFile,format);

StrLoc = strfind(Read,'ly:');

Indices = Read(StrLoc:end);

Indices = Indices(isstrprop(Indices,'digit'));

vInd = zeros(7,1);

for i = 1:7

    vInd(i) = str2double(Indices(i));

end

v = zeros(7,2);

v(1,:) = D1(vInd(1),:);
v(2,:) = D2(vInd(2),:);
v(3,:) = D3(vInd(3),:);
v(4,:) = D4(vInd(4),:);
v(5,:) = D5(vInd(5),:);
v(6,:) = D6(vInd(6),:);
v(7,:) = D7(vInd(7),:);

fclose('all');



end