%% Pilot 1
paths = {'C:\Users\ac220\Desktop\Experiment 2b - Cog Load\rawdata\501\behaviour\73749746913_501_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2b - Cog Load\rawdata\502\behaviour\73749754514_502_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2b - Cog Load\rawdata\504\behaviour\73749854773_504_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2b - Cog Load\rawdata\505\behaviour\73750246194_505_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2b - Cog Load\rawdata\506\behaviour\73750346157_506_final.mat'};

nparticipants = 5;

for s = 1:nparticipants
    load(paths{s});
    
    for i = 1:length([cognitiveLoadTable(:).numOfLetters].')
    if cognitiveLoadTable(i).numOfLetters == min([cognitiveLoadTable(:).numOfLetters].')
        tempMin(i).trialNumber = cognitiveLoadTable(i).trialNumber;
    elseif cognitiveLoadTable(i).numOfLetters == max([cognitiveLoadTable(:).numOfLetters].')
        tempMax(i).trialNumber = cognitiveLoadTable(i).trialNumber;
    end
end

trialStartMinLoad = min([tempMin.trialNumber].');
trialEndMinLoad = (max([tempMin.trialNumber].'))+9;
trialStartMaxLoad = min([tempMax.trialNumber].');
trialEndMaxLoad = (max([tempMax.trialNumber].'))+9;
    
    
    testWhichBox = [trials(151:510).whichBox].';
    testWhichBoxlength = length(testWhichBox);
    % Added to fix empty cells (people clicking outside the box)
    for i = 151:510
        if isempty(trials(i).whichBox)
            trials(i).whichBox = 0;
        end
    end
    % end fix action
    
    % Create/extract variables
    whichAdvisorBlk5thru10 = [trials(151:510).whichAdvisor].';
    trialTypeBlk5thru10 = [trials(151:510).trialType].';
    cogLoadCor = [cognitiveLoadTable.correct].';
    cogLoadNumOfLetters = [cognitiveLoadTable.numOfLetters].';
    whichBox = [trials(151:510).whichBox].';
    whichAdvisorBlk5thru6 = [trials(151:270).whichAdvisor].';
    whichAdvisorBlk7thru8 = [trials(271:390).whichAdvisor].';
    whichAdvisorBlk9thru10 = [trials(391:510).whichAdvisor].';
    trialTypeBlk5thru6 = [trials(151:270).trialType].';
    trialTypeBlk7thru8 = [trials(271:390).trialType].';
    trialTypeBlk9thru10 = [trials(391:510).trialType].';
    cor2Blk5thru6 = [trials(151:270).cor2].';
    cor2Blk7thru8 = [trials(271:390).cor2].';
    cor2Blk9thru10 = [trials(391:510).cor2].';
%     cor1Blk5thru6 = [trials(151:270).cor1].';
%     cor1Blk7thru8 = [trials(271:390).cor1].';
%     cor1Blk9thru10 = [trials(391:510).cor1].';
    overallCj1 = mean(abs([trials(151:510).cj1].'));
    cj1Blk5thru6 = mean(abs([trials(151:270).cj1].'));
    cj1Blk7thru8 = mean(abs([trials(271:390).cj1].'));
    cj1Blk9thru10 = mean(abs([trials(391:510).cj1].'));
    overallCor1 = [trials(151:510).cor1].';
    cor1Blk5thru6 = [trials(151:270).cor1].';
    cor1Blk7thru8 = [trials(271:390).cor1].';
    cor1Blk9thru10 = [trials(391:510).cor1].';
    
    overallVectorCj1 = [trials(151:510).cj1].';
    vectorCj1Blk5thru6 = [trials(151:270).cj1].';
    vectorCj1Blk7thru8 = [trials(271:390).cj1].';
    vectorCj1Blk9thru10 = [trials(391:510).cj1].';
    overallCj1Cor1Right = mean(abs(overallVectorCj1(overallCor1==1)));
    overallCj1Cor1Wrong = mean(abs(overallVectorCj1(overallCor1==0)));
    cj1Cor1RightBlk56 = mean(abs(vectorCj1Blk5thru6(cor1Blk5thru6==1)));
    cj1Cor1WrongBlk56 = mean(abs(vectorCj1Blk5thru6(cor1Blk5thru6==0)));
    cj1Cor1RightBlk78 = mean(abs(vectorCj1Blk7thru8(cor1Blk7thru8==1)));
    cj1Cor1WrongBlk78 = mean(abs(vectorCj1Blk7thru8(cor1Blk7thru8==0)));
    cj1Cor1RightBlk910 = mean(abs(vectorCj1Blk9thru10(cor1Blk9thru10==1)));
    cj1Cor1WrongBlk910 = mean(abs(vectorCj1Blk9thru10(cor1Blk9thru10==0)));

    overallCogLoadCor = (sum([cognitiveLoadTable.correct].'))/24;
    lowCogLoadCor = (sum(cogLoadNumOfLetters==1*(cogLoadCor==1)))/12;
    highCogLoadCor = (sum(cogLoadNumOfLetters==5*(cogLoadCor==1)))/12;
    overallCor1Accuracy = (sum([trials(151:510).cor1].'))/360;
    overallCor2Accuracy = (sum([trials(151:510).cor2].'))/360;
    
    cor1AccBlk5thru6 = sum(cor1Blk5thru6)/120;
    cor1AccBlk7thru8 = sum(cor1Blk7thru8)/120;
    cor1AccBlk9thru10 = sum(cor1Blk9thru10)/120;
    
    cor2AccBlk5thru6 = sum(cor2Blk5thru6)/120;
    cor2AccBlk7thru8 = sum(cor2Blk7thru8)/120;
    cor2AccBlk9thru10 = sum(cor2Blk9thru10)/120;
    overallChoiceAlgor2 = sum(whichAdvisorBlk5thru10==2*(trialTypeBlk5thru10==1))/sum(trialTypeBlk5thru10==1);
    algor2Blk5thru6 = sum(whichAdvisorBlk5thru6==2*(trialTypeBlk5thru6==1))/sum(trialTypeBlk5thru6==1);
    algor2Blk7thru8 = sum(whichAdvisorBlk7thru8==2*(trialTypeBlk7thru8==1))/sum(trialTypeBlk7thru8==1);
    algor2Blk9thru10 = sum(whichAdvisorBlk9thru10==2*(trialTypeBlk9thru10==1))/sum(trialTypeBlk9thru10==1);
    dd = trials(91).dotdifference;
    choiceBottomBox = sum(whichBox==2*(trialTypeBlk5thru10==1))/sum(trialTypeBlk5thru10==1);
    
    % Timing for cj1
    overallResp1Timing = mean([trials(151:510).resp1_t].');
    resp1TimingBlk56 = mean([trials(151:270).resp1_t].');
    resp1TimingBlk78 = mean([trials(271:390).resp1_t].');
    resp1TimingBlk910 = mean([trials(391:510).resp1_t].');
    
    
    data(s).testWhichBoxlength = testWhichBoxlength;
    data(s).dd = dd;
    data(s).choiceBottomBox = choiceBottomBox;
    data(s).cognitiveLoadCondition = settings.cognitiveLoadCondition;
    data(s).overallCogLoadCor = overallCogLoadCor;
    data(s).lowCogLoadCor = lowCogLoadCor;
    data(s).highCogLoadCor = highCogLoadCor;
    data(s).overallCor1Accuracy = overallCor1Accuracy;
    data(s).overallCor2Accuracy = overallCor2Accuracy;
    %     data(s).condition2Cor2Acc = condition2Cor2Acc;
    data(s).cor2AccBlk5thru6 = cor2AccBlk5thru6;
    data(s).cor2AccBlk7thru8 = cor2AccBlk7thru8;
    data(s).cor2AccBlk9thru10 = cor2AccBlk9thru10;
    data(s).overallChoiceAlgor2 = overallChoiceAlgor2;
    data(s).algor2Blk5thru6 = algor2Blk5thru6;
    data(s).algor2Blk7thru8 = algor2Blk7thru8;
    data(s).algor2Blk9thru10 = algor2Blk9thru10;
    data(s).cor1AccBlk5thru6 = cor1AccBlk5thru6;
    data(s).cor1AccBlk7thru8 = cor1AccBlk7thru8;
    data(s).cor1AccBlk9thru10 = cor1AccBlk9thru10;
    data(s).overallCj1 = overallCj1;
    data(s).cj1Blk5thru6 = cj1Blk5thru6;
    data(s).cj1Blk7thru8 = cj1Blk7thru8;
    data(s).cj1Blk9thru10 = cj1Blk9thru10;
    data(s).overallCj1Cor1Right = overallCj1Cor1Right ;
    data(s).overallCj1Cor1Wrong = overallCj1Cor1Wrong;
    data(s).cj1Cor1RightBlk56 = cj1Cor1RightBlk56;
    data(s).cj1Cor1WrongBlk56 = cj1Cor1WrongBlk56;
    data(s).cj1Cor1RightBlk78 = cj1Cor1RightBlk78;
    data(s).cj1Cor1WrongBlk78 = cj1Cor1WrongBlk78;
    data(s).cj1Cor1RightBlk910 = cj1Cor1RightBlk910;
    data(s).cj1Cor1WrongBlk910 = cj1Cor1WrongBlk910;
    data(s).overallResp1Timing = overallResp1Timing;
    data(s).resp1TimingBlk56 = resp1TimingBlk56;
    data(s).resp1TimingBlk78 = resp1TimingBlk78;
    data(s).resp1TimingBlk910 = resp1TimingBlk910;
end



%% Notes:

