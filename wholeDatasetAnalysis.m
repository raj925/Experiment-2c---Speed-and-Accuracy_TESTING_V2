%% wholeDataset2ndAnalysis
% Including a new variable called flippedConfDiff which looks at the
% confidence difference when flipping the sign(s) of CJ1 and CJ2 (CJ2 is only
% flipped is CJ1 is flipped) when CJ1 is negative.

% Trial type: 1 = choice, 2 = forced  % Advisor type: 1 = human, 2 = computer
paths = {'C:\Users\ac220\Desktop\Experiment 2 - Working Files\rawdata\311\behaviour\73711859148_311_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2 - Working Files\rawdata\312\behaviour\73711946431_312_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2 - Working Files\rawdata\313\behaviour\73711950816_313_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2 - Working Files\rawdata\314\behaviour\73712050030_314_final.mat'...
    'C:\Users\ac220\Desktop\Experiment 2 - Working Files\rawdata\315\behaviour\73712154914_315_final.mat'};

nparticipants = 5;

for s = 1:nparticipants
    load(paths{s});
    
    whichAdvisor = [trials(151:510).whichAdvisor].';
    trialType = [trials(151:510).trialType].';
    cj1 = [trials(151:510).cj1].';
    cj2 = [trials(151:510).cj2].';
    cor1 = [trials(151:510).cor1].';
    cor2 = [trials(151:510).cor2].';
    int1 = [trials(151:510).int1].';
    humanAdvisorAnswer = [trials(151:510).humanAdvisorAnswer].';
    algorithmAdvisorAnswer = [trials(151:510).algorithmAdvisorAnswer].';
    wherelarger = [trials(151:510).wherelarger].';
    practiceDotdifferences = [trials(1:90).dotdifference].';
    
    cj1abs = abs(cj1);
    cj2abs = abs(cj2);
    
    cj2flip = [trials(151:510).cj2].';
    elementsToChange = int1 == 1;
    cj2flip(elementsToChange) = -cj2flip(elementsToChange);
    flippedConfDiff = cj2flip - cj1abs;
    flippedConfDiff1 = abs(flippedConfDiff);
    meanAbsFlippedConfDiff = mean(flippedConfDiff1);
    
    conf1WithComputer = (cj1abs(whichAdvisor==2));
    conf2WithComputer = (cj2flip(whichAdvisor==2));
    conf1WithHuman = (cj1abs(whichAdvisor==1));
    conf2WithHuman = (cj2flip(whichAdvisor==1));
    confCompDifference = [conf1WithComputer conf2WithComputer (conf1WithComputer - conf2WithComputer)];
    confHumanDifference = [conf1WithHuman conf2WithHuman (conf1WithHuman - conf2WithHuman)];
    
    %     cj3 = abs(cj2-cj1);
    cj4 = mean(abs([conf2WithComputer - conf1WithComputer].'));
    cj5 = mean(abs([conf2WithHuman - conf1WithHuman].'));
    cor1Acc = mean(cor1);
    cor2Acc = mean(cor2);
    
    %     humanAdvisorSameAnswer = (whichAdvisor==1*(int1 == humanAdvisorAnswer));
    %     humanAdvisorDiffAnswer = (whichAdvisor==1*(int1 ~= humanAdvisorAnswer));
    %     computerAdvisorSameAnswer = (whichAdvisor==2*(int1 == algorithmAdvisorAnswer));
    %     computerAdvisorDiffAnswer = (whichAdvisor==2*(int1 ~= algorithmAdvisorAnswer));
    %     agreeTrials = (humanAdvisorSameAnswer + computerAdvisorSameAnswer);
    %     disagreeTrials = (humanAdvisorDiffAnswer + computerAdvisorDiffAnswer);
    %     meanAgreeTrials = mean(cj3(agreeTrials==1));
    %     meanDisagreeTrials = mean(cj3(disagreeTrials==1));
    %     meanHASame = mean(cj3(humanAdvisorSameAnswer==1));
    %     meanHADiff = mean(cj3(humanAdvisorDiffAnswer==1));
    %     meanCASame = mean(cj3(computerAdvisorSameAnswer==1));
    %     meanCADiff = mean(cj3(computerAdvisorDiffAnswer==1));
    
    humanAdvisorSameAnswer = (whichAdvisor==1*(int1 == humanAdvisorAnswer));
    humanAdvisorDiffAnswer = (whichAdvisor==1*(int1 ~= humanAdvisorAnswer));
    computerAdvisorSameAnswer = (whichAdvisor==2*(int1 == algorithmAdvisorAnswer));
    computerAdvisorDiffAnswer = (whichAdvisor==2*(int1 ~= algorithmAdvisorAnswer));
    agreeTrials = (humanAdvisorSameAnswer + computerAdvisorSameAnswer);
    disagreeTrials = (humanAdvisorDiffAnswer + computerAdvisorDiffAnswer);
    meanAgreeTrials = mean(flippedConfDiff(agreeTrials==1));
    meanDisagreeTrials = mean(flippedConfDiff(disagreeTrials==1));
    meanHASame = mean(flippedConfDiff(humanAdvisorSameAnswer==1));
    meanHADiff = mean(flippedConfDiff(humanAdvisorDiffAnswer==1));
    meanCASame = mean(flippedConfDiff(computerAdvisorSameAnswer==1));
    meanCADiff = mean(flippedConfDiff(computerAdvisorDiffAnswer==1));
    
    forcedComputer = (trialType==2 & whichAdvisor==2);
    forcedHuman = (trialType==2 & whichAdvisor==1);
    forcedAll = (trialType==2 & whichAdvisor);
    choiceComputer = (trialType==1 & whichAdvisor==2);
    choiceHuman = (trialType==1 & whichAdvisor==1);
    
    lowestPractDD = min(practiceDotdifferences);
    finalDD = [trials(90).dotdifference];
    adjustedDD = [trials(91).dotdifference];
    subjectID = subject.dir;
    
    data(s).subjectID = subjectID;
    data(s).choiceHuman = choiceHuman;
    data(s).choiceComputer = choiceComputer;
    data(s).humanChoicePercent = sum(trialType==1 & whichAdvisor==1)/sum(trialType==1);
    data(s).computerChoicePercent = sum(trialType==1 & whichAdvisor==2)/sum(trialType==1);
    data(s).cj1 = cj1;
    data(s).cj2 = cj2;
    %     data(s).cj3 = cj3;
    data(s).whichAdvisor = whichAdvisor;
    data(s).confDiffWithCompAdv = cj4;
    data(s).confDiffWithHumanAdv = cj5;
    data(s).confDiffWhenHuAgree = meanHASame;
    data(s).confDiffWhenHuDisagree = meanHADiff;
    data(s).confDiffWhenCompAgree = meanCASame;
    data(s).confDiffWhenCompDisagree = meanCADiff;
    data(s).meanAbsFlippedConfDiff = meanAbsFlippedConfDiff;
    data(s).meanAgreeTrials = meanAgreeTrials;
    data(s).meanDisagreeTrials = meanDisagreeTrials;
    data(s).meanCor1Accuracy = cor1Acc;
    data(s).meanCor2Accuracy = cor2Acc;
    data(s).lowestPractDD = lowestPractDD;
    data(s).finalDD = finalDD;
    data(s).adjustedDD = adjustedDD;
    data(s).conf1WithComputer = conf1WithComputer;
    data(s).conf2WithComputer = conf2WithComputer;
    data(s).conf1WithHuman = conf1WithHuman;
    data(s).conf2WithHuman = conf2WithHuman;
    data(s).confCompDifference = confCompDifference;
    data(s).confHumanDifference = confHumanDifference;
    
    %     temp = [data(2).cj1 data(2).cj2];
end

%% Finds total confidence differences between advisors (all trial types)
% Finds overall stats for confidence difference between computer advisor and human advisor for all subjects
[H1,P1,CI1,STATS1] = ttest([data.confDiffWithCompAdv].',[data.confDiffWithHumanAdv].');

% (Bar Graph) Overall Confidence Difference for Computer vs. Human (all Ss combined)
figure('Name','Overall Mean Confidence Difference For Each Advisor Type (All Ss combined)')
confDiffWithHumanAdv = mean([data.confDiffWithHumanAdv]).';
confDiffWithCompAdv = mean([data.confDiffWithCompAdv]).';
confDiffBarGraph = [confDiffWithHumanAdv confDiffWithCompAdv];
bar(confDiffBarGraph, 0.4, 'DisplayName','allconfDiffBarGraph');
title('Overall Mean Confidence Difference For Each Advisor Type (All Ss combined)');
xticks([1 2 ]);
xticklabels({'Human','Computer'});
xlabel('Advisor Type');
ylabel('Mean Abs Conf Diff (cj2-cj1)');
xlim([0 3]);
% SEMean1 = [0.767361,0.773504];
stderror1 = std([data.confDiffWithHumanAdv]).'/ sqrt(length([data.confDiffWithHumanAdv]).');
stderror11 = std([data.confDiffWithCompAdv]).'/ sqrt(length([data.confDiffWithCompAdv]).');
SEMean1 = [stderror1,stderror11];
hold on
e = errorbar([1 2],[confDiffWithHumanAdv confDiffWithCompAdv],SEMean1);
hold off
e.Color = 'red';
e.LineWidth = 2;
legend('Advisor','Std Error');
legend('Location','northeast');
num2str1 = P1;
str1 = {'p =',{(num2str1)}};
text([.1 .2],[7 7],str1);
grid on

% (Bar Graph) Confidence Difference For Human vs. Computer Advisors
figure('Name','Confidence Difference For Each Advisor Type');
confDiffWithHumanAdv1 = [data.confDiffWithHumanAdv].';
confDiffWithCompAdv1 = [data.confDiffWithCompAdv].';
confDiffBarGraph1 = [confDiffWithHumanAdv1 confDiffWithCompAdv1];
bar(confDiffBarGraph1,'DisplayName','confDiffBarGraph');
% ylim([0 16]);
xlabel('Participant');
xlim([0 26]);
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25]);
xticklabels({'311','312','313','314','315','316','317','318','319','320','321','322',...
    '323','324','325','326','327','328','329','330','331','332','333','334','335'});
