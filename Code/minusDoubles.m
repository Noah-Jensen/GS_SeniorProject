function M = minusDoubles(N)
%M = minusDoubles(N)
%
%
%   OUTPUTS
%
%   M is the matrix, or list of matrices, which has had all boards filtered
%   out that either have 2 isolated monominoes or 2 isolated dominoes.
%
%   
%   INPUTS
%
%   N is the matrix, or list of matrices, which will have isolated dominoes
%   and monominoes filtered out.
%
%
%   HOW IT WORKS
%
%   Matlab sets a placeholder list which will hold all matrices that don't
%   have isolated dominoes and monominoes. Then each board is checked for
%   double monominoes by inlaying the board in a larger matrix so that it
%   has a border of all 1s. Then every square on the board is checked to
%   see if it is surrounded by blockers. If it is, the board is tossed out.
%   Afterwards, the same thing is checked for dominoes, both vertical and
%   horizontal. Once this process has been completed, the excess entries in
%   the placeholder are thrown out and the output is created.

LengthN = size(N,3);

counter = 0;

PlaceHolder = zeros(6,6,LengthN);

Temp = ones(8,8);

for i = 1:LengthN

    failM = 0;
    failD = 0;

    Temp(2:7,2:7) = N(:,:,i);

    loc = find(transpose((1 - N(:,:,i)))) - 1;


    for j = 1 : 29

        row = floor(loc(j)/6) + 2;
        col = mod(loc(j),6) + 2;

        Up = Temp(row - 1, col);
        Down = Temp(row + 1, col);
        Left = Temp(row, col - 1);
        Right = Temp(row, col + 1);

        tot = Up + Down + Left + Right;
    
        if (tot==4)

            failM = failM + 1;

        end

    end

    for j = 0 : 29

        Up = 0;
        Down = 0;
        LeftU = 0;
        RightU = 0;
        LeftD = 0;
        RightD = 0;

        row = floor(j/6) + 2;
        col = mod(j,6) + 2;

        Pl1 = Temp(row, col) + Temp(row + 1, col);
        
        if (Pl1 == 0)

            Up = Temp(row - 1, col);
            Down = Temp(row + 2, col);
            LeftU = Temp(row, col - 1);
            RightU = Temp(row, col + 1);
            LeftD = Temp(row + 1, col - 1);
            RightD = Temp(row + 1, col + 1);

        end



        

        tot = Up + Down + LeftU + RightU + LeftD + RightD;
    
        if (tot==6)

            failD = failD + 1;

        end


        %Horizontal
        UpL = 0;
        UpR = 0;
        Left = 0;
        Right = 0;
        DownL = 0;
        DownR = 0;

        row = floor(j/5) + 2;
        col = mod(j,5) + 2;

        Pl2 = Temp(row, col) + Temp(row, col + 1);

        if (Pl2 == 0)

            UpL = Temp(row - 1, col);
            UpR = Temp(row - 1, col + 1);
            Left = Temp(row, col - 1);
            Right = Temp(row, col + 2);
            DownL = Temp(row + 1, col);
            DownR = Temp(row + 1, col + 1);

        end


        tot = UpL + UpR + Left + Right + DownL + DownR;

        if (tot==6)

        failD = failD + 1;

        end



    end

    if ((failM <= 1) && (failD <= 1))

        counter = counter + 1;

        PlaceHolder(:,:,counter) = N(:,:,i);

    end



end

%doubles for dominoes, need to check vertical and horizontal

% for i = 1:LengthN
% 
%     fail = 0;
% 
%     Temp(2:7,2:7) = N(:,:,i);
% 
%     %Vertical: run through the points of the 5x6 grid checking if the point
%     %and the one below are both zero, then check if the dom pattern is
%     %there
%     
% 
%     if (fail<=1)
% 
%         counter = counter + 1;
% 
%         PlaceHolder(:,:,counter) = N(:,:,i);
% 
%     end
% 
% 
% 
% end





M = PlaceHolder(:,:,(1:counter));







end