function [cognitiveLoadTable] = targetManipulations(cognitiveLoadTable,p,alphabet)
% 2 letter inputs
if p <= 13
    if cognitiveLoadTable(p-1).difficultyLevel == 1 %switch order
        firstLetter = cognitiveLoadTable(p-1).targetLetters(1);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(2);
        cognitiveLoadTable(p-1).targetLetters(1) = secondLetter;
        cognitiveLoadTable(p-1).targetLetters(2) = firstLetter;
    elseif cognitiveLoadTable(p-1).difficultyLevel == 2 %replace one letter
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(randi(2)) = alphabet(r(1));
    elseif cognitiveLoadTable(p-1).difficultyLevel == 3 %1 letter wrong and different order
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(randi(2)) = alphabet(r(1));
        % switch letters
        firstLetter = cognitiveLoadTable(p-1).targetLetters(1);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(2);
        cognitiveLoadTable(p-1).targetLetters(1) = secondLetter;
        cognitiveLoadTable(p-1).targetLetters(2) = firstLetter;
    elseif cognitiveLoadTable(p-1).difficultyLevel == 4 %both letters wrong
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(1) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(2) = alphabet(r(2));
    end
    % check is any changes match removal list
    load('twoLetterRemovalList.mat')
    k=0;
    while k<1
        targetLettersChanged = 0;
        for i = 1:38
            if cognitiveLoadTable(p-1).targetLetters == twoLetterRemovalList(i)
                a = randperm(26);b = a(1);c = a(2);
                cognitiveLoadTable(p-1).targetLetters = [alphabet(b),alphabet(c)];
                targetLettersChanged = 1;
            end
        end
        k=2;
        if targetLettersChanged == 1
            k=0;
        end
    end