ylabel('Mean Abs Conf Diff (cj2-cj1)');
title('Confidence Difference For Each Advisor Type');
legend('Human Advsr','Computer Advsr');
legend('Location','northwest');
grid on;

%% Choice Trials Selection
% Finds choice trials selection difference
[H2,P2,CI2,STATS2] = ttest([data.humanChoicePercent].',[data.computerChoicePercent].');

% (Bar Graph) Overall Confidence Difference for Computer vs. Human (all Ss combined)
figure('Name','Overall Percentage of Advisor Choice For All Choice Trials (All Ss combined)')
meanHumanChoicePercent = mean([data.humanChoicePercent]).';
meanComputerChoicePercent = mean([data.computerChoicePercent]).';
choicePercentDiffGraph = [meanHumanChoicePercent meanComputerChoicePercent];
bar(choicePercentDiffGraph, 0.4, 'DisplayName','allconfDiffBarGraph');
title('Overall Percentage of Advisor Choice For All Choice Trials (All Ss combined)');
xticks([1 2 ]);
xticklabels({'Human','Computer'});
xlabel('Advisor Type');
ylabel('Mean Percentage');
xlim([0 3]);
% SEMean2 = [0.047376,0.047376];
stderror2 = std([data.humanChoicePercent]).'/ sqrt(length([data.humanChoicePercent]).');
stderror21 = std([data.computerChoicePercent]).'/ sqrt(length([data.computerChoicePercent]).');
SEMean2 = [stderror2,stderror21];
hold on
e = errorbar([1 2],[meanHumanChoicePercent meanComputerChoicePercent],SEMean2);
hold off
e.Color = 'red';
e.LineWidth = 2;
legend('Advisor','Std Error');
legend('Location','northeast');
num2str2 = P2;
str2 = {'p =',{(num2str2)}};
text([.1 .2],[.5 .5],str2);
grid on

