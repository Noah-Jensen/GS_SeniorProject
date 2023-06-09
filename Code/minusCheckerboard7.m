function M = minusCheckerboard7(N)
%M = minusCheckerboard7(N)
%
%
%   OUTPUTS
%
%   M is a matrix which has had all boards that have all blockers on the
%   same checkerboard color filtered out.
%
% 
%   INPUTS
%
%   N is a matrix, or list of matrices, which will have boards with
%   blockers on all the same checkerboard color filtered out.
%
%
%   HOW IT WORKS
%
%   A placeholder is created which will store boards that don't have all
%   blockers on the same checkerboard color. Then, matlab loops through
%   every board from N and checks if all the blockers are on the same
%   checkerboard color. If they are, the board is thrown out. Once the
%   process is completed, the excess entries in the placeholder are
%   discarded.

LengthN = size(N,3);

counter = 0;

PlaceHolder = zeros(6,6,LengthN);


for i = 1:LengthN

    onAllSame = 0;

    loc = find(transpose(N(:,:,i))) - 1;

    for j = 1:7

        row = floor(loc(j)/6) + 1;
        col = mod(loc(j),6) + 1;

        RC = mod( (row + col) , 2);

        onAllSame = onAllSame + RC;

    end

if (onAllSame==0)

elseif (onAllSame==7)

else

    counter = counter + 1;

    PlaceHolder(:,:,counter) = N(:,:,i);

end



end


M = PlaceHolder(:,:,(1:counter));



end