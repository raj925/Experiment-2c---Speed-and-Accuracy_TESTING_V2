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

% for s = 12:54
%     if s<=30 || s>31
%         if s<=37 || s>38
%             if s<=42 || s>43
%                 if s <=27 || s>28
%                     prePath = fullfile(pwd, 'rawdata', int2str(500 + s), 'behaviour');
%                     dirs = dir(prePath);
%                     fileName = dirs(13).name;
%                     path = fullfile(pwd, 'rawdata', int2str(500 + s), 'behaviour',fileName);
%                     load(path);
%                 elseif s == 28
%                     load('C:\Users\ac220\Desktop\Experiment 2b - Cog Load\rawdata\528-End-Crash\behaviour\73754561165_528_26.mat')
%                 end

paths = {'./rawdata/604/behaviour/73760048394_604_final.mat'...
    './rawdata/605/behaviour/73760148400_605_final.mat'...
    './rawdata/606/behaviour/73760161146_606_final.mat'...
    './rawdata/607/behaviour/73760161137_607_final.mat'...
    './rawdata/608/behaviour/73760861570_608_final.mat'...
    './rawdata/609/behaviour/73761460811_609_final.mat'...
    './rawdata/610/behaviour/73761661171_610_final.mat'...
    './rawdata/611/behaviour/73761661162_611_final.mat'...
    './rawdata/612/behaviour/73761661161_612_final.mat'...
    './rawdata/613/behaviour/73761661220_613_final.mat'...
    './rawdata/614/behaviour/73761661197_614_final.mat'...
    './rawdata/615/behaviour/73761761379_615_final.mat'...
    './rawdata/616/behaviour/73761760950_616_final.mat'...
    './rawdata/617/behaviour/73761760969_617_final.mat'...
    './rawdata/618/behaviour/73762046121_618_final.mat'...
    './rawdata/619/behaviour/73762046127_619_final.mat'...
    './rawdata/620/behaviour/73762276864_620_final.mat'...
    './rawdata/621/behaviour/73762354904_621_final.mat'...
    './rawdata/622/behaviour/73762537977_622_final.mat'...
    './rawdata/623/behaviour/73762554655_623_final.mat'...
    './rawdata/624/behaviour/73762571496_624_final.mat'...
    './rawdata/625/behaviour/73762571471_625_final.mat'...
    './rawdata/626/behaviour/73762746075_626_final.mat'...
    './rawdata/627/behaviour/73762877098_627_final.mat'...
    './rawdata/628/behaviour/73762861087_628_final.mat'...
    './rawdata/629/behaviour/73762961116_629_final.mat'...
    './rawdata/630/behaviour/73762977440_630_final.mat'...
    './rawdata/631/behaviour/73763648175_631_final.mat'...
    './rawdata/632/behaviour/73763673776_632_final.mat'...
    './rawdata/633/behaviour/73763765156_633_final.mat'...
    './rawdata/634/behaviour/73763946323_634_final.mat'...
    './rawdata/635/behaviour/73763965149_635_final.mat'...
    './rawdata/636/behaviour/73763966179_636_final.mat'...
    './rawdata/637/behaviour/73764046849_637_final.mat'...
    './rawdata/638/behaviour/73764146875_638_final.mat'};

trialPlot = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30];

nparticipants = 35;