% (Bar Graph) Choice Percentages For Human and Computer Advisors
figure('Name','Percentage of Advisor Choice For All Choice Trials');
humanChoicePercent = [data.humanChoicePercent].';
computerChoicePercent = [data.computerChoicePercent].';
choiceDiffBarGraph = [humanChoicePercent computerChoicePercent];
bar(choiceDiffBarGraph,'DisplayName','choiceDiffBarGraph');
% ylim([0 1]);
xlabel('Participant');
xlim([0 26]);
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25]);
xticklabels({'311','312','313','314','315','316','317','318','319','320','321','322',...
    '323','324','325','326','327','328','329','330','331','332','333','334','335'});
ylabel('Choice Percentage');
title('Percentage of Advisor Choice For All Choice Trials');
legend('% Human Advsr','% Computer Advsr','Location','northwest');
yticks([.1 .2 .3 .4 .5 .6 .7 .8 .9 1.0]);
yticklabels({'10%','20%','30%','40%','50%','60%','70%','80%','90%','100%'});
grid on;

%% Overall Agree vs Disagree (each Ss separately)

% Find stats for overall confidence difference when agreeing/disagreeing with Advisor
[H3,P3,CI3,STATS3] = ttest([data.meanAgreeTrials].',[data.meanDisagreeTrials].');

