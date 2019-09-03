function [r] = computeLetterToRemove(cognitiveLoadTable,p)
%UNTITLED3 Summary of this function goes here

% create random letter assingment, and exclude current letter
if p <= 13
    r = randperm(26);
    
    for i = 1:2
        letterToRemove = cognitiveLoadTable(p-1).targetLetters(i);
        
        if letterToRemove=='A';numberToRemove=1;
        elseif letterToRemove=='B';numberToRemove=2;
        elseif letterToRemove=='C';numberToRemove=3;
        elseif letterToRemove=='D';numberToRemove=4;
        elseif letterToRemove=='E';numberToRemove=5;
        elseif letterToRemove=='F';numberToRemove=6;
        elseif letterToRemove=='G';numberToRemove=7;
        elseif letterToRemove=='H';numberToRemove=8;
        elseif letterToRemove=='I';numberToRemove=9;
        elseif letterToRemove=='J';numberToRemove=10;
        elseif letterToRemove=='K';numberToRemove=11;
        elseif letterToRemove=='L';numberToRemove=12;
        elseif letterToRemove=='M';numberToRemove=13;
        elseif letterToRemove=='N';numberToRemove=14;
        elseif letterToRemove=='O';numberToRemove=15;
        elseif letterToRemove=='P';numberToRemove=16;
        elseif letterToRemove=='Q';numberToRemove=17;
        elseif letterToRemove=='R';numberToRemove=18;
        elseif letterToRemove=='S';numberToRemove=19;
        elseif letterToRemove=='T';numberToRemove=20;
        elseif letterToRemove=='U';numberToRemove=21;
        elseif letterToRemove=='V';numberToRemove=22;
        elseif letterToRemove=='W';numberToRemove=23;
        elseif letterToRemove=='X';numberToRemove=24;
        elseif letterToRemove=='Y';numberToRemove=25;
        elseif letterToRemove=='Z';numberToRemove=26;
        end
        r(r==numberToRemove)= []; %remove existing letter value from random number listing
    end
    
elseif p>13
    r = randperm(26);
    
    for i = 1:4
        letterToRemove = cognitiveLoadTable(p-1).targetLetters(i);
        
        if letterToRemove =='A';numberToRemove=1;
        elseif letterToRemove=='B';numberToRemove=2;
        elseif letterToRemove=='C';numberToRemove=3;
        elseif letterToRemove=='D';numberToRemove=4;
        elseif letterToRemove=='E';numberToRemove=5;
        elseif letterToRemove=='F';numberToRemove=6;
        elseif letterToRemove=='G';numberToRemove=7;
        elseif letterToRemove=='H';numberToRemove=8;
        elseif letterToRemove=='I';numberToRemove=9;
        elseif letterToRemove=='J';numberToRemove=10;
        elseif letterToRemove=='K';numberToRemove=11;
        elseif letterToRemove=='L';numberToRemove=12;
        elseif letterToRemove=='M';numberToRemove=13;
        elseif letterToRemove=='N';numberToRemove=14;
        elseif letterToRemove=='O';numberToRemove=15;
        elseif letterToRemove=='P';numberToRemove=16;
        elseif letterToRemove=='Q';numberToRemove=17;
        elseif letterToRemove=='R';numberToRemove=18;
        elseif letterToRemove=='S';numberToRemove=19;
        elseif letterToRemove=='T';numberToRemove=20;
        elseif letterToRemove=='U';numberToRemove=21;
        elseif letterToRemove=='V';numberToRemove=22;
        elseif letterToRemove=='W';numberToRemove=23;
        elseif letterToRemove=='X';numberToRemove=24;
        elseif letterToRemove=='Y';numberToRemove=25;
        elseif letterToRemove=='Z';numberToRemove=26;
        end
        r(r==numberToRemove) = [];
    end
end
%exports 'r'
end

