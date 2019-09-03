%% Short Script Check
%
% load('C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\999\behaviour\73719759172_999_final.mat')
%
% trials(1:6) = [];
%
% % wherelarger = [trials.wherelarger].';
%
% nTrials = 14;
%
% for s = 1:nTrials
%
% leftSide = trials(s).wheredots(1,:);
% rightSide = trials(s).wheredots(end,:);
% wherelarger = trials(s).wherelarger;
%
% if (sum(leftSide)) - (sum(rightSide)) > 1
%     computedWherelarger = 1;
% elseif (sum(leftSide)) - (sum(rightSide)) < 1
%     computedWherelarger = 2;
% end
%
% if trials(s).cor2 == 1
%     if trials(s).int2 == computedWherelarger
%         verifiedCor2andInt2 = 1;
%     elseif trials(s).int2 ~= computedWherelarger
%         verifiedCor2andInt2 = 0;
%     end
% elseif trials(s).cor2 ~= 1
%      if trials(s).int2 == computedWherelarger
%         verifiedCor2andInt2 = 0;
%     elseif trials(s).int2 ~= computedWherelarger
%         verifiedCor2andInt2 = 1;
%      end
% end
%
% if trials(s).algorithm1Correct == 1
%     if trials(s).algorithm1Answer == computedWherelarger
%         verifiedAlgorCorandAlgorAns = 1;
%     elseif trials(s).algorithm1Answer ~= computedWherelarger
%         verifiedAlgorCorandAlgorAns = 0;
%     end
% elseif trials(s).algorithm1Correct == 0
%     if trials(s).algorithm1Answer == computedWherelarger
%         verifiedAlgorCorandAlgorAns = 0;
%     elseif trials(s).algorithm1Answer ~= computedWherelarger
%         verifiedAlgorCorandAlgorAns = 1;
%     end
% end
%
% if trials(s).algorithm2Correct == 1
%     if trials(s).algorithm2Answer == computedWherelarger
%         verifiedAlgor2CorandAlgor2Ans = 1;
%     elseif trials(s).algorithm2Answer ~= computedWherelarger
%         verifiedAlgor2CorandAlgor2Ans = 0;
%     end
% elseif trials(s).algorithm2Correct == 0
%     if trials(s).algorithm2Answer == computedWherelarger
%         verifiedAlgor2CorandAlgor2Ans = 0;
%     elseif trials(s).algorithm2Answer ~= computedWherelarger
%         verifiedAlgor2CorandAlgor2Ans = 1;
%     end
% end
%
% data(s).computedWherelarger = computedWherelarger;
% data(s).wherelarger = wherelarger;
% data(s).verifiedCor2andInt2 = verifiedCor2andInt2;
% data(s).verifiedAlgorCorandAlgorAns = verifiedAlgorCorandAlgorAns;
% data(s).verifiedAlgor2CorandAlgor2Ans = verifiedAlgor2CorandAlgor2Ans;
% end

%% Long Script Check

paths = {'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\401\behaviour\73720142520_401_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\402\behaviour\73720150608_402_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\403\behaviour\73720152564_403_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\404\behaviour\73720155850_404_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\405\behaviour\73720156669_405_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\406\behaviour\73720159049_406_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\407\behaviour\73720161028_407_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\408\behaviour\73720162961_408_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\409\behaviour\73720164954_409_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\410\behaviour\73720167109_410_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\411\behaviour\73720169470_411_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\412\behaviour\73720171945_412_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\413\behaviour\73720173437_413_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\414\behaviour\73720175732_414_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\415\behaviour\73720176928_415_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\416\behaviour\73720179851_416_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\417\behaviour\73720182141_417_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\418\behaviour\73720344402_418_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\419\behaviour\73720355214_419_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\420\behaviour\73720356392_420_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\421\behaviour\73720360968_421_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\422\behaviour\73720450617_422_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\423\behaviour\73720455190_423_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\424\behaviour\73720459626_424_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\425\behaviour\73720464763_425_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\426\behaviour\73720468009_426_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\427\behaviour\73720480045_427_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\428\behaviour\73720542103_428_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\429\behaviour\73720548914_429_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\430\behaviour\73720550857_430_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\431\behaviour\73720553417_431_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\432\behaviour\73720555135_432_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\433\behaviour\73720559083_433_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\434\behaviour\73720562285_434_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\435\behaviour\73720657092_435_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\436\behaviour\73720659063_436_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\437\behaviour\73720661163_437_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\438\behaviour\73720663116_438_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\439\behaviour\73721162670_439_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 3 - Algor vs Algor\rawdata\440\behaviour\73721247059_440_final.mat'};