end
if p>13 % 4-letter inputs
    if cognitiveLoadTable(p-1).difficultyLevel == 1 %2 in diff order
        temp = Shuffle(1:4);
        a = temp(1);b = temp(2);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(a);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(b);
        cognitiveLoadTable(p-1).targetLetters(a) = secondLetter;
        cognitiveLoadTable(p-1).targetLetters(b) = firstLetter;
    elseif cognitiveLoadTable(p-1).difficultyLevel == 2 %3 in diff order
        temp = Shuffle(1:4);
        a = temp(1);b = temp(2);c = temp(3);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(a);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(b);
        thirdLetter = cognitiveLoadTable(p-1).targetLetters(c);
        randomShuffle = randi(2);
        if randomShuffle == 1
            cognitiveLoadTable(p-1).targetLetters(a) = secondLetter;
            cognitiveLoadTable(p-1).targetLetters(b) = thirdLetter;
            cognitiveLoadTable(p-1).targetLetters(c) = firstLetter;
        elseif randomShuffle == 2
            cognitiveLoadTable(p-1).targetLetters(a) = thirdLetter;
            cognitiveLoadTable(p-1).targetLetters(b) = firstLetter;
            cognitiveLoadTable(p-1).targetLetters(c) = secondLetter;
        end
    elseif cognitiveLoadTable(p-1).difficultyLevel == 3 %all in diff order
        temp = Shuffle(1:4);
        while temp == [1:4]; temp = Shuffle(1:4); end
        a = temp(1);b = temp(2);c = temp(3);d = temp(4);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(1);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(2);
        thirdLetter = cognitiveLoadTable(p-1).targetLetters(3);
        fourthLetter = cognitiveLoadTable(p-1).targetLetters(4);
        cognitiveLoadTable(p-1).targetLetters(a) = firstLetter;
        cognitiveLoadTable(p-1).targetLetters(b) = secondLetter;
        cognitiveLoadTable(p-1).targetLetters(c) = thirdLetter;
        cognitiveLoadTable(p-1).targetLetters(d) = fourthLetter;
    elseif cognitiveLoadTable(p-1).difficultyLevel == 4 %1 letter wrong
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
    elseif cognitiveLoadTable(p-1).difficultyLevel == 5 %2 letters wrong
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(temp(2)) = alphabet(r(2));
    elseif cognitiveLoadTable(p-1).difficultyLevel == 6 %2 wrong & 2 diff order
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(temp(2)) = alphabet(r(2));
        % 2 in different order
        temp = Shuffle(1:4);
        a = temp(1);b = temp(2);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(a);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(b);
        cognitiveLoadTable(p-1).targetLetters(a) = secondLetter;
        cognitiveLoadTable(p-1).targetLetters(b) = firstLetter;
    elseif cognitiveLoadTable(p-1).difficultyLevel == 7 %2 wrong & 3 diff order
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(temp(2)) = alphabet(r(2));
        % 3 different order
        temp = Shuffle(1:4);
        a = temp(1);b = temp(2);c = temp(3);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(a);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(b);
        thirdLetter = cognitiveLoadTable(p-1).targetLetters(c);
        randomShuffle = randi(2);
        if randomShuffle == 1
            cognitiveLoadTable(p-1).targetLetters(a) = secondLetter;
            cognitiveLoadTable(p-1).targetLetters(b) = thirdLetter;
            cognitiveLoadTable(p-1).targetLetters(c) = firstLetter;
        elseif randomShuffle == 2
            cognitiveLoadTable(p-1).targetLetters(a) = thirdLetter;
            cognitiveLoadTable(p-1).targetLetters(b) = firstLetter;
            cognitiveLoadTable(p-1).targetLetters(c) = secondLetter;
        end
    elseif cognitiveLoadTable(p-1).difficultyLevel == 8 %3 letters wrong
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(temp(2)) = alphabet(r(2));
        cognitiveLoadTable(p-1).targetLetters(temp(3)) = alphabet(r(3));
    elseif cognitiveLoadTable(p-1).difficultyLevel == 9 %3 wrong & 2 diff order
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(temp(2)) = alphabet(r(2));
        cognitiveLoadTable(p-1).targetLetters(temp(3)) = alphabet(r(3));
        % different order
        temp = Shuffle(1:4);
        a = temp(1);b = temp(2);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(a);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(b);
        cognitiveLoadTable(p-1).targetLetters(a) = secondLetter;
        cognitiveLoadTable(p-1).targetLetters(b) = firstLetter;
    elseif cognitiveLoadTable(p-1).difficultyLevel == 10 %3 wrong & 3 diff order
        temp = Shuffle(1:4);
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(temp(1)) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(temp(3)) = alphabet(r(3));
        % 3 in different order
        temp = Shuffle(1:4);
        a = temp(1);b = temp(2);c = temp(3);
        firstLetter = cognitiveLoadTable(p-1).targetLetters(a);
        secondLetter = cognitiveLoadTable(p-1).targetLetters(b);
        thirdLetter = cognitiveLoadTable(p-1).targetLetters(c);
        randomShuffle = randi(2);
        if randomShuffle == 1
            cognitiveLoadTable(p-1).targetLetters(a) = secondLetter;
            cognitiveLoadTable(p-1).targetLetters(b) = thirdLetter;
            cognitiveLoadTable(p-1).targetLetters(c) = firstLetter;
        elseif randomShuffle == 2
            cognitiveLoadTable(p-1).targetLetters(a) = thirdLetter;
            cognitiveLoadTable(p-1).targetLetters(b) = firstLetter;
            cognitiveLoadTable(p-1).targetLetters(c) = secondLetter;
        end
    elseif cognitiveLoadTable(p-1).difficultyLevel == 11 %all wrong
        [r] = computeLetterToRemove(cognitiveLoadTable,p);
        %execute replacement in table
        cognitiveLoadTable(p-1).targetLetters(1) = alphabet(r(1));
        cognitiveLoadTable(p-1).targetLetters(2) = alphabet(r(2));
        cognitiveLoadTable(p-1).targetLetters(3) = alphabet(r(3));
        cognitiveLoadTable(p-1).targetLetters(4) = alphabet(r(4));
    end
    load('fourLetterRemovalList.mat')
    k=0;
    while k<1
        targetLettersChanged = 0;
        for i = 1:113
            if cognitiveLoadTable(p-1).targetLetters == fourLetterRemovalList(i)
                a = randperm(26);b = a(1);c = a(2);d = a(3);e = a(4);
                cognitiveLoadTable(p-1).targetLetters = [alphabet(b),alphabet(c),alphabet(d),alphabet(e)];
                targetLettersChanged = 1;
            end
        end
        k=2;
        if targetLettersChanged == 1
            k=0;
        end
    end
end
end

