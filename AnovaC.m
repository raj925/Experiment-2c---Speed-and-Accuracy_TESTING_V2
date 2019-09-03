%% Anova Code (author: Raj Aiyer)
% This code is for initial exploration of participant data from EYORD study
% 2c, as part of Aaron Celaya's PhD.
% This code looks at comparing different combinations for correlation out of 
% confidence judgements (pre/post advice), objective accuracy and choice of
% advisor, with speed and accuracy blocks added.

%% Data Load
% Load all the participant data.
% Filepaths are taken from the current working directory of the code,
% so this code should work no matter what computer and where you put the
% code folder.

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
    './rawdata/638/behaviour/73764146875_638_final.mat'...
    './rawdata/639/behaviour/73764448396_639_final.mat'...
    './rawdata/640/behaviour/73764461016_640_final.mat'...
    './rawdata/641/behaviour/73764461034_641_final.mat'...
    './rawdata/642/behaviour/73764461036_642_final.mat'...
    './rawdata/643/behaviour/73764542458_643_final.mat'};

%% Global Variables
nparticipants = 40;


%% Loop
for s = 1:nparticipants
    
   load(paths{s});
   
   for i = 151:510
       if isempty(trials(i).cj2)
           trials(i).cj2 = 0;
           trials(i).rt2 = 0;
           trials(i).resp2_t = 0;
       end
       
       % I want to condense the speed and acc manip variables into one for
       % ease of reference and also to easily get block 5-6 data.
       
       % speedAccCondition:
       % 0 -> Blocks 5-6, no speed or acc condition
       % 1 -> Speed condition (Time Limit)
       % 2 -> Accuracy Condition (Reward)
       if trials(i).block == 5 || trials(i).block == 6
           trials(i).speedAccCondition = 0;
       elseif trials(i).speedManip == 1
           trials(i).speedAccCondition = 1;
       elseif trials(i).accManip == 1
           trials(i).speedAccCondition = 2;
       end
   end
        
    %%  Trials Data Variables
    % Where we call all of the data columns that we want from the trials
    % dataset for each participant.
    cj1 = [trials(151:510).cj1].';
    cj2 = [trials(151:510).cj2].';
    int1 = [trials(151:510).int1].';
    int2 = [trials(151:510).int2].';
    algor1AdvisorAnswer = [trials(151:510).algorithm1Answer].';
    algor2AdvisorAnswer = [trials(151:510).algorithm2Answer].';
    whichAdvisor = [trials(151:510).whichAdvisor].';
    trialType = [trials(151:510).trialType].';
    cor1 = [trials(151:510).cor1].';
    cor2 = [trials(151:510).cor2].';
    block = [trials(151:510).block].';
    algorCorrect1 = [trials(151:510).algorithm1Correct].';
    algorCorrect2 = [trials(151:510).algorithm2Correct].';
    algor1Confidence = [trials(151:510).algorithm1Confidence].';
    dotRT = [trials(151:510).rt1].';
    advisorRT = [trials(151:510).advisorRT].';
    speedAccCondition = [trials(151:510).speedAccCondition].';
    whichAdvisorLocation = [trials(151:510).whichAdvisorLocation].';
    
    block4WhichAdvisor = [trials(91:150).whichAdvisor].';
    block4Algor1Correct = [trials(91:150).algorithm1Correct].';
    block4Algor2Correct = [trials(91:150).algorithm2Correct].';
    
    cj1abs = abs(cj1);
    cj1Orig = cj1;
    cj2Orig = cj2;
    cj1 = abs(cj1);
    cj2 = abs(cj2);
    
    choiceWhenAlgor1Wrong = [];
    choiceWhenAlgor1Correct = [];
    choiceWhenAlgor2Wrong = [];
    choiceWhenAlgor2Correct = [];
    
    for n = 2:360
        if trialType(n) == 1 && trialType(n-1) == 2
            if whichAdvisor(n-1) == 1
                if algorCorrect1(n-1) == 0
                    choiceWhenAlgor1Wrong = [choiceWhenAlgor1Wrong, whichAdvisor(n)-1];
                    algor2ChoiceWhenAlgor1Wrong = sum(choiceWhenAlgor1Wrong)/size(choiceWhenAlgor1Wrong,2);
                    advisorStayWhenAlgor1Wrong = sum(choiceWhenAlgor1Wrong==0)/size(choiceWhenAlgor1Wrong,2);
                elseif algorCorrect1(n-1) == 1
                    choiceWhenAlgor1Correct = [choiceWhenAlgor1Correct, whichAdvisor(n)-1];
                    algor2ChoiceWhenAlgor1Correct = sum(choiceWhenAlgor1Correct)/size(choiceWhenAlgor1Correct,2);
                    advisorStayWhenAlgor1Correct = sum(choiceWhenAlgor1Correct==0)/size(choiceWhenAlgor1Correct,2);
                end
            elseif whichAdvisor(n-1) ==2
                if algorCorrect2(n-1) == 0
                    choiceWhenAlgor2Wrong = [choiceWhenAlgor2Wrong, whichAdvisor(n)-1];
                    algor2ChoiceWhenAlgor2Wrong = sum(choiceWhenAlgor2Wrong)/size(choiceWhenAlgor2Wrong,2);
                    advisorStayWhenAlgor2Wrong = sum(choiceWhenAlgor2Wrong==1)/size(choiceWhenAlgor2Wrong,2);
                elseif algorCorrect2(n-1) == 1
                    choiceWhenAlgor2Correct = [choiceWhenAlgor2Correct, whichAdvisor(n)-1];
                    algor2ChoiceWhenAlgor2Correct = sum(choiceWhenAlgor2Correct)/size(choiceWhenAlgor2Correct,2);
                    advisorStayWhenAlgor2Correct = sum(choiceWhenAlgor2Correct==1)/size(choiceWhenAlgor2Correct,2);
                end
            end
        end
    end

    % Compute agree and disagree advice by advisor type
    algor1AdvisorSameAnswer = (whichAdvisor==1*(trialType==2*(int1 == algor1AdvisorAnswer)));
    algor1AdvisorDiffAnswer = (whichAdvisor==1*(trialType==2*(int1 ~= algor1AdvisorAnswer)));
    algor2AdvisorSameAnswer = (whichAdvisor==2*(trialType==2*(int1 == algor2AdvisorAnswer)));
    algor2AdvisorDiffAnswer = (whichAdvisor==2*(trialType==2*(int1 ~= algor2AdvisorAnswer)));
    
    % After advice.
    % Advisor 1
    adv1CorrectForced = sum(whichAdvisor==1&trialType==2&cor2==1&speedAccCondition==0)/sum(whichAdvisor==1&trialType==2&speedAccCondition==0);
    adv1CorrectReg = sum(whichAdvisor==1&cor2==1&speedAccCondition==0)/sum(whichAdvisor==1&speedAccCondition==0);
    adv1CorrectAll = sum(whichAdvisor==1&cor2==1)/sum(whichAdvisor==1);
    % Advisor 2
    adv2CorrectForced = sum(whichAdvisor==2&trialType==2&cor2==1&speedAccCondition==0)/sum(whichAdvisor==2&trialType==2&speedAccCondition==0);
    adv2CorrectReg = sum(whichAdvisor==2&cor2==1&speedAccCondition==0)/sum(whichAdvisor==2&speedAccCondition==0);
    adv2CorrectAll = sum(whichAdvisor==2&cor2==1)/sum(whichAdvisor==2);
    
    % Advisor 1
    algor1Chosen = sum(whichAdvisor==1*(trialType==1))/sum(trialType==1);
    % Advisor 2
    algor2Chosen = sum(whichAdvisor==2*(trialType==1))/sum(trialType==1);
    
    % Create quintiles by first confidence judgement (more self confidence)
    % and percentage of advisor 1 being chosen
    % BLOCKS 5 AND 6
    quants1=quantile(abs(cj1),[.25 .5 .75]);
    quantAdvisor1=sum(trialType==1&whichAdvisor==1&abs(cj1)<=quants1(1))/sum(trialType==1&abs(cj1)<=quants1(1));
    quantAdvisor2=sum(trialType==1&whichAdvisor==1&abs(cj1)>quants1(1)&abs(cj1)<=quants1(2))/sum(trialType==1&abs(cj1)>quants1(1)&abs(cj1)<=quants1(2));
    quantAdvisor3=sum(trialType==1&whichAdvisor==1&abs(cj1)>quants1(2)&abs(cj1)<=quants1(3))/sum(trialType==1&abs(cj1)>quants1(2)&abs(cj1)<=quants1(3));
    quantAdvisor4=sum(trialType==1&whichAdvisor==1&abs(cj1)>quants1(3))/sum(trialType==1&abs(cj1)>quants1(3));
    
        % Create quintiles by second confidence judgement (more confidence in
    % self + advisor) compared to accuracy for each advisor
    quants2=quantile(abs(cj2),[.25 .5 .75]);

    quantCorrect1=sum(cor1==1&abs(cj1)<=quants1(1))/sum(abs(cj1)<=quants1(1));
    quantCorrect2=sum(cor1==1&abs(cj1)>quants1(1)&abs(cj1)<=quants1(2))/sum(abs(cj1)>quants1(1)&abs(cj1)<=quants1(2));
    quantCorrect3=sum(cor1==1&abs(cj1)>quants1(2)&abs(cj1)<=quants1(3))/sum(abs(cj1)>quants1(2)&abs(cj1)<=quants1(3));
    quantCorrect4=sum(cor1==1&abs(cj1)>quants1(3))/sum(abs(cj1)>quants1(3));
    
    if s == 27
        disp(quantCorrect4);
        disp(sum(cor1==1&abs(cj1)>quants1(3)));
        disp(sum(abs(cj1)>quants1(3)));
        disp(abs(cj1));
        disp(quants1);
    end
    
    % Create quintiles by first confidence judgement ONLY
    quantCj1=sum(abs(cj1)<=quants1(1))/360;
    quantCj2=sum(abs(cj1)>quants1(1)&abs(cj1)<=quants1(2))/360;
    quantCj3=sum(abs(cj1)>quants1(2)&abs(cj1)<=quants1(3))/360;
    quantCj4=sum(abs(cj1)>quants1(3)&abs(cj1))/360;
   
   % Mean fields related to comparing participant data within each
   % SpeedAccCondition.
    meanCj1Reg = mean(cj1(speedAccCondition==0));
    meanCj2Reg = mean(nonzeros(cj2(trialType==2*(speedAccCondition==0))));
    algor1ChosenReg = sum(whichAdvisor==1*(trialType==1*(speedAccCondition==0)))/sum(trialType==1*(speedAccCondition==0));
    correctFirstReg = sum(cor1==1&speedAccCondition==0)/sum(speedAccCondition==0);
    meanDotRTReg = mean(dotRT(trialType==2*(speedAccCondition==0)));
    meanAdvisorRTReg = mean(advisorRT(trialType==1*(speedAccCondition==0)));
    meanAdvisor1SwayReg = abs(mean(abs(cj1(whichAdvisor==1&trialType==2&speedAccCondition==0)))-mean(abs(nonzeros(cj2(whichAdvisor==1&trialType==2&speedAccCondition==0)))));
    meanAdvisor2SwayReg = abs(mean(abs(cj1(whichAdvisor==2&trialType==2&speedAccCondition==0)))-mean(abs(nonzeros(cj2(whichAdvisor==2&trialType==2&speedAccCondition==0)))));
    algor1AgreedReg = sum(whichAdvisor==1&trialType==2&cor2==algorCorrect1&speedAccCondition==0)/sum(whichAdvisor==1&trialType==2&speedAccCondition==0);
    algor2AgreedReg = sum(whichAdvisor==2&trialType==2&cor2==algorCorrect2&speedAccCondition==0)/sum(whichAdvisor==2&trialType==2&speedAccCondition==0);

    meanCj1Speed = mean(cj1(speedAccCondition==1));
    meanCj2Speed = mean(nonzeros(cj2(trialType==2*(speedAccCondition==1))));
    algor1ChosenSpeed = sum(whichAdvisor==1*(trialType==1*(speedAccCondition==1)))/sum(trialType==1*(speedAccCondition==1));
    correctFirstSpeed = sum(cor1==1&speedAccCondition==1)/sum(speedAccCondition==1);
    meanDotRTSpeed = mean(dotRT(trialType==2*(speedAccCondition==1)));
    meanAdvisorRTSpeed = mean(advisorRT(trialType==1*(speedAccCondition==1)));
    meanAdvisor1SwaySpeed = abs(mean(abs(cj1(whichAdvisor==1&trialType==2&speedAccCondition==1)))-mean(abs(nonzeros(cj2(whichAdvisor==1&trialType==2&speedAccCondition==1)))));
    meanAdvisor2SwaySpeed = abs(mean(abs(cj1(whichAdvisor==2&trialType==2&speedAccCondition==1)))-mean(abs(nonzeros(cj2(whichAdvisor==2&trialType==2&speedAccCondition==1)))));
    algor1AgreedSpeed = sum(whichAdvisor==1&trialType==2&cor2==algorCorrect1&speedAccCondition==1)/sum(whichAdvisor==1&trialType==2&speedAccCondition==1);
    algor2AgreedSpeed = sum(whichAdvisor==2&trialType==2&cor2==algorCorrect2&speedAccCondition==1)/sum(whichAdvisor==2&trialType==2&speedAccCondition==1);

    meanCj1Accuracy = mean(cj1(speedAccCondition==2));
    meanCj2Accuracy = mean(nonzeros(cj2(trialType==2*(speedAccCondition==2))));
    algor1ChosenAccuracy = sum(whichAdvisor==1*(trialType==1*(speedAccCondition==2)))/sum(trialType==1*(speedAccCondition==2));
    correctFirstAccuracy = sum(cor1==1&speedAccCondition==2)/sum(speedAccCondition==2);
    meanDotRTAccuracy = mean(dotRT(trialType==2*(speedAccCondition==2)));
    meanAdvisorRTAccuracy = mean(advisorRT(trialType==1*(speedAccCondition==2)));
    meanAdvisor1SwayAccuracy = abs(mean(abs(cj1(whichAdvisor==1&trialType==2&speedAccCondition==2)))-mean(abs(nonzeros(cj2(whichAdvisor==1&trialType==2&speedAccCondition==2)))));
    meanAdvisor2SwayAccuracy = abs(mean(abs(cj1(whichAdvisor==2&trialType==2&speedAccCondition==2)))-mean(abs(nonzeros(cj2(whichAdvisor==2&trialType==2&speedAccCondition==2)))));
    algor1AgreedAccuracy = sum(whichAdvisor==1&trialType==2&cor2==algorCorrect1&speedAccCondition==2)/sum(whichAdvisor==1&trialType==2&speedAccCondition==2);
    algor2AgreedAccuracy = sum(whichAdvisor==2&trialType==2&cor2==algorCorrect2&speedAccCondition==2)/sum(whichAdvisor==2&trialType==2&speedAccCondition==2);
    
    woaReg = abs(nanmean(cj2(whichAdvisor==1&trialType==2&speedAccCondition==0)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==0)))/abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==0)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==0)));
    woaSpeed = abs(nanmean(cj2(whichAdvisor==1&trialType==2&speedAccCondition==1)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==1)))/abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==1)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==1)));
    woaAccuracy = abs(nanmean(cj2(whichAdvisor==1&trialType==2&speedAccCondition==2)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==2)))/abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==2)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==2)));
    
    woeReg = abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==0)) - mean(cj2(whichAdvisor==1&trialType==2&speedAccCondition==0))) / abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==0)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==0)));
    woeSpeed = abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==1)) - mean(cj2(whichAdvisor==1&trialType==2&speedAccCondition==1))) / abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==1)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==1)));
    woeAccuracy = abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==2)) - mean(cj2(whichAdvisor==1&trialType==2&speedAccCondition==2))) / abs(mean(algor1Confidence(whichAdvisor==1&trialType==2&speedAccCondition==2)) - mean(cj1(whichAdvisor==1&trialType==2&speedAccCondition==2)));
    
    meanCj1WhenWrongReg = mean(cj1(speedAccCondition==0&cor1==0));
    meanCj1WhenCorrectReg = mean(cj1(speedAccCondition==0&cor1==1));
    meanCj1WhenWrongSpeed = mean(cj1(speedAccCondition==1&cor1==0));
    meanCj1WhenCorrectSpeed = mean(cj1(speedAccCondition==1&cor1==1));
    meanCj1WhenWrongAccuracy = mean(cj1(speedAccCondition==2&cor1==0));
    meanCj1WhenCorrectAccuracy = mean(cj1(speedAccCondition==2&cor1==1));
    
    resolutionReg = abs(meanCj1WhenWrongReg - meanCj1WhenCorrectReg);
    resolutionSpeed = abs(meanCj1WhenWrongSpeed - meanCj1WhenCorrectSpeed);
    resolutionAccuracy = abs(meanCj1WhenWrongAccuracy - meanCj1WhenCorrectAccuracy);
    
    meanCj2WhenWrongReg = mean(cj2(speedAccCondition==0&cor2==0));
    meanCj2WhenCorrectReg = mean(cj2(speedAccCondition==0&cor2==1));
    meanCj2WhenWrongSpeed = mean(cj2(speedAccCondition==1&cor2==0));
    meanCj2WhenCorrectSpeed = mean(cj2(speedAccCondition==1&cor2==1));
    meanCj2WhenWrongAccuracy = mean(cj2(speedAccCondition==2&cor2==0));
    meanCj2WhenCorrectAccuracy = mean(cj2(speedAccCondition==2&cor2==1));
    
    resolution2Reg = abs(meanCj2WhenWrongReg - meanCj2WhenCorrectReg);
    resolution2Speed = abs(meanCj2WhenWrongSpeed - meanCj2WhenCorrectSpeed);
    resolution2Accuracy = abs(meanCj2WhenWrongAccuracy - meanCj2WhenCorrectAccuracy);
    
    flipReg = sum(int1~=int2&speedAccCondition==0)/sum(speedAccCondition==0);
    flipSpeed = sum(int1~=int2&speedAccCondition==1)/sum(speedAccCondition==1);
    flipAccuracy = sum(int1~=int2&speedAccCondition==2)/sum(speedAccCondition==2);
    
    cjDiffReg = mean(cj2Orig(speedAccCondition==0)) - mean(cj1Orig(speedAccCondition==0));
    cjDiffSpeed =  mean(cj2Orig(speedAccCondition==1)) - mean(cj1Orig(speedAccCondition==1));
    cjDiffAccuracy = mean(cj2Orig(speedAccCondition==2)) - mean(cj1Orig(speedAccCondition==2));
    
    % Flipped values for confidence difference
    cj2flip = [trials(151:510).cj2].';
    elementsToChange = (int1 == 1);
    cj2flip(elementsToChange) = -cj2flip(elementsToChange);
    flippedConfDiff = (cj2flip - cj1abs);
    
    algor1AdvisorSameAnswer = (whichAdvisor==1*(trialType==2*(int1 == algor1AdvisorAnswer)));
    algor1AdvisorDiffAnswer = (whichAdvisor==1*(trialType==2*(int1 ~= algor1AdvisorAnswer)));
    algor2AdvisorSameAnswer = (whichAdvisor==2*(trialType==2*(int1 == algor2AdvisorAnswer)));
    algor2AdvisorDiffAnswer = (whichAdvisor==2*(trialType==2*(int1 ~= algor2AdvisorAnswer)));
    
    meanAlgor1AgreeConfDiff = mean(flippedConfDiff(algor1AdvisorSameAnswer==1));
    meanAlgor1DisagreeConfDiff = mean(flippedConfDiff(algor1AdvisorDiffAnswer==1));
    meanAlgor2AgreeConfDiff = mean(flippedConfDiff(algor2AdvisorSameAnswer==1));
    meanAlgor2DisagreeConfDiff = mean(flippedConfDiff(algor2AdvisorDiffAnswer==1));
    
    algor2Influence = ((meanAlgor2AgreeConfDiff-meanAlgor2DisagreeConfDiff)-(meanAlgor1AgreeConfDiff-meanAlgor1DisagreeConfDiff));
    
    advLocationChosenReg = sum(whichAdvisorLocation==0&speedAccCondition==0&trialType==1)/sum(speedAccCondition==0&trialType==1);
    advLocationChosenSpeed = sum(whichAdvisorLocation==0&speedAccCondition==1&trialType==1)/sum(speedAccCondition==1&trialType==1);
    advLocationChosenAccuracy = sum(whichAdvisorLocation==0&speedAccCondition==2&trialType==1)/sum(speedAccCondition==2&trialType==1);
    

    obsAccDiffBlk5 = (sum(algorCorrect2(whichAdvisor==2))/sum(whichAdvisor==2)) - (sum(algorCorrect1(whichAdvisor==1))/sum(whichAdvisor==1));
    algor1ChoiceBlk6 = sum(whichAdvisor==1*(trialType==1*(block==6)))/sum(trialType==1*(block==6));
    
    %% Manipulation of Need for Closure/Cognition Scale scores
    
    cogReverses = [3 4 5 7 8 9 12 16 17];
    closReverses = [2 5 7 12 13 16 19 20 23 25 28 29 36 40 41 47];
    
    resp = zeros(1,length(settings.questionAnsNFCognition));
    resp2 = zeros(1,length(settings.questionAnsNFClosure));
    
    for i = 1:length(settings.questionAnsNFCognition)
        if ismember(i,cogReverses) == 1
            resp(i) = 6 - settings.questionAnsNFCognition(i);
        else
            resp(i) = settings.questionAnsNFCognition(i);
        end
    end
    
    for i = 1:length(settings.questionAnsNFClosure)
        if ismember(i,closReverses) == 1
            resp2(i) = 7 - settings.questionAnsNFClosure(i);
        else
            resp2(i) = settings.questionAnsNFClosure(i);
        end
    end
            
    settings.questionAnsNFCognitionReversed = resp;
    settings.questionAnsNFClosureReversed = resp2;
    
    % lieScoreClos = [18 22 39 43 46];
    lieScoreClos = resp2(18) + resp2(22) + resp2(39) + resp2(43) + resp2(46);
    
    if lieScoreClos > 15
        settings.NFClosureLie = true;
    else
        settings.NFClosureLie = false;
        needForClosureScore = sum(settings.questionAnsNFClosureReversed) - lieScoreClos;
    end
    
    orderSubscale = [1 6 11 20 24 28 34 35 37 47];
    predictSubscale = [5 7 8 19 26 27 30 45];
    decisiveSubscale = [12 13 14 16 17 23 40];
    ambigSubscale = [3 9 15 21 31 32 33 38 42];
    closedSubscale = [2 4 10 25 29 36 41 44];
    
    orderScore = subscale(orderSubscale,settings.questionAnsNFClosureReversed,0);
    predictScore = subscale(predictSubscale,settings.questionAnsNFClosureReversed,0);
    decisiveScore = subscale(decisiveSubscale,settings.questionAnsNFClosureReversed,0);
    ambigScore = subscale(ambigSubscale,settings.questionAnsNFClosureReversed,0);
    
    closedScore = subscale(closedSubscale,settings.questionAnsNFClosureReversed,0);
    
    if settings.condition == 1
        algor1TrustQ = settings.questionAnsOriginal(1) + settings.questionAnsOriginal(2) + settings.questionAnsOriginal(3) + settings.questionAnsOriginal(4);
        algor2TrustQ = settings.questionAnsOriginal(5) + settings.questionAnsOriginal(6) + settings.questionAnsOriginal(7) + settings.questionAnsOriginal(8);
    else
        algor2TrustQ = settings.questionAnsOriginal(1) + settings.questionAnsOriginal(2) + settings.questionAnsOriginal(3) + settings.questionAnsOriginal(4);
        algor1TrustQ = settings.questionAnsOriginal(5) + settings.questionAnsOriginal(6) + settings.questionAnsOriginal(7) + settings.questionAnsOriginal(8);
    end
    
    
    %% Behavioural Categories (Experimental)
    
    if (algor1ChosenReg <= 0.25)
        data6(s).category = 2;
    elseif (algor1ChosenReg >= 0.75)
        data6(s).category = 1;
    else
        data6(s).category = 3;
    end
    
    %% Ordering Effects 
    
    % 1 is speed for blocks 7-8, acc for 9-10
    if settings.SCACCondition == 1
        data6(s).speedAccCon = 1;
        speedBlockRT = (speedAccTable(1).currentBlockSpeed + speedAccTable(2).currentBlockSpeed)/2;
        speedBlockCor = (speedAccTable(1).currentBlockAcc + speedAccTable(2).currentBlockAcc)/2;
        accBlockRT = (speedAccTable(3).currentBlockSpeed + speedAccTable(4).currentBlockSpeed)/2;
        accBlockCor = (speedAccTable(4).currentBlockAcc + speedAccTable(4).currentBlockAcc)/2;
    else
        data6(s).speedAccCon = 2;
        accBlockRT = (speedAccTable(1).currentBlockSpeed + speedAccTable(2).currentBlockSpeed)/2;
        accBlockCor = (speedAccTable(1).currentBlockAcc + speedAccTable(2).currentBlockAcc)/2;
        speedBlockRT = (speedAccTable(3).currentBlockSpeed + speedAccTable(4).currentBlockSpeed)/2;
        speedBlockCor = (speedAccTable(4).currentBlockAcc + speedAccTable(4).currentBlockAcc)/2;
    end
    
    data6(s).accBlockRT = accBlockRT;
    data6(s).accBlockCor = accBlockCor;
    data6(s).speedBlockRT = speedBlockRT;
    data6(s).speedBlockCor = speedBlockCor;
    
    %% Loading Data to Table
    
    
     data6(s).quantAdvisor1 = quantAdvisor1;
     data6(s).quantAdvisor2 = quantAdvisor2;
     data6(s).quantAdvisor3 = quantAdvisor3;
     data6(s).quantAdvisor4 = quantAdvisor4;
     data6(s).quantCorrect1 = quantCorrect1;
     data6(s).quantCorrect2 = quantCorrect2;
     data6(s).quantCorrect3 = quantCorrect3;
     data6(s).quantCorrect4 = quantCorrect4;
    
     data6(s).meanCj1Reg = abs(meanCj1Reg);
     data6(s).meanCj2Reg = abs(meanCj2Reg);
     data6(s).algor1ChosenReg = algor1ChosenReg;
     data6(s).algor2ChosenReg = 1 - algor1ChosenReg;
     data6(s).correctFirstReg = correctFirstReg;
     data6(s).meanDotRTReg = meanDotRTReg;
     data6(s).meanAdvisorRTReg = meanAdvisorRTReg;

     data6(s).meanCj1Speed = abs(meanCj1Speed);
     data6(s).meanCj2Speed = abs(meanCj2Speed);
     data6(s).algor1ChosenSpeed = algor1ChosenSpeed;
     data6(s).algor2ChosenSpeed = 1 - algor1ChosenSpeed;
     data6(s).correctFirstSpeed = correctFirstSpeed;
     data6(s).meanDotRTSpeed = meanDotRTSpeed;
     data6(s).meanAdvisorRTSpeed = meanAdvisorRTSpeed;

     data6(s).meanCj1Accuracy = abs(meanCj1Accuracy);
     data6(s).meanCj2Accuracy = abs(meanCj2Accuracy);
     data6(s).algor1ChosenAccuracy = algor1ChosenAccuracy;
     data6(s).algor2ChosenAccuracy = 1 - algor1ChosenAccuracy;
     data6(s).correctFirstAccuracy = correctFirstAccuracy;
     data6(s).meanDotRTAccuracy = meanDotRTAccuracy;
     data6(s).meanAdvisorRTAccuracy = meanAdvisorRTAccuracy;
    
     data6(s).meanAdvisor1SwayReg = meanAdvisor1SwayReg;
     data6(s).meanAdvisor2SwayReg = meanAdvisor2SwayReg;
     data6(s).meanAdvisor1SwaySpeed = meanAdvisor1SwaySpeed;
     data6(s).meanAdvisor2SwaySpeed = meanAdvisor2SwaySpeed;
     data6(s).meanAdvisor1SwayAccuracy = meanAdvisor1SwayAccuracy;
     data6(s).meanAdvisor2SwayAccuracy = meanAdvisor2SwayAccuracy;
     
     data6(s).algor1AgreedReg = algor1AgreedReg;
     data6(s).algor2AgreedReg = algor2AgreedReg;
     data6(s).algor1AgreedSpeed = algor1AgreedSpeed;
     data6(s).algor2AgreedSpeed = algor2AgreedSpeed;
     data6(s).algor1AgreedAccuracy = algor1AgreedAccuracy;
     data6(s).algor2AgreedAccuracy = algor2AgreedAccuracy;
    
     data6(s).orderScore = orderScore;
     data6(s).predictScore = predictScore;
     data6(s).decisiveScore = decisiveScore;
     data6(s).ambigScore = ambigScore;
     data6(s).closedScore = closedScore;
     data6(s).needForClosureLie = settings.NFClosureLie;
     data6(s).needForCogScore = sum(settings.questionAnsNFCognitionReversed);
     data6(s).needForClosureScore = needForClosureScore;
          
     data6(s).resolutionReg = resolutionReg;
     data6(s).resolutionSpeed = resolutionSpeed;
     data6(s).resolutionAccuracy = resolutionAccuracy;
 
     data6(s).resolution2Reg = resolution2Reg;
     data6(s).resolution2Speed = resolution2Speed;
     data6(s).resolution2Accuracy = resolution2Accuracy;
     
     data6(s).flipReg = flipReg;
     data6(s).flipSpeed = flipSpeed;
     data6(s).flipAccuracy = flipAccuracy;
     
     data6(s).cjDiffReg = cjDiffReg;
     data6(s).cjDiffSpeed = cjDiffSpeed;
     data6(s).cjDiffAccuracy = cjDiffAccuracy;
     
     data6(s).advLocationChosenReg = advLocationChosenReg;
     data6(s).advLocationChosenSpeed = advLocationChosenSpeed;
     data6(s).advLocationChosenAccuracy = advLocationChosenAccuracy;
     
     data6(s).block4Algor1ObsAcc = sum(block4WhichAdvisor==1&block4Algor1Correct==1)/30;
     data6(s).block4Algor2ObsAcc = sum(block4WhichAdvisor==2&block4Algor2Correct==1)/30;
     
     data6(s).quantCj1 = quantCj1;
     data6(s).quantCj2 = quantCj2;
     data6(s).quantCj3 = quantCj3;
     data6(s).quantCj4 = quantCj4;
     
     data6(s).meanCj1WhenWrongReg = meanCj1WhenWrongReg;
     data6(s).meanCj1WhenCorrectReg = meanCj1WhenCorrectReg;
     data6(s).meanCj1WhenWrongSpeed = meanCj1WhenWrongSpeed;
     data6(s).meanCj1WhenCorrectSpeed = meanCj1WhenCorrectSpeed;
     data6(s).meanCj1WhenWrongAccuracy = meanCj1WhenWrongAccuracy;
     data6(s).meanCj1WhenCorrectAccuracy = meanCj1WhenCorrectAccuracy;
     
     data6(s).meanAlgor1AgreeConfDiff = meanAlgor1AgreeConfDiff;
     data6(s).meanAlgor1DisagreeConfDiff = meanAlgor1DisagreeConfDiff;
     data6(s).meanAlgor2AgreeConfDiff = meanAlgor2AgreeConfDiff;
     data6(s).meanAlgor2DisagreeConfDiff  = meanAlgor2DisagreeConfDiff;
     data6(s).algor2Influence = algor2Influence;
     
     data6(s).obsAccDiffBlk5 = obsAccDiffBlk5;
     data6(s).algor1ChoiceBlk6 = algor1ChoiceBlk6;
     
     data6(s).algor1Chosen = algor1Chosen;
     data6(s).algor2Chosen = algor2Chosen;
     
     data6(s).preferenceStrength = abs(algor1Chosen-0.5)*100;
     data6(s).preferenceStrengthReg = abs(algor1ChosenReg-0.5)*100;
     data6(s).preferenceStrengthSpeed = abs(algor1ChosenSpeed-0.5)*100;
     data6(s).preferenceStrengthAccuracy = abs(algor1ChosenAccuracy-0.5)*100;
     
     data6(s).algor2ChoiceWhenAlgor1Wrong = algor2ChoiceWhenAlgor1Wrong;
    data6(s).algor2ChoiceWhenAlgor1Correct = algor2ChoiceWhenAlgor1Correct;
    data6(s).algor2ChoiceWhenAlgor2Wrong = algor2ChoiceWhenAlgor2Wrong;
    data6(s).algor2ChoiceWhenAlgor2Correct = algor2ChoiceWhenAlgor2Correct;
    
    data6(s).advisorStayWhenAlgor1Wrong = advisorStayWhenAlgor1Wrong;
    data6(s).advisorStayWhenAlgor1Correct = advisorStayWhenAlgor1Correct;
    data6(s).advisorStayWhenAlgor2Wrong = advisorStayWhenAlgor2Wrong;
    data6(s).advisorStayWhenAlgor2Correct = advisorStayWhenAlgor2Correct;
    
    data6(s).adv1CorrectForced = adv1CorrectForced;
    data6(s).adv1CorrectReg = adv1CorrectReg;
    data6(s).adv1CorrectAll = adv1CorrectAll;

    data6(s).adv2CorrectForced = adv2CorrectForced;
    data6(s).adv2CorrectReg = adv2CorrectReg;
    data6(s).adv2CorrectAll = adv2CorrectAll;
    
    data6(s).algor1TrustQ = algor1TrustQ;
    data6(s).algor2TrustQ = algor2TrustQ;
   
     
     %% Add the fields from the SpeedAccTable to the data structure
     
     data6(s).speThreshold = speedAccTable(1).speThreshold;
     data6(s).accThreshold = speedAccTable(1).accThreshold;
     data6(s).numOfTimeRunouts = sum([speedAccTable(1:4).numOfTimeRunouts]);
     data6(s).reward = sum([speedAccTable(1:4).reward]);
     
     data6(s).ctcReg = (speedAccTable(1).block5Speed + speedAccTable(1).block6Speed)/2;
     data6(s).correctReg = (speedAccTable(1).block5Accuracy + speedAccTable(1).block6Accuracy)/2;
     if (isempty(speedAccTable(1).accDiff) == 0)
         data6(s).correctAccuracy = (speedAccTable(1).currentBlockAcc + speedAccTable(2).currentBlockAcc)/2;
         data6(s).correctSpeed = (speedAccTable(3).currentBlockAcc + speedAccTable(4).currentBlockAcc)/2;
         data6(s).ctcAccuracy = (speedAccTable(1).currentBlockSpeed + speedAccTable(2).currentBlockSpeed)/2;
         data6(s).ctcSpeed = (speedAccTable(3).currentBlockSpeed + speedAccTable(4).currentBlockSpeed)/2;
     else
         data6(s).correctAccuracy = (speedAccTable(3).currentBlockAcc + speedAccTable(4).currentBlockAcc)/2;
         data6(s).correctSpeed = (speedAccTable(1).currentBlockAcc + speedAccTable(2).currentBlockAcc)/2;
         data6(s).ctcAccuracy = (speedAccTable(3).currentBlockSpeed + speedAccTable(4).currentBlockSpeed)/2;
         data6(s).ctcSpeed = (speedAccTable(1).currentBlockSpeed + speedAccTable(2).currentBlockSpeed)/2;
     end
 