nparticipants = 40;

for s = 1:nparticipants

    load(paths{s});

    if settings.condition == 2
        for i = 91:510
            if trials(i).whichAdvisor == 2
                trials(i).whichAdvisor = 1;
            elseif trials(i).whichAdvisor == 1
                trials(i).whichAdvisor = 2;
            end
        end
    end
    
    blk4WhichAdvisor = [trials(91:150).whichAdvisor].';
    
    if settings.condition == 1
        blk4Algorithm1Correct = [trials(91:150).algorithm1Correct].';
        blk4Algorithm2Correct = [trials(91:150).algorithm2Correct].';
    elseif settings.condition == 2
        blk4Algorithm2Correct = [trials(91:150).algorithm1Correct].';
        blk4Algorithm1Correct = [trials(91:150).algorithm2Correct].';
    end
    
    temp = [blk4WhichAdvisor blk4Algorithm1Correct blk4Algorithm2Correct];
    
    algor1Blk4ObsAcc = sum(blk4WhichAdvisor==1*(blk4Algorithm1Correct))/30;
    algor2Blk4ObsAcc = sum(blk4WhichAdvisor==2*(blk4Algorithm2Correct))/30;
    
    blk6thru10WhichAdvisor = [trials(151:510).whichAdvisor].';
    blk6thru10TrialType = [trials(151:510).trialType].';
    
    if settings.condition == 1
        blk6thru10Algorithm1Correct = [trials(151:510).algorithm1Correct].';
        blk6thru10Algorithm2Correct = [trials(151:510).algorithm2Correct].';
    elseif settings.condition ==2
        blk6thru10Algorithm2Correct = [trials(151:510).algorithm1Correct].';
        blk6thru10Algorithm1Correct = [trials(151:510).algorithm2Correct].';
    end
    
    algor1Blk6thru10ForcedObsAcc = sum(blk6thru10WhichAdvisor==1*(blk6thru10TrialType==2*(blk6thru10Algorithm1Correct)))/60;
    algor2Blk6thru10ForcedObsAcc = sum(blk6thru10WhichAdvisor==2*(blk6thru10TrialType==2*(blk6thru10Algorithm2Correct)))/60;
    
    algor1ChoiceTrials = sum((blk6thru10TrialType==1*(blk6thru10WhichAdvisor==1)));
    algor2ChoiceTrials = sum((blk6thru10TrialType==1*(blk6thru10WhichAdvisor==2)));
    totalChoiceTrials = (algor1ChoiceTrials+algor2ChoiceTrials);
    
    algor1Blk6thru10ChoiceObsAcc = sum(blk6thru10WhichAdvisor==1*(blk6thru10TrialType==1*(blk6thru10Algorithm1Correct)))/algor1ChoiceTrials;
    algor2Blk6thru10ChoiceObsAcc = sum(blk6thru10WhichAdvisor==2*(blk6thru10TrialType==1*(blk6thru10Algorithm2Correct)))/algor2ChoiceTrials;
    
    %% by block
    
    % block 5
    blk5WhichAdvisor = [trials(151:210).whichAdvisor].';
    blk5TrialType = [trials(151:210).trialType].';
    
    if settings.condition == 1
        blk5Algorithm1Correct = [trials(151:210).algorithm1Correct].';
        blk5Algorithm2Correct = [trials(151:210).algorithm2Correct].';
    elseif settings.condition == 2
        blk5Algorithm2Correct = [trials(151:210).algorithm1Correct].';
        blk5Algorithm1Correct = [trials(151:210).algorithm2Correct].';
    end
    
    algor1Blk5ChoiceTrials = sum((blk5TrialType==1*(blk5WhichAdvisor==1)));
    algor2Blk5ChoiceTrials = sum((blk5TrialType==1*(blk5WhichAdvisor==2)));
    algor1Blk5ChoiceObsAcc = sum(blk5WhichAdvisor==1*(blk5TrialType==1*(blk5Algorithm1Correct)))/algor1Blk5ChoiceTrials;
    algor2Blk5ChoiceObsAcc = sum(blk5WhichAdvisor==2*(blk5TrialType==1*(blk5Algorithm2Correct)))/algor2Blk5ChoiceTrials;
    
    % block 6
    blk6WhichAdvisor = [trials(211:270).whichAdvisor].';
    blk6TrialType = [trials(211:270).trialType].';
    
    if settings.condition == 1
        blk6Algorithm1Correct = [trials(211:270).algorithm1Correct].';
        blk6Algorithm2Correct = [trials(211:270).algorithm2Correct].';
    elseif settings.condition == 2
        blk6Algorithm2Correct = [trials(211:270).algorithm1Correct].';
        blk6Algorithm1Correct = [trials(211:270).algorithm2Correct].';
    end
    
    algor1Blk6ChoiceTrials = sum((blk6TrialType==1*(blk6WhichAdvisor==1)));
    algor2Blk6ChoiceTrials = sum((blk6TrialType==1*(blk6WhichAdvisor==2)));
    algor1Blk6ChoiceObsAcc = sum(blk6WhichAdvisor==1*(blk6TrialType==1*(blk6Algorithm1Correct)))/algor1Blk6ChoiceTrials;
    algor2Blk6ChoiceObsAcc = sum(blk6WhichAdvisor==2*(blk6TrialType==1*(blk6Algorithm2Correct)))/algor2Blk6ChoiceTrials;
    
    % block 7
    blk7WhichAdvisor = [trials(271:330).whichAdvisor].';
    blk7TrialType = [trials(271:330).trialType].';
    
    if settings.condition == 1
        blk7Algorithm1Correct = [trials(271:330).algorithm1Correct].';
        blk7Algorithm2Correct = [trials(271:330).algorithm2Correct].';
    elseif settings.condition == 2
        blk7Algorithm2Correct = [trials(271:330).algorithm1Correct].';
        blk7Algorithm1Correct = [trials(271:330).algorithm2Correct].';
    end
    
    algor1Blk7ChoiceTrials = sum((blk7TrialType==1*(blk7WhichAdvisor==1)));
    algor2Blk7ChoiceTrials = sum((blk7TrialType==1*(blk7WhichAdvisor==2)));
    algor1Blk7ChoiceObsAcc = sum(blk7WhichAdvisor==1*(blk7TrialType==1*(blk7Algorithm1Correct)))/algor1Blk7ChoiceTrials;
    algor2Blk7ChoiceObsAcc = sum(blk7WhichAdvisor==2*(blk7TrialType==1*(blk7Algorithm2Correct)))/algor2Blk7ChoiceTrials;
    
    % block 8
    blk8WhichAdvisor = [trials(331:390).whichAdvisor].';
    blk8TrialType = [trials(331:390).trialType].';
    
    if settings.condition == 1
        blk8Algorithm1Correct = [trials(331:390).algorithm1Correct].';
        blk8Algorithm2Correct = [trials(331:390).algorithm2Correct].';
    elseif settings.condition == 2
        blk8Algorithm2Correct = [trials(331:390).algorithm1Correct].';
        blk8Algorithm1Correct = [trials(331:390).algorithm2Correct].';
    end
    
    algor1Blk8ChoiceTrials = sum((blk8TrialType==1*(blk8WhichAdvisor==1)));
    algor2Blk8ChoiceTrials = sum((blk8TrialType==1*(blk8WhichAdvisor==2)));
    algor1Blk8ChoiceObsAcc = sum(blk8WhichAdvisor==1*(blk8TrialType==1*(blk8Algorithm1Correct)))/algor1Blk8ChoiceTrials;
    algor2Blk8ChoiceObsAcc = sum(blk8WhichAdvisor==2*(blk8TrialType==1*(blk8Algorithm2Correct)))/algor2Blk8ChoiceTrials;
    
    % block 9
    blk9WhichAdvisor = [trials(391:450).whichAdvisor].';
    blk9TrialType = [trials(391:450).trialType].';
    
    if settings.condition == 1
        blk9Algorithm1Correct = [trials(391:450).algorithm1Correct].';
        blk9Algorithm2Correct = [trials(391:450).algorithm2Correct].';
    elseif settings.condition == 2
        blk9Algorithm2Correct = [trials(391:450).algorithm1Correct].';
        blk9Algorithm1Correct = [trials(391:450).algorithm2Correct].';
    end
    
    algor1Blk9ChoiceTrials = sum((blk9TrialType==1*(blk9WhichAdvisor==1)));
    algor2Blk9ChoiceTrials = sum((blk9TrialType==1*(blk9WhichAdvisor==2)));
    algor1Blk9ChoiceObsAcc = sum(blk9WhichAdvisor==1*(blk9TrialType==1*(blk9Algorithm1Correct)))/algor1Blk9ChoiceTrials;
    algor2Blk9ChoiceObsAcc = sum(blk9WhichAdvisor==2*(blk9TrialType==1*(blk9Algorithm2Correct)))/algor2Blk9ChoiceTrials;
    
    % block 10
    blk10WhichAdvisor = [trials(451:510).whichAdvisor].';
    blk10TrialType = [trials(451:510).trialType].';
    
    if settings.condition == 1
        blk10Algorithm1Correct = [trials(451:510).algorithm1Correct].';
        blk10Algorithm2Correct = [trials(451:510).algorithm2Correct].';
    elseif settings.condition == 2
        blk10Algorithm2Correct = [trials(451:510).algorithm1Correct].';
        blk10Algorithm1Correct = [trials(451:510).algorithm2Correct].';
    end
    
    algor1Blk10ChoiceTrials = sum((blk10TrialType==1*(blk10WhichAdvisor==1)));
    algor2Blk10ChoiceTrials = sum((blk10TrialType==1*(blk10WhichAdvisor==2)));
    algor1Blk10ChoiceObsAcc = sum(blk10WhichAdvisor==1*(blk10TrialType==1*(blk10Algorithm1Correct)))/algor1Blk10ChoiceTrials;
    algor2Blk10ChoiceObsAcc = sum(blk10WhichAdvisor==2*(blk10TrialType==1*(blk10Algorithm2Correct)))/algor2Blk10ChoiceTrials;
    
    %% Final Matrix
    
    finalMatrix = [algor1Blk4ObsAcc algor1Blk6thru10ForcedObsAcc algor1Blk6thru10ChoiceObsAcc algor1Blk5ChoiceObsAcc algor1Blk6ChoiceObsAcc algor1Blk7ChoiceObsAcc algor1Blk8ChoiceObsAcc algor1Blk9ChoiceObsAcc algor1Blk10ChoiceObsAcc;...
        algor2Blk4ObsAcc algor2Blk6thru10ForcedObsAcc algor2Blk6thru10ChoiceObsAcc algor2Blk5ChoiceObsAcc algor2Blk6ChoiceObsAcc algor2Blk7ChoiceObsAcc algor2Blk8ChoiceObsAcc algor2Blk9ChoiceObsAcc algor2Blk10ChoiceObsAcc];
    
    %% percent choice
    percentChoiceAlgor1 = ((sum(blk6thru10WhichAdvisor==1*(blk6thru10TrialType==1)))/240)*100;
    percentChoiceAlgor2 = ((sum(blk6thru10WhichAdvisor==2*(blk6thru10TrialType==1)))/240)*100;
    
    percentChoice = [percentChoiceAlgor1 percentChoiceAlgor2];
    
    %% Choice Accuracy Percent for blocks 6:10
    
    algor1ChoiceObservedAccuracy = ((sum(algor1Blk5ChoiceObsAcc + algor1Blk6ChoiceObsAcc + algor1Blk7ChoiceObsAcc+...
        algor1Blk8ChoiceObsAcc + algor1Blk9ChoiceObsAcc + algor1Blk10ChoiceObsAcc))/6)*100;
    algor2ChoiceObservedAccuracy = ((sum(algor2Blk5ChoiceObsAcc + algor2Blk6ChoiceObsAcc + algor2Blk7ChoiceObsAcc+...
        algor2Blk8ChoiceObsAcc + algor2Blk9ChoiceObsAcc + algor2Blk10ChoiceObsAcc))/6)*100;
    
    %% Additional Checks
    
    actualDD = trials(91).dotdifference;
    
    practiceDDMatrix = ([trials(1:90).dotdifference].');
    minPracDD = min(practiceDDMatrix);
    maxPracDD = max(practiceDDMatrix);
    finalDD = trials(90).dotdifference;
    computedExpDD1 = (minPracDD+finalDD)/2;
    if computedExpDD1 > 15
        computedExpDD1 = 15;
    end
    
    computedExpDD = fix(computedExpDD1);
    
    if actualDD == computedExpDD
        DDChecksum = 1;
    elseif actualDD ~= computedExpDD
        DDChecksum = 0;
    end
    
    data(s).subjectID = subject.id;
    data(s).whichCondition = settings.condition;
    data(s).finalMatrix = finalMatrix;
    data(s).algor1Blk4ObsAcc = algor1Blk4ObsAcc;
    data(s).algor2Blk4ObsAcc = algor2Blk4ObsAcc;
    data(s).algor1Blk6thru10ForcedObsAcc = algor1Blk6thru10ForcedObsAcc;
    data(s).algor2Blk6thru10ForcedObsAcc = algor2Blk6thru10ForcedObsAcc;
    data(s).algor1ChoiceObservedAccuracy = algor1ChoiceObservedAccuracy;
    data(s).algor2ChoiceObservedAccuracy = algor2ChoiceObservedAccuracy;
    data(s).DDChecksum = DDChecksum;
    data(s).percentChoiceAlgor1 = percentChoiceAlgor1;
    data(s).percentChoiceAlgor2 = percentChoiceAlgor2;
    
end
