function [cognitiveLoadTable] = createCogLoadTable()
%% Create initial cognitiveLoadTable
% Create Cognitive Load variables
alphabet = 'A':'Z';
% Easy Cognitive Load
for n = 1:12
    a = randperm(26);b = a(1);c = a(2);
    cognitiveLoadTable(n).cognitiveLoad = [alphabet(b),alphabet(c)];
    load('twoLetterRemovalList.mat')
    k=0;
    while k<1
        targetLettersChanged = 0;
        for i = 1:39
            if cognitiveLoadTable(n).cognitiveLoad == twoLetterRemovalList(i)
                a = randperm(26);b = a(1);c = a(2);
                cognitiveLoadTable(n).cognitiveLoad = [alphabet(b),alphabet(c)];
                targetLettersChanged = 1;
            end
        end
        k=2;
        if targetLettersChanged == 1
            k=0;
        end
    end
    cognitiveLoadTable(n).rightOrWrong = 0;
end
for n = 13:24
    a = randperm(26);b = a(1);c = a(2);d = a(3);e = a(4);
    cognitiveLoadTable(n).cognitiveLoad = [alphabet(b),alphabet(c),alphabet(d),alphabet(e)];
    load('fourLetterRemovalList.mat')
    k=0;
    while k<1
        targetLettersChanged = 0;
        for i = 1:113
            if cognitiveLoadTable(n).cognitiveLoad == fourLetterRemovalList(i)
                a = randperm(26);b = a(1);c = a(2);d = a(3);e = a(4);
                cognitiveLoadTable(n).cognitiveLoad = [alphabet(b),alphabet(c),alphabet(d),alphabet(e)];
                targetLettersChanged = 1;
            end
        end
        k=2;
        if targetLettersChanged == 1
            k=0;
        end
    end
    cognitiveLoadTable(n).rightOrWrong = 0;
end

%compute rightOrWrong
preRightOrWrong=[1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0];
interim1 = Shuffle(preRightOrWrong(1:12));
interim2 = Shuffle(preRightOrWrong(1:12));
rightOrWrong = [interim1 interim2].';
%compute 2-letter difficultyLevel
dLTwoL1 = randperm(4);
temp = randperm(4);
temp2 = randperm(4);
twoLetterDiffLevel = [temp temp2(1:2)];
%compute 4-letter difficultyLevel
dlFourL1 = randperm(11);
fourLetterDiffLevel = [dlFourL1(1:6)];

for m = 1:24
    cognitiveLoadTable(m).correct = 0;
    cognitiveLoadTable(m).timingPenalty = 0;
    cognitiveLoadTable(m).answer = 0;
    cognitiveLoadTable(m).trialNumber = 0;
    cognitiveLoadTable(m).cogLoadManip = 0;
    cognitiveLoadTable(m).newLetters = cognitiveLoadTable(m).cognitiveLoad;
    cognitiveLoadTable(m).rightOrWrong = rightOrWrong(m); %if the 2nd stimulus will match or be different to the previous(0=not match, 1=match exactly)
    cognitiveLoadTable(m).difficultyLevel = 0;
    cognitiveLoadTable(m).targetLetters = cognitiveLoadTable(m).cognitiveLoad;
    
    if m<=12 && cognitiveLoadTable(m).rightOrWrong==0
        x = sum([cognitiveLoadTable.rightOrWrong].');
        cognitiveLoadTable(m).difficultyLevel = twoLetterDiffLevel(m-x);
    elseif m>12 && cognitiveLoadTable(m).rightOrWrong==0
        y = [cognitiveLoadTable.rightOrWrong].';
        y1 = sum(y(1:12));
        y2 = sum(y(13:24));
        w = (y1*2)+y2;
        cognitiveLoadTable(m).difficultyLevel = fourLetterDiffLevel(m-w);
    end
end

for p = 2:25
    if cognitiveLoadTable(p-1).rightOrWrong == 0
        [cognitiveLoadTable] = targetManipulations(cognitiveLoadTable,p,alphabet);
    end
end

end