end

     %% Mean Field Calculations
     
    meanAdvisor1Q1 = nanmean([data6.quantAdvisor1]);
    meanAdvisor1Q2 = nanmean([data6.quantAdvisor2]);
    meanAdvisor1Q3 = nanmean([data6.quantAdvisor3]);
    meanAdvisor1Q4 = nanmean([data6.quantAdvisor4]);
    meanCorrectQ1 = nanmean([data6.quantCorrect1]);
    meanCorrectQ2 = nanmean([data6.quantCorrect2]);
    meanCorrectQ3 = nanmean([data6.quantCorrect3]);
    meanCorrectQ4 = nanmean([data6.quantCorrect4]);

    meanCj1Reg = mean([data6.meanCj1Reg]);
    meanCj2Reg = mean([data6.meanCj2Reg]);
    algor1ChosenReg = mean([data6.algor1ChosenReg]);
    correctFirstReg = mean([data6.correctFirstReg]);
    meanDotRTReg = mean([data6.meanDotRTReg]);
    meanAdvisorRTReg = mean([data6.meanAdvisorRTReg]);

    meanCj1Speed = mean([data6.meanCj1Speed]);
    meanCj2Speed = mean([data6.meanCj2Speed]);
    algor1ChosenSpeed = mean([data6.algor1ChosenSpeed]);
    correctFirstSpeed = mean([data6.correctFirstSpeed]);
    meanDotRTSpeed = mean([data6.meanDotRTSpeed]);
    meanAdvisorRTSpeed = mean([data6.meanAdvisorRTSpeed]);

    meanCj1Accuracy = mean([data6.meanCj1Accuracy]);
    meanCj2Accuracy = mean([data6.meanCj2Accuracy]);
    algor1ChosenAccuracy = mean([data6.algor1ChosenAccuracy]);
    correctFirstAccuracy = mean([data6.correctFirstAccuracy]);
    meanDotRTAccuracy = mean([data6.meanDotRTAccuracy]);
    meanAdvisorRTAccuracy = mean([data6.meanAdvisorRTAccuracy]);

    meanAdvisor1SwayReg = mean([data6.meanAdvisor1SwayReg]);
    meanAdvisor2SwayReg = mean([data6.meanAdvisor2SwayReg]);
    meanAdvisor1SwaySpeed = mean([data6.meanAdvisor1SwaySpeed]);
    meanAdvisor2SwaySpeed = mean([data6.meanAdvisor2SwaySpeed]);
    meanAdvisor1SwayAccuracy = mean([data6.meanAdvisor1SwayAccuracy]);
    meanAdvisor2SwayAccuracy = mean([data6.meanAdvisor2SwayAccuracy]);
    
    algor1AgreedReg = mean([data6.algor1AgreedReg]);
    algor2AgreedReg = mean([data6.algor2AgreedReg]);
    algor1AgreedSpeed = mean([data6.algor1AgreedSpeed]);
    algor2AgreedSpeed = mean([data6.algor2AgreedSpeed]);
    algor1AgreedAccuracy = mean([data6.algor1AgreedAccuracy]);
    algor2AgreedAccuracy = mean([data6.algor2AgreedAccuracy]);
    
    flipReg = mean([data6.flipReg]);
    flipSpeed = mean([data6.flipSpeed]);
    flipAccuracy = mean([data6.flipAccuracy]);
     
    cjDiffReg = mean([data6.cjDiffReg]);
    cjDiffSpeed = mean([data6.cjDiffSpeed]);
    cjDiffAccuracy = mean([data6.cjDiffAccuracy]);
    
    meanCjQ1 = nanmean([data6.quantCj1]);
    meanCjQ2 = nanmean([data6.quantCj2]);
    meanCjQ3 = nanmean([data6.quantCj3]);
    meanCjQ4 = nanmean([data6.quantCj4]);
    
    advLocationChosenReg = mean([data6.advLocationChosenReg]);
    advLocationChosenSpeed = mean([data6.advLocationChosenSpeed]);
    advLocationChosenAccuracy = mean([data6.advLocationChosenAccuracy]);
    
    category = [data6.category];
    correctReg = [data6.correctReg];
    cj1Reg = [data6.meanCj1Reg];
    algor1ChosenReg = [data6.algor1ChosenReg];
    resolutionReg = [data6.resolutionReg];
    needForCogScore = [data6.needForCogScore];
    needForClosureScore = [data6.needForClosureScore];
    
    obsAccDiffBlk5 = [data6.obsAccDiffBlk5];
    algor1ChoiceBlk6 = [data6.algor1ChoiceBlk6];
     
    
    category1Correct = nanmean(correctReg(category==1));
    category2Correct = nanmean(correctReg(category==2));
    category3Correct = nanmean(correctReg(category==3));
    
    category1Cj1 = mean(cj1Reg(category==1));
    category2Cj1 = mean(cj1Reg(category==2));
    category3Cj1 = mean(cj1Reg(category==3));
    
    %Create quantiles based on algor1 choice in blocks 5-6
    quarts = quantile(algor1ChosenReg,[0.25,0.5,0.75]);
    quantAlgor1Choice1Cj = mean(cj1Reg(algor1ChosenReg<=quarts(1)));
    quantAlgor1Choice2Cj = mean(cj1Reg(algor1ChosenReg>quarts(1)&algor1ChosenReg<=quarts(2)));
    quantAlgor1Choice3Cj = mean(cj1Reg(algor1ChosenReg>quarts(2)&algor1ChosenReg<=quarts(3)));
    quantAlgor1Choice4Cj = mean(cj1Reg(algor1ChosenReg>quarts(3)));
    
    quantAlgor1Choice1Correct = mean(correctReg(algor1ChosenReg<=quarts(1)));
    quantAlgor1Choice2Correct = mean(correctReg(algor1ChosenReg>quarts(1)&algor1ChosenReg<=quarts(2)));
    quantAlgor1Choice3Correct = mean(correctReg(algor1ChosenReg>quarts(2)&algor1ChosenReg<=quarts(3)));
    quantAlgor1Choice4Correct = mean(correctReg(algor1ChosenReg>quarts(3)));
    
    quantAlgor1Choice1Res = mean(resolutionReg(algor1ChosenReg<=quarts(1)));
    quantAlgor1Choice2Res = mean(resolutionReg(algor1ChosenReg>quarts(1)&algor1ChosenReg<=quarts(2)));
    quantAlgor1Choice3Res = mean(resolutionReg(algor1ChosenReg>quarts(2)&algor1ChosenReg<=quarts(3)));
    quantAlgor1Choice4Res = mean(resolutionReg(algor1ChosenReg>quarts(3)));
    
    quantAlgor1Choice1Cog = mean(needForCogScore(algor1ChosenReg<=quarts(1)));
    quantAlgor1Choice2Cog = mean(needForCogScore(algor1ChosenReg>quarts(1)&algor1ChosenReg<=quarts(2)));
    quantAlgor1Choice3Cog = mean(needForCogScore(algor1ChosenReg>quarts(2)&algor1ChosenReg<=quarts(3)));
    quantAlgor1Choice4Cog = mean(needForCogScore(algor1ChosenReg>quarts(3)));
    
    quantAlgor1Choice1Clo = mean(needForClosureScore(algor1ChosenReg<=quarts(1)));
    quantAlgor1Choice2Clo = mean(needForClosureScore(algor1ChosenReg>quarts(1)&algor1ChosenReg<=quarts(2)));
    quantAlgor1Choice3Clo = mean(needForClosureScore(algor1ChosenReg>quarts(2)&algor1ChosenReg<=quarts(3)));
    quantAlgor1Choice4Clo = mean(needForClosureScore(algor1ChosenReg>quarts(3)));
    
    accBlockRT = [data6.accBlockRT].';
    accBlockCor = [data6.accBlockCor].';
    speedBlockRT = [data6.speedBlockRT].';
    speedBlockCor = [data6.speedBlockCor].';
    speedAccCon = [data6.speedAccCon].';
    
    cond1Speed = [mean(speedBlockRT(speedAccCon==1)), mean(accBlockRT(speedAccCon==1))];
    cond1Acc = [mean(speedBlockCor(speedAccCon==1)), mean(accBlockCor(speedAccCon==1))];
    cond2Speed = [mean(accBlockRT(speedAccCon==2)), mean(speedBlockRT(speedAccCon==2))];
    cond2Acc = [mean(accBlockCor(speedAccCon==2)), mean(speedBlockCor(speedAccCon==2))];
    
    %% Figure Plotting
    