% (Bar Graph) Overall Confidence Difference for Computer vs. Human (all Ss combined)
figure('Name','Overall Confidence Difference in Agree vs. Disagree Trials (All Ss combined)')
meanAgreeTrials1 = mean([data.meanAgreeTrials]).';
meanDisagreeTrials1 = mean(abs([data.meanDisagreeTrials]).');
meanAgreeDisagreeTrialsBarGraph1 = [meanAgreeTrials1 meanDisagreeTrials1];
bar(meanAgreeDisagreeTrialsBarGraph1, 0.4,'DisplayName','meanAgreeDisagreeTrialsBarGraph');
title('Overall Confidence Difference in Agree vs. Disagree Trials (All Ss combined)');
xticks([1 2 ]);
xticklabels({'Agree','Disagree'});
xlabel('Trial Type');
ylabel('Mean Abs Conf Diff (cj2-cj1)');
xlim([0 3]);
% SEMean3 = [0.628563,1.245741];
stderror3 = std([data.meanAgreeTrials]).'/ sqrt(length([data.meanAgreeTrials]).');
stderror31 = std([data.meanDisagreeTrials]).'/ sqrt(length([data.meanDisagreeTrials]).');
SEMean3 = [stderror3,stderror31];
hold on
e = errorbar([1 2],[meanAgreeTrials1 meanDisagreeTrials1],SEMean3);
hold off
e.Color = 'red';
e.LineWidth = 2;
legend('Advisor','Std Error');
legend('Location','northeast');
num2str3 = P3;
str3 = {'p =',{(num2str3)}};
% text([.1 .2],[8.5 8.5],str3);
text([.1 .2],[4.5 4.5],str3);
grid on

% Overall Confidence Difference When Agreeing/Disagreeing with Advisor
figure('Name','Confidence Difference in Agree vs. Disagree Trials');
meanAgreeTrials = [data.meanAgreeTrials].';
meanDisagreeTrials = (abs([data.meanDisagreeTrials].'));
meanAgreeDisagreeTrialsBarGraph = [meanAgreeTrials meanDisagreeTrials];
bar(meanAgreeDisagreeTrialsBarGraph,'DisplayName','meanAgreeDisagreeTrialsBarGraph');
% ylim([0 25]);
xlabel('Participant');
xlim([0 26]);
ylim([0 25]);
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25]);
xticklabels({'311','312','313','314','315','316','317','318','319','320','321','322',...
    '323','324','325','326','327','328','329','330','331','332','333','334','335'});
ylabel('Mean Abs Conf Diff (cj1-cj2)');
title('Confidence Difference in Agree vs. Disagree Trials');
legend('Agree','Disagree');
legend('Location','northwest');
grid on;

%% Agree vs Disagree Trials By Advisor Type

% Finds total mean change in confidence stats when advisor agrees with int1 (based on advisor)
[H4,P4,CI4,STATS4] = ttest([data.confDiffWhenHuAgree].',[data.confDiffWhenCompAgree].');

% (Bar Graph) Overall Confidence Difference for Agree Trials by Advisor Type (all Ss combined)
figure('Name','Overall Confidence Difference for Agree Trials by Advisor Type (all Ss combined)')
meanConfDiffWhenHuAgree1 = mean([data.confDiffWhenHuAgree]).';
meanconfDiffWhenCompAgree1 = mean([data.confDiffWhenCompAgree]).';
meanAgreeTrialsBarGraph1 = [meanConfDiffWhenHuAgree1 meanconfDiffWhenCompAgree1];
bar(meanAgreeTrialsBarGraph1, 0.4,'DisplayName','meanAgreeTrialsBarGraph1');
title('Overall Confidence Difference for Agree Trials by Advisor Type (all Ss combined)');
xticks([1 2 ]);
xticklabels({'Human','Computer'});
xlabel('Advisor Type (Agree Trials)');
ylabel('Mean Abs Conf Diff (cj2-cj1)');
xlim([0 3]);
ylim([0 12])
% SEMean4 = [0.647818,0.629231];
stderror4 = std([data.confDiffWhenHuAgree]).'/ sqrt(length([data.confDiffWhenHuAgree]).');
stderror41 = std([data.confDiffWhenCompAgree]).'/ sqrt(length([data.confDiffWhenCompAgree]).');
SEMean4 = [stderror4,stderror41];
hold on
e = errorbar([1 2],[meanConfDiffWhenHuAgree1 meanconfDiffWhenCompAgree1],SEMean4);
hold off
e.Color = 'red';
e.LineWidth = 2;
legend('Advisor','Std Error');
legend('Location','northeast');
num2str4 = P4;
str4 = {'p =',{(num2str4)}};
% text([.1 .2],[11.5 11.5],str4);  % positive mean
text([.1 .2],[5.5 5.5],str4);     % negative mean
grid on

