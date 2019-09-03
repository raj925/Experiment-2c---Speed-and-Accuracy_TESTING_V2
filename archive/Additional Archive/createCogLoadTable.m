function [cognitiveLoadTable] = createCogLoadTable()
%% Create initial cognitiveLoadTable

% preallocate structure
cognitiveLoadTable = struct('cognitiveLoad', cell(1,24),'numOfLetters',...
    cell(1,24),'targetMatch',cell(1,24),'correct',cell(1,24),'answer',...
    cell(1,24),'trialNumber', cell(1,24),'cogLoadManip',cell(1,24),...
    'newLetters',cell(1,24),'targetLetters',cell(1,24));

% Create Cognitive Load variables
alphabet = 'B':'Z'; alphabet(alphabet=='E') = [];alphabet(alphabet=='I') = [];
alphabet(alphabet=='O') = [];alphabet(alphabet=='U') = [];alphabet(alphabet=='Y') = [];

%compute targetMatch
pretargetMatch=[1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0];
interim1 = Shuffle(pretargetMatch(1:12));
interim2 = Shuffle(pretargetMatch(1:12));
targetMatch = [interim1 interim2].';

% create table & variables
for n = 1:24
    a = randperm(20);b = a(1);c = a(2);d = a(3);e = a(4);f = a(5);
    if n <= 12
        cognitiveLoadTable(n).cognitiveLoad = alphabet(b);
        cognitiveLoadTable(n).numOfLetters = 1;
    elseif n >= 13
        cognitiveLoadTable(n).cognitiveLoad = [alphabet(b),alphabet(c),alphabet(d),alphabet(e),alphabet(f)];
        cognitiveLoadTable(n).numOfLetters = 5;
    end
    cognitiveLoadTable(n).targetMatch = 0;
    cognitiveLoadTable(n).correct = 0;
    cognitiveLoadTable(n).answer = 0;
    cognitiveLoadTable(n).trialNumber = 0;
    cognitiveLoadTable(n).cogLoadManip = 0;
    cognitiveLoadTable(n).newLetters = cognitiveLoadTable(n).cognitiveLoad;
    cognitiveLoadTable(n).targetMatch = targetMatch(n); %if the 2nd stimulus will match or be different to the previous(0=not match, 1=match exactly)
    cognitiveLoadTable(n).targetLetters = cognitiveLoadTable(n).cognitiveLoad;
    % compute letter to remove
    if cognitiveLoadTable(n).targetMatch == 0
        if n<=12;IMAX=1;elseif n>=13;IMAX=5;end
        r = randperm(20);
        for i = 1:IMAX
            letterToRemove = cognitiveLoadTable(n).targetLetters(i);
            if letterToRemove=='B';numberToRemove=1;
            elseif letterToRemove=='C';numberToRemove=2;
            elseif letterToRemove=='D';numberToRemove=3;
            elseif letterToRemove=='F';numberToRemove=4;
            elseif letterToRemove=='G';numberToRemove=5;
            elseif letterToRemove=='H';numberToRemove=6;
            elseif letterToRemove=='J';numberToRemove=7;
            elseif letterToRemove=='K';numberToRemove=8;
            elseif letterToRemove=='L';numberToRemove=9;
            elseif letterToRemove=='M';numberToRemove=10;
            elseif letterToRemove=='N';numberToRemove=11;
            elseif letterToRemove=='P';numberToRemove=12;
            elseif letterToRemove=='Q';numberToRemove=13;
            elseif letterToRemove=='R';numberToRemove=14;
            elseif letterToRemove=='S';numberToRemove=15;
            elseif letterToRemove=='T';numberToRemove=16;
            elseif letterToRemove=='V';numberToRemove=17;
            elseif letterToRemove=='W';numberToRemove=18;
            elseif letterToRemove=='X';numberToRemove=19;
            elseif letterToRemove=='Z';numberToRemove=20;
            end
            r(r==numberToRemove)= []; %remove existing letter value from random number listing
        end
        if n<=12
            cognitiveLoadTable(n).targetLetters(1) = alphabet(r(1));
        elseif n>12
            cognitiveLoadTable(n).targetLetters(randi(5)) = alphabet(r(1));
        end
    end
end
%% Notes

