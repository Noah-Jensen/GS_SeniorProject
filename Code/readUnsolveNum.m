function N = readUnsolveNum(FolderLoc)
%N = readUnsolveNum(FolderLoc)
%   
%
%   OUTPUTS
%
%   N is a vector with all of the numbers that end files in a given folder.
%
%
%   INPUTS
%
%   FolderLoc is the folder location which contains all of the unsolvable
%   board .txt files.
%
%
%   HOW IT WORKS
%
%   Matlab looks at the specified folder, then retrieves the names of all
%   files in that folder. It then converts those names into a character
%   variable type. Then an empty list with the same length as the number of
%   files is created. The numbers at the end of each file is then pulled
%   out and placed in that list. Afterwards, the list is shrunk if there
%   are any empty cells.

D = dir(FolderLoc);

Names = { D.name };

NameV = reshape(Names,[numel(Names) 1]);

NameChar = char(NameV);

NameSize = size(NameChar, 1);

N = zeros(NameSize,1);

for i = 1:NameSize

    N(i) = str2double(NameChar(i,isstrprop(NameChar(i,:),'digit')));

end


N(isnan(N)) = [];

N = sort(N);




end