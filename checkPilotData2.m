
for s = 1:11
    if s <=2 || s>3
        prePath = fullfile(pwd, 'rawdata', int2str(500 + s), 'behaviour');
        dirs = dir(prePath);
        fileName = dirs(13).name;
        path = fullfile(pwd, 'rawdata', int2str(500 + s), 'behaviour',fileName);
        load(path);
        
        clear tempMin;
        clear tempMax;
        clear i;
        
        for i = 1:length([cognitiveLoadTable(:).numOfLetters].')
            if cognitiveLoadTable(i).numOfLetters == min([cognitiveLoadTable(:).numOfLetters].')
                tempMin(i).trialNumber = cognitiveLoadTable(i).trialNumber;
            elseif cognitiveLoadTable(i).numOfLetters == max([cognitiveLoadTable(:).numOfLetters].')
                tempMax(i).trialNumber = cognitiveLoadTable(i).trialNumber;
            end
        end
        trialStartLowLoad = min([tempMin.trialNumber].');
        trialEndLowLoad = (max([tempMin.trialNumber].'))+9;
        trialStartMaxLoad = min([tempMax.trialNumber].');
        trialEndMaxLoad = (max([tempMax.trialNumber].'))+9;
        
        testWhichBox = [trials(151:510).whichBox].';
        testWhichBoxlength = length(testWhichBox);
        for i = 151:510
            if isempty(trials(i).whichBox) % fix action for early programming error
                trials(i).whichBox = 0;
            end
            respTiming(i).resp1Timing = trials(i).resp1_t - trials(i).onsetstim;
            respTiming(i).totalTrialTiming = trials(i).resp2_t - trials(i).onsetstim;
        end
        
        % Create/extract variables
        whichAdvisorBlk5thru10 = [trials(151:510).whichAdvisor].';
        trialTypeBlk5thru10 = [trials(151:510).trialType].';
        cogLoadCor = [cognitiveLoadTable.correct].';
        cogLoadNumOfLetters = [cognitiveLoadTable.numOfLetters].';
        whichBox = [trials(151:510).whichBox].';
        whichAdvisorBlk5thru6 = [trials(151:270).whichAdvisor].';
        whichAdvisorLowLoad = [trials(trialStartLowLoad:trialEndLowLoad).whichAdvisor].';
        whichAdvisorMaxLoad = [trials(trialStartMaxLoad:trialEndMaxLoad).whichAdvisor].';
        trialTypeBlk5thru6 = [trials(151:270).trialType].';
        trialTypeLowLoad = [trials(trialStartLowLoad:trialEndLowLoad).trialType].';
        trialTypeMaxLoad = [trials(trialStartMaxLoad:trialEndMaxLoad).trialType].';
        cor2Blk5thru6 = [trials(151:270).cor2].';
        cor2LowLoad = [trials(trialStartLowLoad:trialEndLowLoad).cor2].';
        cor2MaxLoad = [trials(trialStartMaxLoad:trialEndMaxLoad).cor2].';
        overallCj1 = mean(abs([trials(151:510).cj1].'));
        cj1Blk5thru6 = mean(abs([trials(151:270).cj1].'));
        cj1LowLoad = mean(abs([trials(trialStartLowLoad:trialEndLowLoad).cj1].'));
        cj1MaxLoad = mean(abs([trials(trialStartMaxLoad:trialEndMaxLoad).cj1].'));
        overallCor1 = [trials(151:510).cor1].';
        cor1Blk5thru6 = [trials(151:270).cor1].';
        cor1LowLoad = [trials(trialStartLowLoad:trialEndLowLoad).cor1].';
        cor1MaxLoad = [trials(trialStartMaxLoad:trialEndMaxLoad).cor1].';
        
        overallVectorCj1 = [trials(151:510).cj1].';
        vectorCj1Blk5thru6 = [trials(151:270).cj1].';
        vectorCj1LowLoad = [trials(trialStartLowLoad:trialEndLowLoad).cj1].';
        vectorCj1MaxLoad = [trials(trialStartMaxLoad:trialEndMaxLoad).cj1].';
        overallCj1Cor1Right = mean(abs(overallVectorCj1(overallCor1==1)));
        overallCj1Cor1Wrong = mean(abs(overallVectorCj1(overallCor1==0)));
        cj1Cor1RightBlk56 = mean(abs(vectorCj1Blk5thru6(cor1Blk5thru6==1)));
        cj1Cor1WrongBlk56 = mean(abs(vectorCj1Blk5thru6(cor1Blk5thru6==0)));
        cj1Cor1RightLowLoad = mean(abs(vectorCj1LowLoad(cor1LowLoad==1)));
        cj1Cor1WrongLowLoad = mean(abs(vectorCj1LowLoad(cor1LowLoad==0)));
        cj1Cor1RightMaxLoad = mean(abs(vectorCj1MaxLoad(cor1MaxLoad==1)));
        cj1Cor1WrongMaxLoad = mean(abs(vectorCj1MaxLoad(cor1MaxLoad==0)));
        
        overallCogLoadCor = (sum([cognitiveLoadTable.correct].'))/24;
        lowCogLoadCor = (sum(cogLoadNumOfLetters==(min([cognitiveLoadTable(:).numOfLetters].'))*(cogLoadCor==1)))/12;
        highCogLoadCor = (sum(cogLoadNumOfLetters==(max([cognitiveLoadTable(:).numOfLetters].'))*(cogLoadCor==1)))/12;
        overallCor1Accuracy = (sum([trials(151:510).cor1].'))/360;
        overallCor2Accuracy = (sum([trials(151:510).cor2].'))/360;
        
        cor1AccBlk5thru6 = sum(cor1Blk5thru6)/120;
        cor1AccLowLoad = sum(cor1LowLoad)/120;
        cor1AccMaxLoad = sum(cor1MaxLoad)/120;
        
        cor2AccBlk5thru6 = sum(cor2Blk5thru6)/120;
        cor2AccLowLoad = sum(cor2LowLoad)/120;
        cor2AccMaxLoad = sum(cor2MaxLoad)/120;
        overallChoiceAlgor2 = sum(whichAdvisorBlk5thru10==2*(trialTypeBlk5thru10==1))/sum(trialTypeBlk5thru10==1);
        algor2Blk5thru6 = sum(whichAdvisorBlk5thru6==2*(trialTypeBlk5thru6==1))/sum(trialTypeBlk5thru6==1);
        algor2LowLoad = sum(whichAdvisorLowLoad==2*(trialTypeLowLoad==1))/sum(trialTypeLowLoad==1);
        algor2MaxLoad = sum(whichAdvisorMaxLoad==2*(trialTypeMaxLoad==1))/sum(trialTypeMaxLoad==1);
        dd = trials(91).dotdifference;
        choiceBottomBox = sum(whichBox==2*(trialTypeBlk5thru10==1))/sum(trialTypeBlk5thru10==1);
        
        % Timing for cj1
        overallResp1Timing = mean([respTiming(151:510).resp1Timing].');
        resp1TimingBlk56 = mean([respTiming(151:270).resp1Timing].');
        resp1TimingLowLoad = mean([respTiming(trialStartLowLoad:trialEndLowLoad).resp1Timing].');
        resp1TimingMaxLoad = mean([respTiming(trialStartMaxLoad:trialEndMaxLoad).resp1Timing].');
        
        % Timing for each trial (from onsetstim to confirming cj2)
        overallTrialTiming = mean([respTiming(151:510).totalTrialTiming].');
        trialTimingBlk56 = mean([respTiming(151:270).totalTrialTiming].');
        trialTimingLowLoad = mean([respTiming(trialStartLowLoad:trialEndLowLoad).totalTrialTiming].');
        trialTimingMaxLoad = mean([respTiming(trialStartMaxLoad:trialEndMaxLoad).totalTrialTiming].');
        
        data(s).participant = subject.id;
        data(s).maxNumLetters = max([cognitiveLoadTable(:).numOfLetters].');
        %         data(s).testWhichBoxlength = testWhichBoxlength;
        data(s).dd = dd;
        data(s).choiceBottomBox = choiceBottomBox;
        %         data(s).cognitiveLoadCondition = settings.cognitiveLoadCondition;
        data(s).overallCogLoadCor = overallCogLoadCor;
        data(s).lowCogLoadCor = lowCogLoadCor;
        data(s).highCogLoadCor = highCogLoadCor;
        data(s).overallCor1Accuracy = overallCor1Accuracy;
        data(s).cor1AccBlk5thru6 = cor1AccBlk5thru6;
        data(s).cor1AccLowLoad = cor1AccLowLoad;
        data(s).cor1AccMaxLoad = cor1AccMaxLoad;
        data(s).overallCor2Accuracy = overallCor2Accuracy;
        data(s).cor2AccBlk5thru6 = cor2AccBlk5thru6;
        data(s).cor2AccLowLoad = cor2AccLowLoad;
        data(s).cor2AccMaxLoad = cor2AccMaxLoad;
        data(s).overallChoiceAlgor2 = overallChoiceAlgor2;
        data(s).algor2Blk5thru6 = algor2Blk5thru6;
        data(s).algor2LowLoad = algor2LowLoad;
        data(s).algor2MaxLoad = algor2MaxLoad;
        data(s).overallCj1 = overallCj1;
        data(s).cj1Blk5thru6 = cj1Blk5thru6;
        data(s).cj1LowLoad = cj1LowLoad;
        data(s).cj1MaxLoad = cj1MaxLoad;
        data(s).overallCj1Cor1Right = overallCj1Cor1Right ;
        data(s).overallCj1Cor1Wrong = overallCj1Cor1Wrong;
        data(s).cj1Cor1RightBlk56 = cj1Cor1RightBlk56;
        data(s).cj1Cor1WrongBlk56 = cj1Cor1WrongBlk56;
        data(s).cj1Cor1RightLowLoad = cj1Cor1RightLowLoad;
        data(s).cj1Cor1WrongLowLoad = cj1Cor1WrongLowLoad;
        data(s).cj1Cor1RightMaxLoad = cj1Cor1RightMaxLoad;
        data(s).cj1Cor1WrongMaxLoad = cj1Cor1WrongMaxLoad;
        data(s).overallResp1Timing = overallResp1Timing;
        data(s).resp1TimingBlk56 = resp1TimingBlk56;
        data(s).resp1TimingLowLoad = resp1TimingLowLoad;
        data(s).resp1TimingMaxLoad = resp1TimingMaxLoad;
        data(s).overallTrialTiming = overallTrialTiming;
        data(s).trialTimingBlk56 = trialTimingBlk56;
        data(s).trialTimingLowLoad = trialTimingLowLoad;
        data(s).trialTimingMaxLoad = trialTimingMaxLoad;
    end
end

for j = 1:10
    if data(j).maxNumLetters == 5
        data(j).choiceBottomBox = [];
    end
end

data(3)= [];


%% Notes:

