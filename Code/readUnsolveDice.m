function [D1,D2,D3,D4,D5,D6,D7] = readUnsolveDice(FolderLoc, FileNum)
%[D1,D2,D3,D4,D5,D6,D7] = readUnsolveDice(FolderLoc, FileNum)
%
%
%   OUTPUTS
%
%   D1 through D7 are vectors which contain the coordinates to which a
%   particular die can roll a blocker placement.
%
%
%   INPUTS
%
%   FolderLoc is the folder where all the unsolvable .txt files are
%   located.
%
%   FileNum is the number on the .txt file, as each .txt file has a title
%   that looks like "Dice Pattern #####".
%
%
%   HOW IT WORKS
%
%   Matlab opens the specified .txt file, then reads its content. Next, it
%   locates '[[' and ']]' in the file, which tells us where our
%   dice are located, and it saves their location in StEn. Then it takes
%   the pairs between each '[[' and ']]' and stores those in D1 through D7
%   as those pairs are the dice patterns.

k = append(FolderLoc,'\Dice Pattern ', string(FileNum), '.txt');

TxtFile = fopen(k,'r');
format = '%s';
Read = fscanf(TxtFile,format);


Start = strfind(Read,'[[') + 1;
End = strfind(Read,']]');

StEn = [ Start ; End ];

%Reading Die One

D1PH = Read((StEn(1,1):StEn(2,1)));

D1PH = D1PH(isstrprop(D1PH,'digit'));

D1Size = length(D1PH);

D1PH = D1PH( 1 : 2 : (D1Size - 1) );

D1Size = length(D1PH)/2;

D1 = zeros(D1Size,2);

for i = 1:D1Size

    D1(i,1) = str2double(D1PH((2*i-1)));
    D1(i,2) = str2double(D1PH(2*i));

end


%Reading Die Two

D2PH = Read((StEn(1,2):StEn(2,2)));

D2PH = D2PH(isstrprop(D2PH,'digit'));

D2Size = length(D2PH);

D2PH = D2PH( 1 : 2 : (D2Size - 1) );

D2Size = length(D2PH)/2;

D2 = zeros(D2Size,2);

for i = 1:D2Size

    D2(i,1) = str2double(D2PH((2*i-1)));
    D2(i,2) = str2double(D2PH(2*i));

end

%Reading Die Three

D3PH = Read((StEn(1,3):StEn(2,3)));

D3PH = D3PH(isstrprop(D3PH,'digit'));

D3Size = length(D3PH);

D3PH = D3PH( 1 : 2 : (D3Size - 1) );

D3Size = length(D3PH)/2;

D3 = zeros(D3Size,2);

for i = 1:D3Size

    D3(i,1) = str2double(D3PH((2*i-1)));
    D3(i,2) = str2double(D3PH(2*i));

end

%Reading Die Four

D4PH = Read((StEn(1,4):StEn(2,4)));

D4PH = D4PH(isstrprop(D4PH,'digit'));

D4Size = length(D4PH);

D4PH = D4PH( 1 : 2 : (D4Size - 1) );

D4Size = length(D4PH)/2;

D4 = zeros(D4Size,2);

for i = 1:D4Size

    D4(i,1) = str2double(D4PH((2*i-1)));
    D4(i,2) = str2double(D4PH(2*i));

end

%Reading Die Five

D5PH = Read((StEn(1,5):StEn(2,5)));

D5PH = D5PH(isstrprop(D5PH,'digit'));

D5Size = length(D5PH);

D5PH = D5PH( 1 : 2 : (D5Size - 1) );

D5Size = length(D5PH)/2;

D5 = zeros(D5Size,2);

for i = 1:D5Size

    D5(i,1) = str2double(D5PH((2*i-1)));
    D5(i,2) = str2double(D5PH(2*i));

end

%Reading Die Six

D6PH = Read((StEn(1,6):StEn(2,6)));

D6PH = D6PH(isstrprop(D6PH,'digit'));

D6Size = length(D6PH);

D6PH = D6PH( 1 : 2 : (D6Size - 1) );

D6Size = length(D6PH)/2;

D6 = zeros(D6Size,2);

for i = 1:D6Size

    D6(i,1) = str2double(D6PH((2*i-1)));
    D6(i,2) = str2double(D6PH(2*i));

end

%Reading Die Seven

D7PH = Read((StEn(1,7):StEn(2,7)));

D7PH = D7PH(isstrprop(D7PH,'digit'));

D7Size = length(D7PH);

D7PH = D7PH( 1 : 2 : (D7Size - 1) );

D7Size = length(D7PH)/2;

D7 = zeros(D7Size,2);

for i = 1:D7Size

    D7(i,1) = str2double(D7PH((2*i-1)));
    D7(i,2) = str2double(D7PH(2*i));

end

fclose('all');












end