for s = 1:nparticipants
    load(paths{s});
    
    randTrialSelect = [trials(1:510).randTrialSelect].';
    randForcedTrial = [trials(1:510).randForcedTrials].';
    randChoiceTrial = [trials(1:510).randChoiceTrial].';

    blk4WhichAdvisor = [trials(91:150).whichAdvisor].';
    blk4Algorithm1Correct = [trials(91:150).algorithm1Correct].';
    blk4Algorithm2Correct = [trials(91:150).algorithm2Correct].';
    blk4Cor2 = [trials(91:150).cor2].';
    temp = [blk4WhichAdvisor blk4Algorithm1Correct blk4Algorithm2Correct];
    
    blk4ObsAlg1Conf = [trials(91:150).algorithm1Confidence].';
    
    staircaseDD = [trials(1:90).dotdifference].';
    staircaseCor1 = [trials(1:90).cor1].';
    
    blk4Cor1 = [trials(91:150).cor1].';
    accCor1 = sum(blk4Cor1)/60;

    algor1Blk4ObsAcc = sum(blk4WhichAdvisor==1*(blk4Algorithm1Correct))/30;
    algor2Blk4ObsAcc = sum(blk4WhichAdvisor==2*(blk4Algorithm2Correct))/30;
    
    blk4Algorithm1CorrectWhenChosen = blk4Algorithm1Correct(blk4WhichAdvisor==1);
    blk4Algorithm2CorrectWhenChosen = blk4Algorithm2Correct(blk4WhichAdvisor==2);
    blk4Algorithm1Agreed = sum(blk4WhichAdvisor==1*(blk4Cor2==blk4Algorithm1Correct));
    blk4Algorithm2Agreed = sum(blk4WhichAdvisor==2*(blk4Cor2==blk4Algorithm2Correct));
     
        alg1CorrOverBlock4 = [];
    alg2CorrOverBlock4 = [];
    alg1Total = 0;
    alg2Total = 0;
    for i=1:30
        if blk4Algorithm1CorrectWhenChosen(i) == 1
            alg1Total = alg1Total + 1;
        end
        if blk4Algorithm2CorrectWhenChosen(i) == 1
            alg2Total = alg2Total + 1;
        end
        alg1CorrOverBlock4(i) = alg1Total;
        alg2CorrOverBlock4(i) = alg2Total;
    end

    blk6thru10WhichAdvisor = [trials(151:510).whichAdvisor].';
    blk6thru10TrialType = [trials(151:510).trialType].';
    blk6thru10Algorithm1Correct = [trials(151:510).algorithm1Correct].';
    blk6thru10Algorithm2Correct = [trials(151:510).algorithm2Correct].';

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

    blk5Algorithm1Correct = [trials(151:210).algorithm1Correct].';
    blk5Algorithm2Correct = [trials(151:210).algorithm2Correct].';

    algor1Blk5ChoiceTrials = sum((blk5TrialType==1*(blk5WhichAdvisor==1)));
    algor2Blk5ChoiceTrials = sum((blk5TrialType==1*(blk5WhichAdvisor==2)));
    algor1Blk5ChoiceObsAcc = sum(blk5WhichAdvisor==1*(blk5TrialType==1*(blk5Algorithm1Correct)))/algor1Blk5ChoiceTrials;
    algor2Blk5ChoiceObsAcc = sum(blk5WhichAdvisor==2*(blk5TrialType==1*(blk5Algorithm2Correct)))/algor2Blk5ChoiceTrials;

    % block 6
    blk6WhichAdvisor = [trials(211:270).whichAdvisor].';
    blk6TrialType = [trials(211:270).trialType].';

    blk6Algorithm1Correct = [trials(211:270).algorithm1Correct].';
    blk6Algorithm2Correct = [trials(211:270).algorithm2Correct].';

    algor1Blk6ChoiceTrials = sum((blk6TrialType==1*(blk6WhichAdvisor==1)));
    algor2Blk6ChoiceTrials = sum((blk6TrialType==1*(blk6WhichAdvisor==2)));
    algor1Blk6ChoiceObsAcc = sum(blk6WhichAdvisor==1*(blk6TrialType==1*(blk6Algorithm1Correct)))/algor1Blk6ChoiceTrials;
    algor2Blk6ChoiceObsAcc = sum(blk6WhichAdvisor==2*(blk6TrialType==1*(blk6Algorithm2Correct)))/algor2Blk6ChoiceTrials;
    
    algor1Blk5ForcedObsAcc = sum(blk5WhichAdvisor==1*(blk5TrialType==2*(blk5Algorithm1Correct)))/10;
    algor2Blk5ForcedObsAcc = sum(blk5WhichAdvisor==2*(blk5TrialType==2*(blk5Algorithm2Correct)))/10;


    % block 7
    blk7WhichAdvisor = [trials(271:330).whichAdvisor].';
    blk7TrialType = [trials(271:330).trialType].';

    blk7Algorithm1Correct = [trials(271:330).algorithm1Correct].';
    blk7Algorithm2Correct = [trials(271:330).algorithm2Correct].';

    algor1Blk7ChoiceTrials = sum((blk7TrialType==1*(blk7WhichAdvisor==1)));
    algor2Blk7ChoiceTrials = sum((blk7TrialType==1*(blk7WhichAdvisor==2)));
    algor1Blk7ChoiceObsAcc = sum(blk7WhichAdvisor==1*(blk7TrialType==1*(blk7Algorithm1Correct)))/algor1Blk7ChoiceTrials;
    algor2Blk7ChoiceObsAcc = sum(blk7WhichAdvisor==2*(blk7TrialType==1*(blk7Algorithm2Correct)))/algor2Blk7ChoiceTrials;

    % block 8
    blk8WhichAdvisor = [trials(331:390).whichAdvisor].';
    blk8TrialType = [trials(331:390).trialType].';

    blk8Algorithm1Correct = [trials(331:390).algorithm1Correct].';
    blk8Algorithm2Correct = [trials(331:390).algorithm2Correct].';

    algor1Blk8ChoiceTrials = sum((blk8TrialType==1*(blk8WhichAdvisor==1)));
    algor2Blk8ChoiceTrials = sum((blk8TrialType==1*(blk8WhichAdvisor==2)));
    algor1Blk8ChoiceObsAcc = sum(blk8WhichAdvisor==1*(blk8TrialType==1*(blk8Algorithm1Correct)))/algor1Blk8ChoiceTrials;
    algor2Blk8ChoiceObsAcc = sum(blk8WhichAdvisor==2*(blk8TrialType==1*(blk8Algorithm2Correct)))/algor2Blk8ChoiceTrials;

    % block 9
    blk9WhichAdvisor = [trials(391:450).whichAdvisor].';
    blk9TrialType = [trials(391:450).trialType].';

    blk9Algorithm1Correct = [trials(391:450).algorithm1Correct].';
    blk9Algorithm2Correct = [trials(391:450).algorithm2Correct].';

    algor1Blk9ChoiceTrials = sum((blk9TrialType==1*(blk9WhichAdvisor==1)));
    algor2Blk9ChoiceTrials = sum((blk9TrialType==1*(blk9WhichAdvisor==2)));
    algor1Blk9ChoiceObsAcc = sum(blk9WhichAdvisor==1*(blk9TrialType==1*(blk9Algorithm1Correct)))/algor1Blk9ChoiceTrials;
    algor2Blk9ChoiceObsAcc = sum(blk9WhichAdvisor==2*(blk9TrialType==1*(blk9Algorithm2Correct)))/algor2Blk9ChoiceTrials;

    % block 10
    blk10WhichAdvisor = [trials(451:510).whichAdvisor].';
    blk10TrialType = [trials(451:510).trialType].';

    blk10Algorithm1Correct = [trials(451:510).algorithm1Correct].';
    blk10Algorithm2Correct = [trials(451:510).algorithm2Correct].';

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

    obs1 = [algor1Blk5ChoiceObsAcc algor1Blk6ChoiceObsAcc algor1Blk7ChoiceObsAcc algor1Blk8ChoiceObsAcc algor1Blk9ChoiceObsAcc algor1Blk10ChoiceObsAcc];
    obs2 = [algor2Blk5ChoiceObsAcc algor2Blk6ChoiceObsAcc algor2Blk7ChoiceObsAcc algor2Blk8ChoiceObsAcc algor2Blk9ChoiceObsAcc algor2Blk10ChoiceObsAcc];
    algor1ChoiceObservedAccuracy = ((nansum(obs1))/(6-sum(isnan(obs1))))*100;
    algor2ChoiceObservedAccuracy = ((nansum(obs2))/(6-sum(isnan(obs2))))*100;

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
    
    flag = 0;
    count = 1;
    dd = actualDD;
    for n=91:510
        if n <151
            index = randTrialSelect(n);
            if advisorBlk4Trials(dd).wherelarger(index) ~= trials(n).wherelarger
                flag = 1;
            end
            if advisorBlk4Trials(dd).algorithm1Correct(index) ~= trials(n).algorithm1Correct
                flag = 1;
            end
            if advisorBlk4Trials(dd).algorithm1Answer(index) ~= trials(n).algorithm1Answer
                flag = 1;
            end
            if advisorBlk4Trials(dd).algorithm1Confidence(index) ~= trials(n).algorithm1Confidence
                flag = 1;
            end
        else
            if trials(n).trialType == 1
                index = randChoiceTrial(n);
                if advisorChoiceTrials(dd).wherelarger(index) ~= trials(n).wherelarger
                    flag = 1;
                end
                if advisorChoiceTrials(dd).algorithm1Correct(index) ~= trials(n).algorithm1Correct
                    flag = 1;
                end
                if advisorChoiceTrials(dd).algorithm1Answer(index) ~= trials(n).algorithm1Answer
                    flag = 1;
                end
                if advisorChoiceTrials(dd).algorithm1Confidence(index) ~= trials(n).algorithm1Confidence
                    flag = 1;

                end
            end
            if trials(n).trialType == 2
                index = randForcedTrial(n);
                if advisorForcedTrials(dd).wherelarger(index) ~= trials(n).wherelarger
                    flag = 1;
                end
                if advisorForcedTrials(dd).algorithm1Correct(index) ~= trials(n).algorithm1Correct
                    flag = 1;
                end
                if advisorForcedTrials(dd).algorithm1Answer(index) ~= trials(n).algorithm1Answer
                    flag = 1;
                end
                if advisorForcedTrials(dd).algorithm1Confidence(index) ~= trials(n).algorithm1Confidence
                    flag = 1;

                end
            end      
        end            
    end
    
    
    checkdata(s).subjectID = subject.id;
    checkdata(s).whichCondition = settings.condition;
    checkdata(s).speedAccCondition = settings.SCACCondition;
    checkdata(s).finalMatrix = finalMatrix;
    checkdata(s).algor1Blk4ObsAcc = algor1Blk4ObsAcc;
    checkdata(s).algor2Blk4ObsAcc = algor2Blk4ObsAcc;
    checkdata(s).algor1Blk6thru10ForcedObsAcc = algor1Blk6thru10ForcedObsAcc;
    checkdata(s).algor2Blk6thru10ForcedObsAcc = algor2Blk6thru10ForcedObsAcc;
    checkdata(s).algor1ChoiceObservedAccuracy = algor1ChoiceObservedAccuracy;
    checkdata(s).algor2ChoiceObservedAccuracy = algor2ChoiceObservedAccuracy;
    checkdata(s).DDChecksum = DDChecksum;
    checkdata(s).percentChoiceAlgor1 = percentChoiceAlgor1;
    checkdata(s).percentChoiceAlgor2 = percentChoiceAlgor2;
    checkdata(s).blk4ObsAlg1Conf = mean(abs(blk4ObsAlg1Conf));
    checkdata(s).blk4Algorithm1CorrectWhenChosen = blk4Algorithm1CorrectWhenChosen;
    checkdata(s).blk4Algorithm2CorrectWhenChosen = blk4Algorithm2CorrectWhenChosen;
    checkdata(s).alg1CorrOverBlock4 = alg1CorrOverBlock4;
    checkdata(s).alg2CorrOverBlock4 = alg2CorrOverBlock4;
    checkdata(s).blk4Algorithm1Agreed = blk4Algorithm1Agreed;
    checkdata(s).blk4Algorithm2Agreed = blk4Algorithm2Agreed;
    checkdata(s).actualDD = actualDD;
    checkdata(s).advisorLookupIssue = flag;
    checkdata(s).accCor1Blk4 = accCor1;
    
%     figure
%     plot(trialPlot, checkdata(s).alg1CorrOverBlock4, '-ro');
%     hold on;
%     plot(trialPlot, checkdata(s).alg2CorrOverBlock4, '-bo');
%     legend('Algor1', 'Algor2');
%     title('Block 4 Advisor Correctness');

                
end

%% Notes:
