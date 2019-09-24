%% Anova Code (author: Raj Aiyer)
% This code is for initial exploration of participant data from EYORD
% Studies 2a, 2b and 2c
% Using only blocks 5-6 data from each, because the experiments are
% functionally the same in these blocks.
% This code looks at comparing different combinations for correlation out of 
% confidence judgements (pre/post advice), objective accuracy and choice of
% advisor, with speed and accuracy blocks added.

%% Data Load
% Load all the participant data.
% Filepaths are taken from the current working directory of the code,
% so this code should work no matter what computer and where you put the
% code folder.

paths = {'./rawdata/401/behaviour/73720142520_401_final.mat'...
    './rawdata/402/behaviour/73720150608_402_final.mat'...
    './rawdata/403/behaviour/73720152564_403_final.mat'...
    './rawdata/404/behaviour/73720155850_404_final.mat'...
    './rawdata/405/behaviour/73720156669_405_final.mat'...
    './rawdata/406/behaviour/73720159049_406_final.mat'...
    './rawdata/407/behaviour/73720161028_407_final.mat'...
    './rawdata/408/behaviour/73720162961_408_final.mat'...
    './rawdata/409/behaviour/73720164954_409_final.mat'...
    './rawdata/410/behaviour/73720167109_410_final.mat'...
    './rawdata/411/behaviour/73720169470_411_final.mat'...
    './rawdata/412/behaviour/73720171945_412_final.mat'...
    './rawdata/413/behaviour/73720173437_413_final.mat'...
    './rawdata/414/behaviour/73720175732_414_final.mat'...
    './rawdata/415/behaviour/73720176928_415_final.mat'...
    './rawdata/416/behaviour/73720179851_416_final.mat'...
    './rawdata/417/behaviour/73720182141_417_final.mat'...
    './rawdata/418/behaviour/73720344402_418_final.mat'...
    './rawdata/419/behaviour/73720355214_419_final.mat'...
    './rawdata/420/behaviour/73720356392_420_final.mat'...
    './rawdata/421/behaviour/73720360968_421_final.mat'...
    './rawdata/422/behaviour/73720450617_422_final.mat'...
    './rawdata/423/behaviour/73720455190_423_final.mat'...
    './rawdata/424/behaviour/73720459626_424_final.mat'...
    './rawdata/425/behaviour/73720464763_425_final.mat'...
    './rawdata/426/behaviour/73720468009_426_final.mat'...
    './rawdata/427/behaviour/73720480045_427_final.mat'...
    './rawdata/428/behaviour/73720542103_428_final.mat'...
    './rawdata/429/behaviour/73720548914_429_final.mat'...
    './rawdata/430/behaviour/73720550857_430_final.mat'...
    './rawdata/431/behaviour/73720553417_431_final.mat'...
    './rawdata/432/behaviour/73720555135_432_final.mat'...
    './rawdata/433/behaviour/73720559083_433_final.mat'...
    './rawdata/434/behaviour/73720562285_434_final.mat'...
    './rawdata/435/behaviour/73720657092_435_final.mat'...
    './rawdata/436/behaviour/73720659063_436_final.mat'...
    './rawdata/437/behaviour/73720661163_437_final.mat'...
    './rawdata/438/behaviour/73720663116_438_final.mat'...
    './rawdata/439/behaviour/73721162670_439_final.mat'...
    './rawdata/440/behaviour/73721247059_440_final.mat'...
    './rawdata/512/behaviour/73753250356_512_final.mat'...
    './rawdata/513/behaviour/73753250360_513_final.mat'...
    './rawdata/514/behaviour/73753250347_514_final.mat'...
    './rawdata/515/behaviour/73753948511_515_final.mat'...
    './rawdata/516/behaviour/73753948521_516_final.mat'...
    './rawdata/517/behaviour/73753948879_517_final.mat'...
    './rawdata/518/behaviour/73753948516_518_final.mat'...
    './rawdata/519/behaviour/73754059249_519_final.mat'...
    './rawdata/520/behaviour/73754059206_520_final.mat'...
    './rawdata/521/behaviour/73754059216_521_final.mat'...
    './rawdata/522/behaviour/73754465179_522_final.mat'...
    './rawdata/523/behaviour/73754465434_523_final.mat'...
    './rawdata/524/behaviour/73754465186_524_final.mat'...
    './rawdata/525/behaviour/73754465215_525_final.mat'...
    './rawdata/526/behaviour/73754561157_526_final.mat'...
    './rawdata/527/behaviour/73754465187_527_final.mat'...
    './rawdata/528-End-Crash/behaviour/73754561165_528_26.mat'...
    './rawdata/529/behaviour/73754646463_529_final.mat'...
    './rawdata/530/behaviour/73754561168_530_final.mat'...
     './rawdata/532/behaviour/73754561144_532_final.mat'...
     './rawdata/533/behaviour/73754646463_533_final.mat'...
     './rawdata/534/behaviour/73754646485_534_final.mat'...
     './rawdata/535/behaviour/73754647027_535_final.mat'...
     './rawdata/536/behaviour/73754646464_536_final.mat'...
     './rawdata/537/behaviour/73754761350_537_final.mat'...
     './rawdata/539/behaviour/73755848526_539_final.mat'...
     './rawdata/540/behaviour/73755848502_540_final.mat'...
     './rawdata/541/behaviour/73755861584_541_final.mat'...
     './rawdata/542/behaviour/73756257210_542_final.mat'...
     './rawdata/544/behaviour/73755861171_544_final.mat'...
     './rawdata/545/behaviour/73755861157_545_final.mat'...
     './rawdata/546/behaviour/73755861154_546_final.mat'...
     './rawdata/547/behaviour/73756257941_547_final.mat'...
     './rawdata/548/behaviour/73756257568_548_final.mat'...
     './rawdata/549/behaviour/73756560757_549_final.mat'...
     './rawdata/550/behaviour/73756648490_550_final.mat'...
     './rawdata/551/behaviour/73756648517_551_final.mat'...
     './rawdata/552/behaviour/73756649719_552_final.mat'...
     './rawdata/553/behaviour/73756648548_553_final.mat'...
     './rawdata/554/behaviour/73756648501_554_final.mat'...
    './rawdata/604/behaviour/73760048394_604_final.mat'...
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

nparticipants = 120;

ya = 1;
ya2 = 1;
ya3 = 1;
ya4 = 1;
ya5 = 1;

cj1Predictor = [];
dotRTPredictor = [];
algorChoicePredictor = [];

trialNumber = [];

for i = 1:120
    trialNumber(i) = i;
end

trialNumber = trialNumber';

for s = 1:nparticipants
    
   load(paths{s});
   
   %% Block 4 Trials Data Variables
   
    wherelarger = [trials(91:150).wherelarger].';
    cj1 = [trials(91:150).cj1].';
    cj2 = [trials(91:150).cj2].';
    int1 = [trials(91:150).int1].';
    int2 = [trials(91:150).int2].';
    algor1AdvisorAnswer = [trials(91:150).algorithm1Answer].';
    algor2AdvisorAnswer = [trials(91:150).algorithm2Answer].';
    blk4WhichAdvisor = [trials(91:150).whichAdvisor].';
    cor1 = [trials(91:150).cor1].';
    cor2 = [trials(91:150).cor2].';
    algorCorrect1 = [trials(91:150).algorithm1Correct].';
    algorCorrect2 = [trials(91:150).algorithm2Correct].';
    dotRT = [trials(91:150).rt1].'; 
    resp1t = [trials(91:150).resp1_t].';
    resp2t = [trials(91:150).resp2_t].';
    ctcTime = resp2t - resp1t;
    algorConf = [trials(91:150).algorithm1Confidence].';
    
    blk4AdviceSway = [];
    blk4AdviceSway1 = [];
    blk4AdviceSway2 = [];
    blk4AdviceSway1Diff = [];
    blk4AdviceSway2Diff = [];
    count1 = 1;
    count2 = 1;
    for i = 1:60
        blk4AdviceSway(i) = abs(cj2(i) - cj1(i));
        if blk4WhichAdvisor(i) == 1
            blk4AdviceSway1(count1) = abs(cj2(i) - cj1(i));
            count1 = count1 + 1;
        else
            blk4AdviceSway2(count2) = abs(cj2(i) - cj1(i));
            count2 = count2 + 1;
        end      
    end
    
    for j = 2:30
        blk4AdviceSway1Diff(j) = blk4AdviceSway1(j) - blk4AdviceSway1(j-1);
        blk4AdviceSway2Diff(j) = blk4AdviceSway2(j) - blk4AdviceSway2(j-1);
    end
        
    
%     figure(998)
%     plot([blk4AdviceSway1Diff]);
%     hold on;
%     
%     figure(999)
%     plot([blk4AdviceSway2Diff]);
%     hold on;
    
    blk4AdviceSway = blk4AdviceSway';
    
    wherelarger = wherelarger - 1;
    cj1Orig = cj1;
    cj2Orig = cj2;
    cj1 = abs(cj1);
    cj2 = abs(cj2);
    
    meanCj1WhenWrong = mean(cj1(cor1==0));
    meanCj1WhenCorrect = mean(cj1(cor1==1));
    meanCj2WhenWrong = mean(cj2(cor1==0));
    meanCj2WhenCorrect = mean(cj2(cor1==1));
    
    meanCj2WhenWrongAdv1 = mean(cj2(cor1==0&blk4WhichAdvisor==1));
    meanCj2WhenWrongAdv2 = mean(cj2(cor1==0&blk4WhichAdvisor==2));
    meanCj2WhenCorrectAdv1 = mean(cj2(cor1==1&blk4WhichAdvisor==1));
    meanCj2WhenCorrectAdv2 = mean(cj2(cor1==1&blk4WhichAdvisor==2));
    
    resolution = abs(meanCj1WhenWrong - meanCj1WhenCorrect);
    resolution2 = abs(meanCj2WhenWrong - meanCj2WhenCorrect);
    
    resolution2Adv1 = abs(meanCj2WhenWrongAdv1 - meanCj2WhenCorrectAdv1);
    resolution2Adv2 = abs(meanCj2WhenWrongAdv2 - meanCj2WhenCorrectAdv2);
    
    meanAdvisor1Sway = mean(abs(cj2Orig(blk4WhichAdvisor==1)-cj1Orig(blk4WhichAdvisor==1)));
    meanAdvisor2Sway = mean(abs(cj2Orig(blk4WhichAdvisor==2)-cj1Orig(blk4WhichAdvisor==2)));
    
    adv1Conf = abs(algorConf(blk4WhichAdvisor==1));
    adv1Acc = algorCorrect1(blk4WhichAdvisor==1);
    
    adv1CjWhenWrong = mean(adv1Conf(adv1Acc==0));
    adv1CjWhenCorrect = mean(adv1Conf(adv1Acc==1));
    
    adv1Resolution = abs(adv1CjWhenWrong - adv1CjWhenCorrect);
    
    blk4data(s).blk4Cor1Acc = sum(cor1)/60;
    blk4data(s).blk4Cor2Acc = sum(cor2)/60;
    blk4data(s).blk4Resolution = resolution;
    blk4data(s).blk4Resolution2 = resolution2;
    blk4data(s).blk4Resolution2Adv1 = resolution2Adv1;
    blk4data(s).blk4Resolution2Adv2 = resolution2Adv2;
    blk4data(s).blk4AverageCj1 = mean(cj1);
    blk4data(s).adv1Agreed = sum(algor1AdvisorAnswer==int1 & blk4whichAdvisor==1)/30;
    blk4data(s).adv2Agreed = sum(algor2AdvisorAnswer==int1 & blk4whichAdvisor==2)/30;
    blk4data(s).agreedDiff = blk4data(s).adv2Agreed - blk4data(s).adv1Agreed;
    blk4data(s).res2Diff = blk4data(s).blk4Resolution2Adv2 - blk4data(s).blk4Resolution2Adv1;
    blk4data(s).blk4MeanAdvisor1Sway = meanAdvisor1Sway;
    blk4data(s).blk4MeanAdvisor2Sway = meanAdvisor2Sway;
    blk4data(s).swayDiff = meanAdvisor2Sway-meanAdvisor1Sway;
    blk4data(s).blk4AdviceSway = mean(blk4AdviceSway);
    blk4data(s).blk4AdviceSway1Diff = mean(blk4AdviceSway1Diff);
    blk4data(s).blk4AdviceSway2Diff = mean(blk4AdviceSway2Diff);
    blk4data(s).adv1Resolution = adv1Resolution;
    
   
    %% Main Trials Data Variables
    % Where we call all of the data columns that we want from the trials
    % dataset for each participant.
    cj1Choice = [];
    advChoice = [];
    
    wherelarger = [trials(151:270).wherelarger].';
    cj1 = [trials(151:270).cj1].';
    cj2 = [trials(151:270).cj2].';
    int1 = [trials(151:270).int1].';
    int2 = [trials(151:270).int2].';
    algor1AdvisorAnswer = [trials(151:270).algorithm1Answer].';
    algor2AdvisorAnswer = [trials(151:270).algorithm2Answer].';
    whichAdvisor = [trials(151:270).whichAdvisor].';
    trialType = [trials(151:270).trialType].';
    cor1 = [trials(151:270).cor1].';
    cor2 = [trials(151:270).cor2].';
    algorCorrect1 = [trials(151:270).algorithm1Correct].';
    algorCorrect2 = [trials(151:270).algorithm2Correct].';
    algor1Confidence = [trials(151:270).algorithm1Confidence].';
    dotRT = [trials(151:270).rt1].'; 
    resp1t = [trials(151:270).resp1_t].';
    resp2t = [trials(151:270).resp2_t].';
    ctcTime = resp2t - resp1t;
    adviceSway = [];
    
    cj2Orig = cj2;
    cj1Orig = cj1;

    cj1 = abs(cj1);
    cj2 = abs(cj2);
   
    
            % Flipped values for confidence difference
    cj2flip = [trials(151:270).cj2].';
    elementsToChange = (int1 == 1);
    cj2flip(elementsToChange) = -cj2flip(elementsToChange);
    flippedConfDiff = (cj2flip - cj1);
    
    algor1AdvisorSameAnswer = (whichAdvisor==1*(trialType==2*(int1 == algor1AdvisorAnswer)));
    algor1AdvisorDiffAnswer = (whichAdvisor==1*(trialType==2*(int1 ~= algor1AdvisorAnswer)));
    algor2AdvisorSameAnswer = (whichAdvisor==2*(trialType==2*(int1 == algor2AdvisorAnswer)));
    algor2AdvisorDiffAnswer = (whichAdvisor==2*(trialType==2*(int1 ~= algor2AdvisorAnswer)));
    
    meanAlgor1AgreeConfDiff = mean(flippedConfDiff(algor1AdvisorSameAnswer==1));
    meanAlgor1DisagreeConfDiff = mean(flippedConfDiff(algor1AdvisorDiffAnswer==1));
    meanAlgor2AgreeConfDiff = mean(flippedConfDiff(algor2AdvisorSameAnswer==1));
    meanAlgor2DisagreeConfDiff = mean(flippedConfDiff(algor2AdvisorDiffAnswer==1));
    
    algor2Influence = ((meanAlgor2AgreeConfDiff-meanAlgor2DisagreeConfDiff)-(meanAlgor1AgreeConfDiff-meanAlgor1DisagreeConfDiff));
    
    wherelarger = wherelarger - 1;
    int1 = int1-1;
    
    for i = 1:120
        if trialType(i) == 1
            cj1Choice = [cj1Choice,cj1(i)];
            advChoice = [advChoice,whichAdvisor(i)];
        end
        adviceSway(i) = abs(cj2Orig(i) - cj1Orig(i));
    end
    
    adviceSway = adviceSway';
    
    previousChoiceArray1 = [];
    previousChoiceArray2 = [];
    count = 1;
    
    for n = 2:120
        if trialType(n) == 1 && trialType(n-1) == 2
            if whichAdvisor(n-1) == 1
                previousChoiceArray1(count,1) = algorCorrect1(n-1);
                previousChoiceArray1(count,2) = algor1Confidence(n-1);
                previousChoiceArray1(count,3) = (whichAdvisor(n)==1);
            elseif whichAdvisor(n-1) ==2
                previousChoiceArray2(count,1) = algorCorrect2(n-1);
                previousChoiceArray2(count,2) = algor1Confidence(n-1);
                previousChoiceArray2(count,3) = (whichAdvisor(n)==2);
            end
            count = count + 1;
        end
    end
    
   meanCj1WhenWrong = mean(cj1(cor1==0));
   meanCj1WhenCorrect = mean(cj1(cor1==1));
   meanCj2WhenWrong = mean(cj2(cor1==0));
   meanCj2WhenCorrect = mean(cj2(cor1==1));
    
   resolution = abs(meanCj1WhenWrong - meanCj1WhenCorrect);
   resolution2 = abs(meanCj2WhenWrong - meanCj2WhenCorrect);
   
   meanCj2WhenWrongAdv1 = mean(cj2(cor1==0&whichAdvisor==1));
   meanCj2WhenWrongAdv2 = mean(cj2(cor1==0&whichAdvisor==2));
   meanCj2WhenCorrectAdv1 = mean(cj2(cor1==1&whichAdvisor==1));
   meanCj2WhenCorrectAdv2 = mean(cj2(cor1==1&whichAdvisor==2));
    
   resolution2Adv1 = abs(meanCj2WhenWrongAdv1 - meanCj2WhenCorrectAdv1);
   resolution2Adv2 = abs(meanCj2WhenWrongAdv2 - meanCj2WhenCorrectAdv2);
    
   
   algor1Choice = sum(whichAdvisor==1*(trialType==1))/sum(trialType==1);
   
   correctInitial = sum(cor1==1)/120;
   correctFinal = sum(cor2==1)/120;
   
   meanDotRT = mean(dotRT(trialType==2));
   meanAdvisor1Sway = mean(abs(cj1Orig(whichAdvisor==1)-cj2Orig(whichAdvisor==1)));
   meanAdvisor2Sway = mean(abs(cj1Orig(whichAdvisor==2)-cj2Orig(whichAdvisor==2)));
   medianAdvisor1Sway = median(abs(cj1Orig(whichAdvisor==1)-cj2Orig(whichAdvisor==1)));
   medianAdvisor2Sway = median(abs(cj1Orig(whichAdvisor==2)-cj2Orig(whichAdvisor==2)));
   medianAdviceSway = median(abs(cj1Orig-cj2Orig));
   algor1Agreed = sum(whichAdvisor==1&cor2==algorCorrect1)/sum(whichAdvisor==1);
   algor2Agreed = sum(whichAdvisor==2&cor2==algorCorrect2)/sum(whichAdvisor==2);
   
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
    
     
    if s < 41
        if settings.condition == 1
            algor1TrustQ = settings.question(1) + settings.question(2) + settings.question(3) + settings.question(4);
            algor2TrustQ = settings.question(5) + settings.question(6) + settings.question(7) + settings.question(8);
        else
            algor2TrustQ = settings.question(1) + settings.question(2) + settings.question(3) + settings.question(4);
            algor1TrustQ = settings.question(5) + settings.question(6) + settings.question(7) + settings.question(8);
        end
    else
        if settings.condition == 1
            algor1TrustQ = settings.questionAnsOriginal(1) + settings.questionAnsOriginal(2) + settings.questionAnsOriginal(3) + settings.questionAnsOriginal(4);
            algor2TrustQ = settings.questionAnsOriginal(5) + settings.questionAnsOriginal(6) + settings.questionAnsOriginal(7) + settings.questionAnsOriginal(8);
        else
            algor2TrustQ = settings.questionAnsOriginal(1) + settings.questionAnsOriginal(2) + settings.questionAnsOriginal(3) + settings.questionAnsOriginal(4);
            algor1TrustQ = settings.questionAnsOriginal(5) + settings.questionAnsOriginal(6) + settings.questionAnsOriginal(7) + settings.questionAnsOriginal(8);
        end
    end
    
    
    %% Struct data loading
   
    alldata(s).cjMax = max(cj1);
    alldata(s).cjMin = min(cj1);
    alldata(s).avCj1 = mean(cj1);
    alldata(s).cjRange = max(cj1)-min(cj1);
    
    if s<41        
        alldata(s).deviceUse = str2double(subject.electronicsUsage);
    else
        alldata(s).deviceUse = subject.electronicsUsage;
    end
    
    alldata(s).education = subject.education;
    
   if s < 41
       alldata(s).sample = 'A';
   elseif s < 81
       alldata(s).sample = 'B';
   else
       alldata(s).sample = 'C';
   end
    
    
   if s < 41
       if subject.gender == 'f'
           alldata(s).gender = 'F';
       else
           alldata(s).gender = 'M';
       end
   else
       if subject.gender == 0
           alldata(s).gender = 'F';
       else
           alldata(s).gender = 'M';
       end
   end
   
   alldata(s).age = subject.age;
   alldata(s).algor1Choice = algor1Choice;
   alldata(s).algor2Choice = 1-algor1Choice;
   alldata(s).resolution = resolution;
   alldata(s).resolution2 = resolution2;
   alldata(s).correctInitial = correctInitial;
   alldata(s).correctFinal = correctFinal;
   alldata(s).meanDotRT = meanDotRT;
   alldata(s).meanAdvisor1Sway = meanAdvisor1Sway;
   alldata(s).meanAdvisor2Sway = meanAdvisor2Sway;
   alldata(s).medianAdvisor1Sway = medianAdvisor1Sway;
   alldata(s).medianAdvisor2Sway = medianAdvisor2Sway;
   alldata(s).medianAdviceSway = medianAdviceSway;
   alldata(s).algor1Agreed = algor1Agreed;
   alldata(s).algor2Agreed = algor2Agreed;
   alldata(s).ctcTime = mean(ctcTime);
   alldata(s).preferenceStrength = abs(algor1Choice-0.5)*100; 
   
   alldata(s).meanAlgor1AgreeConfDiff = meanAlgor1AgreeConfDiff;
   alldata(s).meanAlgor1DisagreeConfDiff = meanAlgor1DisagreeConfDiff;
   alldata(s).meanAlgor2AgreeConfDiff = meanAlgor2AgreeConfDiff;
   alldata(s).meanAlgor2DisagreeConfDiff = meanAlgor2DisagreeConfDiff;

   alldata(s).quantAdvisor1=quantAdvisor1;
   alldata(s).quantAdvisor2=quantAdvisor2;
   alldata(s).quantAdvisor3=quantAdvisor3;
   alldata(s).quantAdvisor4=quantAdvisor4;

   alldata(s).quantCorrect1=quantCorrect1;
   alldata(s).quantCorrect2=quantCorrect2;
   alldata(s).quantCorrect3=quantCorrect3;
   alldata(s).quantCorrect4=quantCorrect4;
   
   alldata(s).finalDD = trials(151).dotdifference;
   
   choiceTrials = whichAdvisor(trialType==1);
   advisorSettled = 80;
   for p=1:79
       number = 80-p;
       if choiceTrials(number) ~= choiceTrials(number+1)
           break;
       else
           advisorSettled = number;
       end
   end
   
   alldata(s).advisorSettleTrial = advisorSettled;
   alldata(s).algor1ChoiceBeforeSettle = sum(whichAdvisor(1:advisorSettled)==1&trialType(1:advisorSettled)==1)/advisorSettled;
   alldata(s).correctInitialBeforeSettle = sum(cor1(1:advisorSettled)==1&trialType(1:advisorSettled)==1)/advisorSettled;
   alldata(s).cj1ChoiceBeforeSettle = mean(cj1((1:advisorSettled)==1&trialType(1:advisorSettled)==1));
   alldata(s).cj2ChoiceBeforeSettle = mean(cj2((1:advisorSettled)==1&trialType(1:advisorSettled)==1));
   
   mdl1 = fitglm(cj1,cor1,'Distribution','binomial','Link','logit');
   scores1 = mdl1.Fitted.Probability;
   [X1,Y1,T1,AUC1] = perfcurve(cor1,scores1,1);
   alldata(s).rocAUC1 = AUC1;
   
   [Az,tp,fp,fc] = rocarea(cj1,cor1);
   [Az2,tp2,fp2,fc2] = rocarea(cj2,cor2);
    
   alldata(s).cjFull = cj1;
   alldata(s).kurtCj = kurtosis(cj1);
   alldata(s).skewCj = skewness(cj1);
   [N,edges] = histcounts(cj1,5);
   alldata(s).cjBins = N';
%    figure(200)
%    if s> 80
%        subplot(5,16,ya)
%        plot(fp,tp); axis([0 1 0 1]); hold on
%        plot([0 1],[1 0],':'); hold off
%        xlabel('false positive rate') 
%        ylabel('true positive rate') 
%        title('ROC Curve'); axis([0 1 0 1]); 
%        text(0.4,0.2,sprintf('Az = %.2f',Az))
%        text(0.4,0.1,sprintf('fc = %.2f',fc))
%        hold on;
%        a = [0:0.1:1];
%        b = a;
%        plot(a,b);
%        txt2 = ['ROC p' num2str(s-80)];
%        title(txt2)
%        hold off;
%        subplot(5,16,ya+1);
%        bar([quantCorrect1 quantCorrect2 quantCorrect3 quantCorrect4]);
%        txtBar = ['Quantiles p' num2str(s-80)];
%        title(txtBar);
%        ya = ya + 2;
%    end
   
%    
%    mdl2 = fitglm(cj2,int2,'Distribution','binomial','Link','logit');
%    scores2 = mdl2.Fitted.Probability;
%    [X2,Y2,T2,AUC2] = perfcurve(wherelarger,scores2,1);
%    alldata(s).rocAUC2 = AUC2;
   
%    figure(1)
%    
%    if s > 80
%        subplot(5,16,ya);
%        plot(X1,Y1)
%        xlabel('False positive rate'); 
%        ylabel('True positive rate');
%        txt = ['AUC = ' num2str(AUC1)];
%        text(0.1,0.9,txt)
%        hold on;
%        a = [0:0.1:1];
%        b = a;
%        plot(a,b);
%        txt2 = ['ROC p' num2str(s-80)];
%        title(txt2)
%        
%        subplot(5,16,ya+1);
%        bar([quantCorrect1 quantCorrect2 quantCorrect3 quantCorrect4]);
%        txtBar = ['Quantiles p' num2str(s-80)];
%        title(txtBar);
%        ya = ya + 2;
%    end
%    hold off;
%    
%    figure(2)
%    
%       if s > 80
%        subplot(5,8,ya2);
%        plot(X2,Y2)
%        xlabel('False positive rate'); 
%        ylabel('True positive rate');
%        txt = ['AUC = ' num2str(AUC2)];
%        text(0.1,0.9,txt)
%        hold on;
%        a = [0:0.1:1];
%        b = a;
%        plot(a,b);
%        txt2 = ['ROC for p' num2str(s-80)];
%        title(txt2)
%        ya2 = ya2 + 1;
%    end
%    hold off;
   
   alldata(s).algor2Influence = algor2Influence;
   
   alldata(s).algor1TrustQ = algor1TrustQ;
   alldata(s).algor2TrustQ = algor2TrustQ;
   
   alldata(s).resolution2Adv1 = resolution2Adv1;
   alldata(s).resolution2Adv2 = resolution2Adv2;
   
   algorChoices = (whichAdvisor(trialType==1));
   
   swaps = 0;
   
   for i = 1:80
       if i == 1
           continue;
       else
           if algorChoices(i) ~= algorChoices(i-1)
               swaps = swaps + 1;
           end
       end
   end
   
   alldata(s).advisorSwaps = swaps;
   
   cj1Predictor = vertcat(cj1Predictor,cj1(trialType==1));
   dotRTPredictor = vertcat(dotRTPredictor,dotRT(trialType==1));
   algorChoicePredictor = vertcat(algorChoicePredictor,algorChoices);
   
   alldata(s).meanAdviceSway = mean(adviceSway);
   alldata(s).meanChoiceCj1 = mean(cj1Choice);
   
   alldata(s).Az = Az;
   alldata(s).fc = fc;
   
   alldata(s).Az2 = Az2;
   alldata(s).fc2 = fc2;
   
   choiceCj1 = cj1(trialType==1);
   choiceRT = dotRT(trialType==1);
   choiceAdvisor = whichAdvisor(trialType==1);
   choicePrevCor = [];
   
   corcount = 1;
   for r = 151:270
       if trials(r).choiceTrial == 1
           choicePrevCor(corcount) = trials(r-1).cor2;
           corcount = corcount + 1;
       end    
   end
   
   choicePrevCor = choicePrevCor';
   
   [B,dev,stats] = mnrfit([choiceCj1,choiceRT],choiceAdvisor);
   
%    alldata(s).logistB = B;
   alldata(s).logistDev = dev;
%    alldata(s).logistT = stats.t;
%    alldata(s).logistP = stats.p;
   if isempty(stats.p)
       alldata(s).logistSig = 0;
   else
       alldata(s).logistSig = sum([stats.p(2)<0.05,stats.p(3)<0.05]);
   end
   
   [H,P,D] = swtest(cj1);
   alldata(s).swP = P;
   alldata(s).swD = D;
   alldata(s).cj1Kurt = kurtosis(cj1);
   alldata(s).cj1Skew = skewness(cj1);
   alldata(s).certainPercent = sum(cj1>25)/120;
   
   
   if s > 80
%        figure(300)
%        subplot(5,8,ya);
%        scatter(cj1(trialType==1),whichAdvisor(trialType==1));
%        xlabel('Initial Confidence');
%        ylabel('Advisor Choice');
%        txt = ['p' num2str(s-80)];
%        title(txt);
%        ya = ya + 1;
%        
%        figure(400)
%        subplot(5,8,ya2);
%        scatter(trialNumber(trialType==1),whichAdvisor(trialType==1));
%        xlabel('TrialNumber');
%        ylabel('Advisor Choice');
%        txt = ['p' num2str(s-80)];
%        title(txt);
%        ya2 = ya2 + 1;
% 
%     figure(500)
%     subplot(5,8,ya3);
%     normplot(cj1);
%     txt = ['p' num2str(s-80) ': SW = ' num2str(D) ', p = ' num2str(P)];
%     title(txt)
%     ya3 = ya3 + 1;
%     
%     figure(600)
%     subplot(5,8,ya4);
%     histfit(cj1);
%     xlim([0 50]);
%     txt = ['p' num2str(s-80) ': algor1Choice = ' num2str(alldata(s).algor1Choice)];
%     title(txt)
%     ya4 = ya4 + 1;
% 
   


   end
   
   
   %% Uncomment to run the Metacognitive Calculations
   %(Commented as it takes a while to run...)

%    [alldata(s).sdtCounts1, alldata(s).sdtCounts2] = trials2counts(wherelarger,int1,cj1,50,1);
%    alldata(s).metaD = fit_meta_d_MLE(alldata(s).sdtCounts1, alldata(s).sdtCounts2, 1);
%    
%    metaDPrime = alldata(s).metaD;
%    alldata(s).metaDPrime = [metaDPrime.meta_da].';
%    
%    [alldata(s).sdtCounts12, alldata(s).sdtCounts22] = trials2counts(wherelarger,int2,cj2,50,1);
%    alldata(s).metaD2 = fit_meta_d_MLE(alldata(s).sdtCounts12, alldata(s).sdtCounts22, 1);
%    
%    metaDPrime2 = alldata(s).metaD2;
%    alldata(s).metaDPrime2 = [metaDPrime2.meta_da].';

   %% BC Data
   
   if s>40
       
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

        bcdata(s).orderScore = orderScore;
        bcdata(s).predictScore = predictScore;
        bcdata(s).decisiveScore = decisiveScore;
        bcdata(s).ambigScore = ambigScore;
        bcdata(s).closedScore = closedScore;
        bcdata(s).needForClosureLie = settings.NFClosureLie;
        bcdata(s).needForCogScore = sum(settings.questionAnsNFCognitionReversed);
        bcdata(s).needForClosureScore = needForClosureScore;
        bcdata(s).age = subject.age;
       bcdata(s).algor1Choice = algor1Choice;
       bcdata(s).resolution = resolution;
       bcdata(s).resolution2 = resolution2;
       bcdata(s).correctInitial = correctInitial;
       bcdata(s).correctFinal = correctFinal;
       bcdata(s).meanDotRT = meanDotRT;
       bcdata(s).meanAdvisor1Sway = meanAdvisor1Sway;
       bcdata(s).meanAdvisor2Sway = meanAdvisor2Sway;
       bcdata(s).algor1Agreed = algor1Agreed;
       bcdata(s).algor2Agreed = algor2Agreed;
       bcdata(s).ctcTime = mean(ctcTime);
       bcdata(s).preferenceStrength = abs(algor1Choice-0.5)*100;
   end
   



end

algorChoiceVec = [alldata.algor1Choice]';
algorChoiceCjs = [alldata.cjFull]';
algorChoiceVec = [algorChoiceVec algorChoiceCjs];
algorChoiceVec = sortrows(algorChoiceVec);

% for yep = 1:120
%     figure(900)
%     subplot(10,12,yep);
%     histfit(algorChoiceVec(yep,2:121));
%     xlim([0 50]);
%     txt = [num2str(yep) ': adv1% = ' num2str(algorChoiceVec(yep,1))];
%     title(txt)
% end

algorChoiceVec = [alldata.algor1Choice]';
algorChoiceCjs = [alldata.cjFull]';
prefStrength = [alldata.preferenceStrength]';


figure(1100)
kurtCobain = [alldata.kurtCj]';
skewCobain = [alldata.skewCj]';
subplot(2,2,1)
scatter(abs(kurtCobain),algorChoiceVec,'filled');
title('Kurtosis against Choice');
subplot(2,2,2)
scatter(abs(skewCobain),algorChoiceVec,'filled');
title('Skewness against Choice');

subplot(2,2,3)
scatter(abs(kurtCobain),prefStrength,'filled');
title('Kurtosis against Pref Strength');
subplot(2,2,4)
scatter(abs(skewCobain),prefStrength,'filled');
title('Skewness against Pref Strength');

certainty = [alldata.certainPercent].';
figure(1200)
scatter(certainty,algorChoiceVec,'filled');


X = [alldata.cjBins]';
[idx,C] = kmeans(X,5,'Distance','sqeuclidean','MaxIter',10000,'Replicates',5,'Start','cluster');
figure(1300)
algor1ChoiceAll = 1 - algor2Choice;
gscatter(algor1ChoiceAll,algor2Choice,idx,'rgbmkyc');

bcdata(1:40) = [];

%% Mean Data Loading 
gender = [alldata.gender].';
ageAll = [alldata.age].';
algor1Choice = [alldata.algor1Choice].';
resolutionAll = [alldata.resolution].';
resolution2 = [alldata.resolution2].';
correctInitialAll = [alldata.correctInitial].';
correctFinal = [alldata.correctFinal].';
meanDotRT = [alldata.meanDotRT].';
meanAdvisor1Sway = [alldata.meanAdvisor1Sway].';
meanAdvisor2Sway = [alldata.meanAdvisor2Sway].';
algor1Agreed = [alldata.algor1Agreed].';
algor2Agreed = [alldata.algor2Agreed].';
ctcTime =  [alldata.ctcTime].';
preferenceStrength = [alldata.preferenceStrength].';
sample = [alldata.sample].';
cjRange = [alldata.cjRange].';
deviceUseAll = [alldata.deviceUse].';
finalDD = [alldata.finalDD].';
% metaD1 = [alldata.metaDPrime].';
rocAUC  = [alldata.rocAUC1].';
educationAll = [alldata.education].';
algor2TrustQ = [alldata.algor2TrustQ].';
meanCj1 = [alldata.avCj1].';
meanChoiceCj1 = [alldata.meanChoiceCj1].';
Az = [alldata.Az].';
normality = [alldata.swD].';

meanAlgor1AgreeConfDiff = [alldata.meanAlgor1AgreeConfDiff].';
meanAlgor1DisagreeConfDiff = [alldata.meanAlgor1DisagreeConfDiff].';
meanAlgor2AgreeConfDiff = [alldata.meanAlgor2AgreeConfDiff].';
meanAlgor2DisagreeConfDiff = [alldata.meanAlgor2DisagreeConfDiff].';

resolution2Adv1 = [alldata.resolution2Adv1].';
resolution2Adv2 = [alldata.resolution2Adv2].';

algor2Choice = 1 - algor1Choice;
algor2TrustDiff = [alldata.algor2TrustQ].' - [alldata.algor1TrustQ].';
algor2Influence = [alldata.algor2Influence].';
algor2ResolutionDiff = resolution2Adv2 - resolution2Adv1;
algor2AgreedDiff = algor2Agreed - algor1Agreed;

% Below loop removes values for influence difference more or less than
% 2 SDs away from the mean.
% CURRENT LOSS: 9 data points 
infMean = mean(algor2Influence);
infStd = std(algor2Influence);
infUpBound = mean(algor2Influence) + std(algor2Influence) + std(algor2Influence);
infDownBound = mean(algor2Influence) - std(algor2Influence) - std(algor2Influence);
% for r = 1:110
%     if algor2Influence(r) > infUpBound || algor2Influence(r) < infDownBound
%         algor2Influence(r) = [];
%         algor2TrustDiff(r) = [];
%         algor2Choice(r) = [];
%         algor2TrustQ(r) = [];
    
    % This bit removes specific points seen as outliers via Cook's Distance
%     elseif r == 17 || r==92 ||  r==93 || r == 94
%         algor2Influence(r) = [];
%         algor2TrustDiff(r) = [];
%         algor2Choice(r) = [];
%         algor2TrustQ(r) = [];
%     end
% end

%%%%%%%%%%%%

agreedDiff = [blk4data.agreedDiff].';
res2Diff = [blk4data.res2Diff].';
swayDiff = [blk4data.swayDiff].';

quantAdvisor1 = [alldata.quantAdvisor1].';
quantAdvisor2 = [alldata.quantAdvisor2].';
quantAdvisor3 = [alldata.quantAdvisor3].';
quantAdvisor4 = [alldata.quantAdvisor4].';
   
quantCorrect1 = [alldata.quantCorrect1].';
quantCorrect2 = [alldata.quantCorrect2].';
quantCorrect3 = [alldata.quantCorrect3].';
quantCorrect4 = [alldata.quantCorrect4].';

% Gender and Age Split Data

numOfMales = sum([alldata.gender] == 'M');
numOfFemales = sum([alldata.gender] == 'F');

algor1ChoiceM = mean(algor1Choice(gender=='M'));
algor1ChoiceF = mean(algor1Choice(gender=='F'));

resolution2M = mean(resolution2(gender=='M'));
resolution2F = mean(resolution2(gender=='F'));

preferenceStrengthM = mean(preferenceStrength(gender=='M'));
preferenceStrengthF = mean(preferenceStrength(gender=='F'));

meanAdvisor1SwayM = mean(meanAdvisor1Sway(gender=='M'));
meanAdvisor1SwayF = mean(meanAdvisor1Sway(gender=='F'));

meanAdvisor2SwayM = mean(meanAdvisor2Sway(gender=='M'));
meanAdvisor2SwayF = mean(meanAdvisor2Sway(gender=='F'));

maleData = [algor1ChoiceM, resolution2M, preferenceStrengthM, meanAdvisor1SwayM, meanAdvisor2SwayM];
femaleData = [algor1ChoiceF, resolution2F, preferenceStrengthF, meanAdvisor1SwayF, meanAdvisor2SwayF];

%% Figures
% 
% metaDMale = mean(metaD(gender=='M'));
% metaDFemale = mean(metaD(gender=='F'));
% 
% figure(1)
% bar([metaDMale metaDFemale]);
% title('Meta D Prime by Gender');
% xlabel('Gender'); 
% set(gca,'xticklabel',{'Male','Female'})

% figure(2)
% bar([mean(education(sample=='A')) mean(education(sample=='B')) mean(education(sample=='C'))],'FaceColor',[0.6350, 0.0780, 0.1840]);
% title('Education Level for each Study Sample');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(3)
% bar([mean(finalDD(sample=='A')) mean(finalDD(sample=='B')) mean(finalDD(sample=='C'))],'FaceColor',[0.8500, 0.3250, 0.0980]);
% title('Average Final DD for each Study Sample');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(4)
% freqDis(finalDD,1);
% title('Dot Difference Distribution');

% ageDis = freqDis(age,1);
% title('Distribution of Ages in Sample');
% xlabel('Age'); 
% 
% figure(2)
% bar([numOfMales/nparticipants numOfFemales/nparticipants]);
% title('Gender Proportion in Sample');
% xlabel('Gender'); 
% ylabel('Proportion'); 
% set(gca,'xticklabel',{'Male','Female'})
% 
% figure(3)
% bar([nanmean(algor1Choice) nanmean(1-algor1Choice)]);
% title('Choice of Algorithm');
% 
% figure(4)
% bar([nanmean(resolution) nanmean(resolution2)]);
% title('Resolution With and Without Advice');
% 
% figure(5)
% bar([nanmean(correctInitial) nanmean(correctFinal)]);
% title('Accuracy With and Without Advice');
% 
% figure(6)
% bar([nanmean(meanAdvisor1Sway) nanmean(meanAdvisor2Sway)]);
% title('Advisor Sway');
% 
% figure(7)
% scatter(ctcTime,preferenceStrength,'filled')
% title('Trial Time Against Preference Strength');
% 
% figure(8)
% bar([algor1ChoiceM; algor1ChoiceF])
% title('Gender Algor 1 Choice')
% set(gca,'xticklabel',{'Male','Female'})
% 
% figure(9)
% bar([preferenceStrengthM; preferenceStrengthF])
% title('Gender Preference Strength')
% set(gca,'xticklabel',{'Male','Female'})
% 
% figure(10)
% bar([resolution2M; resolution2F])
% title('Gender Resolution')
% set(gca,'xticklabel',{'Male','Female'})

% figure(11)
% bar([nanmean([alldata.quantCorrect1]) nanmean([alldata.quantCorrect2]) nanmean([alldata.quantCorrect3]) nanmean([alldata.quantCorrect4]) nanmean([alldata.quantCorrect5])],'black');
% title('Quartiles of Confidence Calibrated to Accuracy');
% 
% figure(12)
% bar([nanmean([alldata.quantAdvisor1]) nanmean([alldata.quantAdvisor2]) nanmean([alldata.quantAdvisor3]) nanmean([alldata.quantAdvisor4]) nanmean([alldata.quantAdvisor5])],'black');
% title('Quartiles of Confidence Against Advisor Choice');
% 
% figure(13)
% bar([nanmean(quantCorrect1(sample=='A')) nanmean(quantCorrect2(sample=='A')) nanmean(quantCorrect3(sample=='A')) nanmean(quantCorrect4(sample=='A')) nanmean(quantCorrect5(sample=='A')); 
%     nanmean(quantCorrect1(sample=='B')) nanmean(quantCorrect2(sample=='B')) nanmean(quantCorrect3(sample=='B')) nanmean(quantCorrect4(sample=='B')) nanmean(quantCorrect5(sample=='B')); 
%     nanmean(quantCorrect1(sample=='C')) nanmean(quantCorrect2(sample=='C')) nanmean(quantCorrect3(sample=='C')) nanmean(quantCorrect4(sample=='C')) nanmean(quantCorrect5(sample=='C')) ],'FaceColor',[0.4660, 0.6740, 0.1880]);
% title('Quartiles of Confidence Calibrated to Accuracy by Each Study Sample');
% set(gca,'xticklabel',{'A','B','C'})

% figure(14)
% bar([nanmean(quantCj1(sample=='A')) nanmean(quantCj2(sample=='A')) nanmean(quantCj3(sample=='A')) nanmean(quantCj4(sample=='A')) nanmean(quantCj5(sample=='A')); 
%     nanmean(quantCj1(sample=='B')) nanmean(quantCj2(sample=='B')) nanmean(quantCj3(sample=='B')) nanmean(quantCj4(sample=='B')) nanmean(quantCj5(sample=='B')); 
%     nanmean(quantCj1(sample=='C')) nanmean(quantCj2(sample=='C')) nanmean(quantCj3(sample=='C')) nanmean(quantCj4(sample=='C')) nanmean(quantCj5(sample=='C')) ],'FaceColor',[0.6350, 0.0780, 0.1840]);
% title('Quartiles of Confidence Scale Used');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(15)
% bar([nanmean(quantAdvisor1(sample=='A')) nanmean(quantAdvisor2(sample=='A')) nanmean(quantAdvisor3(sample=='A')) nanmean(quantAdvisor4(sample=='A')) nanmean(quantAdvisor5(sample=='A')); 
%     nanmean(quantAdvisor1(sample=='B')) nanmean(quantAdvisor2(sample=='B')) nanmean(quantAdvisor3(sample=='B')) nanmean(quantAdvisor4(sample=='B')) nanmean(quantAdvisor5(sample=='B')); 
%     nanmean(quantAdvisor1(sample=='C')) nanmean(quantAdvisor2(sample=='C')) nanmean(quantAdvisor3(sample=='C')) nanmean(quantAdvisor4(sample=='C')) nanmean(quantAdvisor5(sample=='C')) ],'FaceColor',[0.4940, 0.1840, 0.5560]);
% title('Quartiles of Confidence on Advisor Choice');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(16)
% freqDis(cjRange,5)
% title('Distribution of CJ Ranges in Sample');
% xlabel('Cj Range'); 

% figure(17)
% freqDis(deviceUse,1);
% title('Distribution of Hours of Device Usage');
% xlabel('Electronics Usage');
% 
% figure(18)
% scatter(ctcTime,resolution2,'filled')
% title('CTC Time against Post-Advice Resolution')
% 
% figure(19)
% bar([mean(deviceUse(sample=='A')) mean(deviceUse(sample=='B')) mean(deviceUse(sample=='C'))],'FaceColor',[0.6350, 0.0780, 0.1840]);
% title('Daily Electronics Usage for each Study Sample');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(20)
% bar([mean(age(sample=='A')) mean(age(sample=='B')) mean(age(sample=='C'))],'FaceColor',[0.8500, 0.3250, 0.0980]);
% title('Average Age for each Study Sample');
% set(gca,'xticklabel',{'A','B','C'})
% 
% numOfMalesA = sum(gender == 'M' & sample=='A');
% numOfMalesB = sum(gender == 'M' & sample=='B');
% numOfMalesC = sum(gender == 'M' & sample=='C');
% 
% numOfFemalesA = sum(gender == 'F' & sample=='A');
% numOfFemalesB = sum(gender == 'F' & sample=='B');
% numOfFemalesC = sum(gender == 'F' & sample=='C');
% 
% figure(21)
% bar([numOfMalesA/40 numOfFemalesA/40; numOfMalesB/40 numOfFemalesB/40; numOfMalesC/33 numOfFemalesC/33],'FaceColor',[0.4940, 0.1840, 0.5560]);
% title('Proportion of Male and Female Participants in each Study Sample');
% set(gca,'xticklabel',{'A','B','C'})

% figure(22)
% bar([nanmean(algor1Choice(sample=='A')) nanmean(algor1Choice(sample=='B')) nanmean(algor1Choice(sample=='C'))],'FaceColor',[0.4660, 0.6740, 0.1880]);
% title('Choice of Algorithm 1 for Each Study');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(23)
% bar([mean(finalDD(sample=='A')) mean(finalDD(sample=='B')) mean(finalDD(sample=='C'))], 'FaceColor',[0.4940, 0.1840, 0.5560]);
% title('Average Dot Difference for Each Study');
% set(gca,'xticklabel',{'A','B','C'})
% 
% figure(24)
% bar([mean(resolution(sample=='A')) mean(resolution(sample=='B')) mean(resolution(sample=='C'))], 'FaceColor',[0.4660, 0.6740, 0.1880]);
% title('Average Resolution (Pre-Advice) for Each Study');
% set(gca,'xticklabel',{'A','B','C'})

% figure(25)
% scatter(finalDD,correctInitial,'filled');
% title('Dot Difference against Cj1 Accuracy');
% 
% ddMedianAcc = [];
% dd = [];
% for i = 3:15
%     dd(i-2) = i;
%     ddMedianAcc(i-2) = median(correctInitial(finalDD==i));
% end
% 
% figure(26)
% scatter(dd,ddMedianAcc,'filled')
% title('Dot Difference Against Corresponding Median Cj1 Accuracy');
% lsline;

% figure(27)
% scatter(correctInitial,algor1Choice,'red','filled')
% title('Cj1 Accuracy against Algor 1 Choice')

% 
% figure(27)
% heatPlot(algor1Choice,correctInitial,10,5);

% figure(28)
% scatter(round(correctInitial,2),preferenceStrength,'black','filled')
% title('Cj1 Accuracy against Preference Strength')

% figure(29)
% boxplot([correctInitial,correctFinal],'Notch','on','Labels',{'Cj1 Accuracy','Cj2 Accuracy'})
% 
% figure(30)
% boxplot([resolution,resolution2],'Notch','on','Labels',{'Cj1 Resolution','Cj2 Resolution'})
% 
% figure(31)
% boxplot([meanAdvisor1Sway,meanAdvisor1Sway],'Notch','on','Labels',{'Advisor 1 Sway','Advisor 2 Sway'})
% 
% figure(32)
% boxplot([algor1Agreed,algor2Agreed],'Notch','on','Labels',{'Proportion of Trials Agreed with Algor 1','Proportion of Trials Agreed with Algor 2'})

% figure(33)
% bar([meanAdvisor1SwayM, meanAdvisor2SwayM; meanAdvisor2SwayM, meanAdvisor2SwayF])
% title('Advisor 1 and 2 Sway by Gender Split')
% set(gca,'xticklabel',{'Male','Female'})

% metaDPrime = [alldata.metaD].';
% metaDPrime = [metaDPrime.meta_da].';
% figure(34)
% freqDis(metaDPrime,0.1);
% 
% figure(35)
% scatter(correctInitial,metaDPrime,'filled');
% title('Cj1 Accuracy against Meta D Prime');
% 
% figure(36)
% freqDis(finalDD,1)
% title('Distribution of Final Dot Differences')
% 
% figure(37)
% yig = scatter3(agreedDiff,res2Diff,algor1Choice,'filled');
% title('Plot of Difference in Algor Resolution, Algor Agreement and Algor Choice');
% xlabel('Difference in Block 4 Algor Agreement');
% ylabel('Difference in Block 4 Algor Resolution');
% while ishandle(yig); camorbit(0.4,-0.1); drawnow; end

% [B,FitInfo] = lasso(X,Y,'CV',10);
% lassoPlot(B,FitInfo,'PlotType','CV');


% t2=anova(mdl2,'summary');
% [P,T,STATS,TERMS] = anovan(algor2Choice,{algor2TrustQ algor2Influence},'model','full');
% 
% figure(38)
% fig = scatter3(algor2TrustQ,algor2Influence,algor2Choice,'filled','red');
% title('Plot of Difference in Trust, Influence and Choice for Algor 2');
% xlabel('Difference in Trust');
% ylabel('Difference in Influence');
% zlabel('Algor 2 Choice');
% rotate3d('on')


% [P,T,STATS,TERMS] = anovan(algor2Choice,{algor2TrustDiff algor2Influence},'model','full');
% [d2,p2,stats2] = manova1([metaD rocAUC],resolution2,0.05);
%
% tbl = table(algor2Influence,algor2Choice,algor2TrustDiff);
% [~,larg] = max(mdl.Diagnostics.CooksDistance);
% mdl2 = fitlm(tbl,'algor2Choice ~ algor2Influence*algor2TrustDiff + algor2TrustDiff^2','Exclude',larg);

% Possible Algor2Choice Drivers:
% algor2TrustDiff/algorTrustQ,algor2Influence,algor2AgreedDiff,algor2ResolutionDiff
% Block 4 variables:
% agreedDiff
% res2Diff
% swayDiff


[d,p,stats] = manova1([algor2TrustDiff algor2Influence swayDiff],algor2Choice,0.05);


%% ABC Regression Model 

%simpler model
% X = [algor2Influence,algor2TrustDiff];

X = [algor2Influence,algor2TrustDiff,swayDiff,meanChoiceCj1];

%X = [resolutionAll swayDiff deviceUseAll meanChoiceCj1 ctcTime];
Y = algor2Choice;
mdl = fitlm(X,Y,'linear');

[d2,p2,stats2] = manova1([resolutionAll swayDiff deviceUseAll meanChoiceCj1 ctcTime],algor2Choice,0.05);

t = anova(mdl,'summary');
coefCI(mdl);
[p1,F1,d1] = coefTest(mdl);
[P1, DW] = dwtest(mdl);

mdlResiduals = mdl.Residuals.Raw;
mdlFitted = mdl.Fitted;

figure(89)
plot(mdl);
figure(90)
plotResiduals(mdl);
figure(91)
plotResiduals(mdl,'probability');
figure(92)
plotEffects(mdl);
figure(93)
plotDiagnostics(mdl);
figure(94)
plotDiagnostics(mdl,'cookd');
figure(95)
plotResiduals(mdl,'lagged');
figure(96)
plotDiagnostics(mdl,'contour');
figure(97)
plotResiduals(mdl,'fitted');


%% BC Analysis

orderScore = [bcdata.orderScore].';
predictScore = [bcdata.predictScore].';
decisiveScore = [bcdata.decisiveScore].';
ambigScore = [bcdata.ambigScore].';
closedScore = [bcdata.closedScore].';
NFCLie = [bcdata.needForClosureLie].';
needForCogScore = [bcdata.needForCogScore].';
needForClosureScore = [bcdata.needForClosureScore].';

gender = gender(41:120);
education = educationAll(41:120);
deviceUse = deviceUseAll(41:120);


age = [bcdata.age].';
algor1Choice = [bcdata.algor1Choice].';
resolution = [bcdata.resolution].';
resolution2 = [bcdata.resolution2].';
correctInitial = [bcdata.correctInitial].';
correctFinal = [bcdata.correctFinal].';
meanDotRT = [bcdata.meanDotRT].';
meanAdvisor1Sway = [bcdata.meanAdvisor1Sway].';
meanAdvisor2Sway = [bcdata.meanAdvisor2Sway].';
algor1Agreed = [bcdata.algor1Agreed].';
algor2Agreed = [bcdata.algor2Agreed].';
ctcTime = [bcdata.ctcTime].';
preferenceStrength = [bcdata.preferenceStrength].';

% X = [deviceUse resolution];
% Y = algor1Choice;
% mdl = fitlm(X,Y,'linear');
% t = anova(mdl,'summary');
% coefCI(mdl);
% [p1,F1,d1] = coefTest(mdl);
% [P1, DW] = dwtest(mdl);
% 
% mdlResiduals = mdl.Residuals.Raw;
% mdlFitted = mdl.Fitted;
% 
% % tbl = table(algor2Influence,algor2Choice,algor2TrustDiff);
% % [~,larg] = max(mdl.Diagnostics.CooksDistance);
% % mdl2 = fitlm(tbl,'algor2Choice ~ algor2Influence*algor2TrustDiff + algor2TrustDiff^2','Exclude',larg);
%  
% figure(189)
% plot(mdl);
% figure(190)
% plotResiduals(mdl);
% figure(191)
% plotResiduals(mdl,'probability');
% figure(192)
% plotEffects(mdl);
% figure(193)
% plotDiagnostics(mdl);
% figure(194)
% plotDiagnostics(mdl,'cookd');
% figure(195)
% plotResiduals(mdl,'lagged');
% figure(196)
% plotDiagnostics(mdl,'contour');
% figure(197)
% plotResiduals(mdl,'fitted');
% 
% [d3,p3,stats3] = manova1([ambigScore decisiveScore needForCogScore],algor1Choice,0.05);