%     figure(1)
%     bar([nanmean([data6.algor1ChosenReg]) 1-(nanmean([data6.algor1ChosenReg]))]);
%     title('Choice of Algorithm');
%     
%     figure(2)
%     bar([nanmean([data6.algor1ChosenReg]); nanmean([data6.algor1ChosenSpeed]); nanmean([data6.algor1ChosenAccuracy])]);
%     title('Choice of Algorithm 1 in Regular, Speed and Accuracy Blocks');
%     
%     figure(3)
%     bar([nanmean([data6.meanCj2Reg]); nanmean([data6.meanCj2Speed]); nanmean([data6.meanCj2Accuracy]);]);
%     title('Cj2 Under Regular, Speed and Accuracy Conditions');
%     
%     figure(4)
%     bar([nanmean([data6.resolution2Reg]); nanmean([data6.resolution2Speed]); nanmean([data6.resolution2Accuracy])]);
%     title('Resolution Under Regular, Speed and Accuracy Conditions');
%     
%     figure(5)
%     bar([nanmean([data6.flipReg]); nanmean([data6.flipSpeed]); nanmean([data6.flipAccuracy])]);
%     title('Proportion of Flipped Judgements Under Regular, Speed and Accuracy Conditions');
%     
%     figure(6)
%     bar([nanmean([data6.cjDiffReg]); nanmean([data6.cjDiffSpeed]); nanmean([data6.cjDiffAccuracy])]);
%     title('Confidence Difference Under Regular, Speed and Accuracy Conditions');
%     
%     figure(7)
%     bar([data6.advLocationChosenReg; data6.advLocationChosenSpeed; data6.advLocationChosenAccuracy]);
%     title('Box Location Choice Under Regular, Speed and Accuracy Conditions');
%     
%     figure(8)
%     bar([nanmean([data6.ctcReg]); nanmean([data6.ctcSpeed]); nanmean([data6.ctcAccuracy])]);
%     title('CTC Time under Regular, Speed and Accuracy Blocks');
%     
%     figure(9)
%     bar([nanmean([data6.correctReg]); nanmean([data6.correctSpeed]); nanmean([data6.correctAccuracy])]);
%     title('Accuracy under Regular, Speed and Accuracy Blocks');
% 
% figure(10)
% freqDis([data6.algor1ChosenReg],0.1);
% title('Choice of Algor 1');
% 
% figure(11)
% bar([quantAlgor1Choice1Cj; quantAlgor1Choice2Cj; quantAlgor1Choice3Cj; quantAlgor1Choice4Cj]);
% title('Algor1Choice Quantiles Cj1');
% 
% figure(12)
% bar([quantAlgor1Choice1Correct; quantAlgor1Choice2Correct; quantAlgor1Choice3Correct; quantAlgor1Choice4Correct]);
% title('Algor1Choice Quantiles Accuracy');
% 
% figure(13)
% bar([quantAlgor1Choice1Res; quantAlgor1Choice2Res; quantAlgor1Choice3Res; quantAlgor1Choice4Res]);
% title('Algor1Choice Quantiles Resolution');
% 
% figure(14)
% bar([quantAlgor1Choice1Cog; quantAlgor1Choice2Cog; quantAlgor1Choice3Cog; quantAlgor1Choice4Cog]);
% title('Algor1Choice Quantiles Cognition');
% 
% figure(15)
% bar([quantAlgor1Choice1Clo; quantAlgor1Choice2Clo; quantAlgor1Choice3Clo; quantAlgor1Choice4Clo]);
% title('Algor1Choice Quantiles Closure');
% 
% figure(16)
% bar([meanCjQ1 meanCjQ2 meanCjQ3 meanCjQ4 meanCjQ5],'black');
% title('Proportion within Quintiles of Initial Confidence Across Forced Trials');
% 
% figure(17)
% bar([cond1Speed; cond2Speed])
% title('Ordering Effects of Speed and Accuracy Blocks on Response Time')
% set(gca,'xticklabel',{'Condition 1: Speed -> Acc', 'Condition 2: Acc -> Speed'})
% 
% figure(18)
% bar([cond1Acc; cond2Acc])
% title('Ordering Effects of Speed and Accuracy Blocks on Correctness')
% set(gca,'xticklabel',{'Condition 1: Speed -> Acc', 'Condition 2: Acc -> Speed'})

% algor1ChosenVec = [data6.algor1ChosenReg].';
% x = algor1ChosenVec;
% y = 1-algor1ChosenVec;
% [h,p] = ttest(x,y);

% figure(19)
% scatter(obsAccDiffBlk5,algor1ChoiceBlk6,'filled')
% title('Observed Block 5 Accuracy against Algor 1 Choice in Block 6')