% Finds total mean change in confidence stats when advisor disagrees with int1 (based on advisor)
[H5,P5,CI5,STATS5] = ttest([data.confDiffWhenHuDisagree].',[data.confDiffWhenCompDisagree].');

% (Bar Graph) Overall Confidence Difference for Disagree Trials by Advisor Type (all Ss combined)
figure('Name','Overall Confidence Difference for Disagree Trials by Advisor Type (all Ss combined)')
meanConfDiffWhenHuDisagree1 = mean(abs([data.confDiffWhenHuDisagree]).');
meanConfDiffWhenCompDisagree1 = mean(abs([data.confDiffWhenCompDisagree]).');
meanDisagreeTrialsBarGraph1 = [meanConfDiffWhenHuDisagree1 meanConfDiffWhenCompDisagree1];
bar(meanDisagreeTrialsBarGraph1, 0.4,'DisplayName','meanDisagreeTrialsBarGraph1');
title('Overall Confidence Difference for Disagree Trials by Advisor Type (all Ss combined)');
xticks([1 2]);
xticklabels({'Human','Computer'});
xlabel('Advisor Type (Disagree Trials)');
ylabel('Mean Abs Conf Diff (cj2-cj1)');
xlim([0 3]);
% ylim([0 12]);
% SEMean5 = [1.319229436,1.308464896];
stderror5 = std([data.confDiffWhenHuDisagree]).'/ sqrt(length([data.confDiffWhenHuDisagree]).');
stderror51 = std([data.confDiffWhenCompDisagree]).'/ sqrt(length([data.confDiffWhenCompDisagree]).');
SEMean5 = [stderror5,stderror51];
hold on
e = errorbar([1 2],[meanConfDiffWhenHuDisagree1 meanConfDiffWhenCompDisagree1],SEMean5);
hold off
e.Color = 'red';
e.LineWidth = 2;
legend('Advisor','Std Error');
legend('Location','northeast');
num2str5 = P5;
str5 = {'p =',{(num2str5)}};
text([.1 .2],[11.5 11.5],str5);  % when mean is abs
% text([.1 .2],[-1.5 -1.5],str5);    % for negative mean
grid on

% Difference in Agree vs. Disagree Trials for each Advisor Type, by participant
figure('Name','Confidence Difference in Agree vs. Disagree Trials for each Advisor Type');
confDiffWhenHuAgree = [data.confDiffWhenHuAgree].';
confDiffWhenCompAgree = [data.confDiffWhenCompAgree].';
confDiffWhenHuDisagree = (abs([data.confDiffWhenHuDisagree].'));
confDiffWhenCompDisagree = (abs([data.confDiffWhenCompDisagree].'));
agreeVsDisagreeTrialsBarGraph = [confDiffWhenHuAgree confDiffWhenCompAgree confDiffWhenHuDisagree confDiffWhenCompDisagree];
bar(agreeVsDisagreeTrialsBarGraph,'DisplayName','agreeVsDisagreeTrialsBarGraph');
ylim([0 30]);
xlabel('Participant');
xlim([0 26]);
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25]);
xticklabels({'311','312','313','314','315','316','317','318','319','320','321','322',...
    '323','324','325','326','327','328','329','330','331','332','333','334','335'});
ylabel('Mean Abs Conf Diff (cj2-cj1)');
title('Confidence Difference in Agree vs. Disagree Trials for each Advisor Type');
legend('Human Agree','Computer Agree','Human Disagree','Computer Disagree');
legend('Location','northeast');
grid on;

%% Notes:
% Look at CJ4 and CJ5...should I use something similar to the
% flippedConfDiff measure?
% When running this script with flippedConfDiff substituted for CJ3, Figure
% 9 comes out wiht no disagree values...why is that?
% Disagree chart (figure 8) is blank, as is Figure 6 (only for disagree
% information
% Figure 5 is inverted on the disagree side
