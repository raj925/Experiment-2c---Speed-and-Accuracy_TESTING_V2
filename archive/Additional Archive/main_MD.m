%% advisor Experiment 2b: Compare Algorithmic Advisors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% created by Aaron Celaya %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% aaron.celaya@new.ox.ac.uk
% This experiment will look at the differences in expressed confidence and
% advisor preference when participants have the choice of two different
% algorithmic advisors.  One advisor will have expressed confidence and the
% other will not.

% This experiment will proceed like the previous studies.  The first 3
% blocks (30 trials each) will give the participant practice with the task
% and will staircase the individual to approximately %70 accuracy.  After
% practice the dotdifference will be locked for the remainder of the
% experiment.

% Block 4 will be 60 forced trials where the participant will get practice
% with both advisors.  The observed accuracy of both advisors will be
% controlled at %70.

% The third part of the experiment is 6 blocks (60 trials each).  240
% trials are choice trials and 120 trials are forced trials.  Observed
% accuracy in the forced trials is controlled at %70.  Observed accuracy in
% the choice trials could vary based on selection.  However, the overall
% accuracy of advisors in the entirety of the choice trials tables is
% controlled at %70.

% As a note, the previous 'human advisor' is now the 'Computer 1' advisor.
% The algorithmic advisor is still such, but will be called 'Computer 2'
% throughout. Therefore all cj1, int1 and cor inputs for the three advisor
% tables need to be replaced.  Also, all of the previous algorithmic inputs
% need to be replaced with the new naming conventions.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% clear
clear all;
close all;
clc;
rawdata_path = 'rawdata/';
%% start ticking
tic
%% Subjects' details
create_subject_directory
%% All settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
settings                         = [];
% Reseed the random-number generator for each expt.
settings.resetrn                 = rng('shuffle');
settings.computer                = computer;
settings.scripts                 = getscripts(); % save scripts in settings;
%-- Input device
settings.response.until_release  = 1;
settings.response.escape         = 'ESCAPE';
settings.response.pause          = 'p';
%% default
if ~isfield(settings,'experimenter'),    settings.experimenter = 'space';end
if ~isfield(settings,'escape'),          settings.escape = 'ESCAPE';end
if ~isfield(settings,'pause'),           settings.pause = 'P';end
if ~isfield(settings,'until_release'),   settings.until_release = true;end
if ~isfield(settings,'restarted'),       settings.restarted = false;end
settings.do_instr = false;   % Setting added so instructions could be skipped while debugging
settings.cognitiveLoadManipulation = true;
settings.roomID = 2; % roomIDs: office = 1, Home = 2, BehLab = 3, EEG = 4, BonusRoom = 5
doQuestionnaires = false;
%% initialise variables
settings.ntrials         = 2; %number of experimental trials per block, should be 60
settings.nblocks         = 6; %number of experimental blocks, should be 6
settings.ntrialsprac     = 2; %number of practice trials per block, should be 30
settings.nblocksprac     = 3; %number of practice blocks, should be 3
settings.ntrialsNew4     = 2; %number of new block 4 trials, should be 60
settings.nblocksNew4     = 1;
settings.blk4expstart    = 4; %block number where the experimental portion begins, should be 4
settings.ntotalblocks    = settings.nblocks + settings.nblocksprac + settings.nblocksNew4; % there are 3 practice blocks and 6 experimental blocks making 9 blocks in total
settings.ntrialsall      = [repmat(settings.ntrialsprac,1,settings.nblocksprac)...
    repmat(settings.ntrialsNew4, 1, settings.nblocksNew4)...
    repmat(settings.ntrials, 1, settings.nblocks)];
w = (settings.nblocksprac*settings.ntrialsprac);  % Added 'w' variable for Block 4 to allow for changing number of practice trials
w4 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4); % adjustment for block 5
w5 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials); % Added 'wx' variable to allow RNG to start at one for block 6
w6 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*2); % Adjustment for Block 7
w7 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*3); % Adjustment for Block 8
w8 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*4); % Adjustment for Block 9
w9 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*5); % Adjustment for Block 10
% stimulus variables
settings.initialDotDifference    = 20;                                          % staircase initialization, should be 20
settings.stim.durstim            = .160;                                        % time first order stimulus is shown on screen
settings.stim.RSI2               = 1;                                           % time between confidence decision and next-t first-order stimulus presentation
settings.stim.beep               = sin(2*pi*(0:1/44100:.1)*1000);               % error tone
settings.stim.beeprate           = 22254;                                       % error tone rate
settings.stim.beepvolume         = .5;                                          % error tone volume
% define the grid for the placement of the dots:
settings.xymatrix = [repmat(linspace(-57,57,20),1,20);...
    sort(repmat(linspace(-57,57,20),1,20))];
% instructions on screen
settings.instr.cjtext        = {'50%' '60%' '70%' '80%' '90%' '100%'};
settings.instr.finaldecision = {'What is your final decision?'};
settings.instr.interval      = {'LEFT' 'RIGHT'};
settings.instr.groups        = [1 13 17 19 21];  % groupings of instruction slides
settings.rawdata_path        = rawdata_path;  % save paths in settings
% settings.question = [];
conditionVariable = round(rand(1)); %randomize condition
if conditionVariable == 0
    conditionVariable = 1;
elseif conditionVariable == 1
    conditionVariable = 2;
end
settings.condition = conditionVariable; % condition 1 is where Computer 1 has expressed confidence, condition 2 is where Computer 1 just answers left or right
%% Create Cognitive Load variables
[cognitiveLoadTable] = createCogLoadTable();
%% Build trials
build_trials
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% in case experiment was restarted after crash
if (subject.restart)
    [filename, pathname] = uigetfile('*.mat', 'Pick last saved file ');
    load([pathname filename]);
    starttrial = t;
    settings.restarted = 1;
else
    starttrial=1;
end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% start experiment %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sc = start_psychtb([0 0 1920 1200]);  % (0) for testing room or ([0 0 1300 600]) for troubleshooting or ([0 0 1920 1200]) for personal desktop *Resolution on testing machine is 1600x1200
% Set parameters based on which machine is being used
if settings.roomID == 1 % office
%     Screen('Preference', 'SkipSyncTests', 1);
    Sc = start_psychtb([0 0 1920 1200]);
elseif settings.roomID == 2 % home
    Screen('Preference', 'SkipSyncTests', 1);
    Sc = start_psychtb([0 0 1366 768]);
elseif settings.roomID >= 3 %3 = BehLab, 4 = EEG, 5 = BonusRoom
    Sc = start_psychtb(0);
end

if (doQuestionnaires)
settings.whichQuestionList = 3;
[settings] = questionnaireFunction(settings, Sc);

settings.whichQuestionList = 1;
[settings] = questionnaireFunction(settings, Sc);
end

%% Startup
% MD:
Sc.fps = 60;
settings.fps = Sc.fps;  % refresh rate (Hz). IMPORTANT! Make sure this value equals the RR of the screen used AND the RR in the start_psychtb.m function
settings.frame = (1/settings.fps); % average duration (ms) of a frame
if subject.id~=999 %a subject ID of 999 is for troubleshooting, when starting Matlab/Psychtoolbox only enter 999 and '0' (for not restarting)
    ListenChar(2);
    HideCursor();
end
%% define stimulus boxes (make them)
define_boxes
%% define confidence scale
define_scale_
%% Set priority for script execution to realtime priority:
priorityLevel=MaxPriority(Sc.window);
Priority(priorityLevel);
settings.startexp = GetSecs;
%%  initialize dotdifference
trials(1).dotdifference = settings.initialDotDifference;
trials(2).dotdifference = settings.initialDotDifference;
%% load advisor tables and create random tables
load('advisorChoiceTrials'); % Advisor tables, one advisor set for each dotdifference from 1:15, both advisors are 70% accurate
load('advisorForcedTrials'); % Same as above table, just a different set for the forced trials (trials 1:60 are for the human advisor and 61:120 are for the computer advisor for each dd)
load('advisorBlk4Trials.mat')

randomTrialSelectionBlock4 = randperm(60);
randomTrialSelectionBlock5 = randperm(60);
randomTrialSelectionBlock6 = datasample(61:120,60,'Replace',false);
randomTrialSelectionBlock7 = datasample(121:180,60,'Replace',false);
randomTrialSelectionBlock8 = datasample(181:240,60,'Replace',false);
randomTrialSelectionBlock9 = datasample(241:300,60,'Replace',false);
randomTrialSelectionBlock10 = datasample(301:360,60,'Replace',false);
randomizeChoiceTrials = randperm(240);
randomizeForcedTrials = randperm(120);
%% trial loop
for t = starttrial : length(trials)
    settings.currentTrial = t;
    settings.currentBlock = trials(t).block;
    %% experimenter output
    if t > 1
        disp(['t: ' num2str(t-1)])
        disp(['accuracy1: ' num2str(trials(t-1).cor1)])
        disp(['confidence1: ' num2str(trials(t-1).cj1)])
        disp('------------------------------------------');
    end
    trials(t).trialNumber = t;
    cognitiveLoadTable(t).trialNumber = t;
    %% instructions
    if(settings.do_instr)
        if trials(t).instr
            if t==1
                instructions(Sc, settings, 1)
            elseif trials(t).block==4
                instructions(Sc, settings, 2)
            elseif trials(t).block==5
                instructions (Sc, settings, 3)
            elseif trials(t).block==7
                instructions (Sc, settings, 4)
            end
        end
    end
    %% Cognitive Load Manipulation
    if (settings.cognitiveLoadManipulation)
        if trials(t).cogLoadManip == 1
%             cognitiveLoadTable(t).rightOrWrong = round(rand(1)); %if the 2nd stimulus will match or be different to the previous(0=not match, 1=match exactly)
%             if cognitiveLoadTable(t).rightOrWrong == 0
%                 % create variables for letter manipulation
%             end
%             
            cognitiveLoad
%         else
%             cognitiveLoadTable(t).cogLoadManip = 0;
%             cognitiveLoadTable(t).targetLetters = 0;
        end
    end

    %% randomize trials
    if trials(t).block >=4
        %         ShowCursor('Arrow');   % just for debugging
        if trials(t).block == 4
            randomTrialSelection = randomTrialSelectionBlock4(t-w);
            settings.trialType = 'forcedTrial';
            trials(t).trialType = 2;
        end
        
        if trials(t).block == 5
            randomTrialSelection = randomTrialSelectionBlock5(t-w4);
            if randomTrialSelection <= 40
                settings.trialType = 'choiceTrial';
                trials(t).trialType = 1;
            elseif randomTrialSelection >= 41
                settings.trialType = 'forcedTrial';
                trials(t).trialType = 2;
            end
        elseif trials(t).block == 6
            randomTrialSelection = randomTrialSelectionBlock6(t-w5);
            if randomTrialSelection >=61 && randomTrialSelection <=100
                settings.trialType = 'choiceTrial';
                trials(t).trialType = 1;
            elseif randomTrialSelection >=101 && randomTrialSelection <=120
                settings.trialType = 'forcedTrial';
                trials(t).trialType = 2;
            end
        elseif trials(t).block == 7
            randomTrialSelection = randomTrialSelectionBlock7(t-w6);
            if randomTrialSelection >=121 && randomTrialSelection <=160
                settings.trialType = 'choiceTrial';
                trials(t).trialType = 1;
            elseif randomTrialSelection >=161 && randomTrialSelection <=180
                settings.trialType = 'forcedTrial';
                trials(t).trialType = 2;
            end
        elseif trials(t).block == 8
            randomTrialSelection = randomTrialSelectionBlock8(t-w7);
            if randomTrialSelection >=181 && randomTrialSelection <=220
                settings.trialType = 'choiceTrial';
                trials(t).trialType = 1;
            elseif randomTrialSelection >=221 && randomTrialSelection <=240
                settings.trialType = 'forcedTrial';
                trials(t).trialType = 2;
            end
        elseif trials(t).block == 9
            randomTrialSelection = randomTrialSelectionBlock9(t-w8);
            if randomTrialSelection >=241 && randomTrialSelection <=280
                settings.trialType = 'choiceTrial';
                trials(t).trialType = 1;
            elseif randomTrialSelection >=281 && randomTrialSelection <=300
                settings.trialType = 'forcedTrial';
                trials(t).trialType = 2;
            end
        elseif trials(t).block == 10
            randomTrialSelection = randomTrialSelectionBlock10(t-w9);
            if randomTrialSelection >=301 && randomTrialSelection <=340
                settings.trialType = 'choiceTrial';
                trials(t).trialType = 1;
            elseif randomTrialSelection >=341 && randomTrialSelection <=360
                settings.trialType = 'forcedTrial';
                trials(t).trialType = 2;
            end
        end
        trials(t).randTrialSelect = randomTrialSelection;
        if trials(t).trialType == 1     % Choice trial
            adjustChoiceCounter = sum([trials(:).choiceTrial])+1;  % Starts by pulling the first random choice trial from the 'randomizeChoiceTrials' RNG
            randChoiceTrial = randomizeChoiceTrials(adjustChoiceCounter);
            trials(t).choiceTrial = 1;
            trials(t).forcedTrial = 0;
            trials(t).forcedAdvisor = 0;
            trials(t).randChoiceTrial = randChoiceTrial;
            trials(t).randForcedTrials = NaN;
            trials(t).forcedAdvisorType = NaN;
        end
        if trials(t).trialType == 2    % Forced trial
            if trials(t).block == 4
                adjustForcedCounter = sum([trials(:).forcedTrial])+1;  % Starts by pulling the first forced choice trial from the 'randomizeForcedTrials' RNG
                randForcedTrial = randomTrialSelectionBlock4(adjustForcedCounter);
                trials(t).randChoiceTrial = NaN;
                trials(t).randForcedTrials = randForcedTrial;
                if randForcedTrial <= 30
                    randomForcedAdvisorChoice = 0;
                elseif randForcedTrial >= 31
                    randomForcedAdvisorChoice = 1;
                end
            elseif trials(t).block >= 5
                adjustForcedCounter = sum([trials(:).forcedTrial])+1-settings.ntrialsNew4;  % Starts by pulling the first forced choice trial from the 'randomizeForcedTrials' RNG
                randForcedTrial = randomizeForcedTrials(adjustForcedCounter);
                trials(t).randChoiceTrial = NaN;
                trials(t).randForcedTrials = randForcedTrial;
                if randForcedTrial <= 60
                    randomForcedAdvisorChoice = 0;
                elseif randForcedTrial >= 61
                    randomForcedAdvisorChoice = 1;
                end
            end
            
            trials(t).choiceTrial = 0;
            trials(t).forcedTrial = 1;
            trials(t).forcedAdvisor = 1;
            if randomForcedAdvisorChoice == 0 % Meaning, if the selected randomForcedAdvisor value from the RNG is even, then proceed
                forcedAdvisorType = 'comp1Advisor';
                settings.forcedAdvisorType = 'comp1Advisor';
                trials(t).forcedAdvisorType = 'comp1Advisor';
            elseif randomForcedAdvisorChoice == 1 % Or if it's odd, proceed here
                forcedAdvisorType = 'comp2Advisor';
                settings.forcedAdvisorType = 'comp2Advisor';
                trials(t).forcedAdvisorType = 'comp2Advisor';
            end
        end
    end
    %% start trial
    % Clear screen to background color
    draw_static(Sc,settings)
    trials(t).time_starttrial = Screen('Flip',Sc.window);
    if t == 1 || subject.restart == 1 || trials(t).break == 1, time = GetSecs; end
    if trials(t).block == settings.blk4expstart              % Should be block 4
        practiceDD = [trials(1:w-1).dotdifference]; % Creates an average DD based on the final DD and the lowest DD attained in blocks 1:3
        lowestpracticeDD = min(practiceDD);
        finalDD = trials(w).dotdifference;
        averagefinalDD = (lowestpracticeDD + finalDD)/2;
        adjustedDD = fix(averagefinalDD);
        if adjustedDD >= 16
            adjustedDD = 15; % There are no advisors over dotdifference of 15, hence if the subject is over a 15 DD, they will be fixed to 15 DD
        end
    end
    if trials(t).block == 4
        trials(t).wherelarger = advisorBlk4Trials(adjustedDD).wherelarger(randForcedTrial,1);
    end
    
    
    if trials(t).block >=5
        if settings.trialType == 'choiceTrial'
            trials(t).wherelarger = advisorChoiceTrials(adjustedDD).wherelarger(randChoiceTrial,1);
        elseif settings.trialType == 'forcedTrial'
            trials(t).wherelarger = advisorForcedTrials(adjustedDD).wherelarger(randForcedTrial,1);
        end
    end
    if t<=2
        larger = 200 + trials(t).dotdifference;
        smaller = 200 - trials(t).dotdifference;
        trials(t).wheredots(trials(t).wherelarger,randsample(400,larger)) = 1; % dots have to be set in the squares (randomized)
        trials(t).wheredots(3-trials(t).wherelarger,randsample(400,smaller)) = 1;
        trials(t).wheredots = logical(trials(t).wheredots);     % vectors are created that contain logical values to tell where
    end
    if t>2
        switch trials(t).staircase
            case 1
                trials(t).dotdifference = staircase([trials(t-2).cor1 trials(t-1).cor1], [trials(t-2).dotdifference trials(t-1).dotdifference]);
                
                larger = 200 + trials(t).dotdifference;
                smaller = 200 - trials(t).dotdifference;
                trials(t).wheredots(trials(t).wherelarger,randsample(400,larger)) = 1;
                trials(t).wheredots(3-trials(t).wherelarger,randsample(400,smaller)) = 1;
                trials(t).wheredots = logical(trials(t).wheredots);
            case 2
                trials(t).dotdifference = adjustedDD;
                trials(t).wheredots = advisorBlk4Trials(adjustedDD).wheredots{randForcedTrial,1};
                trials(t).wheredots = logical(trials(t).wheredots);
            case 3
                trials(t).dotdifference = adjustedDD;
                if settings.trialType == 'choiceTrial'
                    trials(t).wheredots = advisorChoiceTrials(adjustedDD).wheredots{randChoiceTrial,1};
                    trials(t).wheredots = logical(trials(t).wheredots);
                    
                elseif settings.trialType == 'forcedTrial'
                    trials(t).wheredots = advisorForcedTrials(adjustedDD).wheredots{randForcedTrial,1};
                    trials(t).wheredots = logical(trials(t).wheredots);
                end
        end
    end
    %% stimulus presentation
    Screen('DrawLines',Sc.window,innerrect1out,3,255);
    Screen('DrawLines',Sc.window,innerrect2out,3,255);
    Screen('DrawDots', Sc.window, settings.xymatrix(:,squeeze(trials(t).wheredots(1,:))), 2, 255, center1, 2);
    Screen('DrawDots', Sc.window, settings.xymatrix(:,squeeze(trials(t).wheredots(2,:))), 2, 255, center2, 2);
    draw_static(Sc,settings)
    if t>1
        if trials(t-1).feedback == 1 || trials(t-1).instr == 1
            pause(1);
        end
    end
    % Show stimulus on screen at next possible display refresh cycle, and record stimulus onset time in 'onsetstim':
    t2flip = time + settings.stim.RSI2 - settings.frame;
    [trials(t).VBLTimestampOnsetStim, trials(t).onsetstim, FlipTimestamp, trials(t).tmissed_onset1] = Screen('Flip', Sc.window, t2flip);
    % stimulus is shown for 160 ms and the screen turns blank again no response collection before 160 ms
    draw_static(Sc,settings)
    t2flip = trials(t).onsetstim + settings.stim.durstim - settings.frame;
    [trials(t).VBLTimestampOffsetStim, trials(t).offsetstim, Fts, trials(t).tmissed_offset1] = Screen('Flip',Sc.window, t2flip);
    
    %% subject decision point
    settings.whichAdvisor = NaN; % no advisor recommendation here
    [trials(t).cj1, trials(t).resp1_t, trials(t).int1, trials(t).responded1] = drag_slider_im(Sc,settings);
    trials(t).cor1 = trials(t).int1 == trials(t).wherelarger;  % define accuracy
    trials(t).rt1 = trials(t).resp1_t - trials(t).offsetstim;  % define reaction times
    time = trials(t).resp1_t;
    %% present advisor options
    if trials(t).block>=4
        whichAdvisorLocation = round(rand);
        if whichAdvisorLocation == 0
            stmRect1 = [Sc.rect(3)/2-75 Sc.rect(4)/2-260 Sc.rect(3)/2+75 Sc.rect(4)/2-60];
            stmRect2 = [Sc.rect(3)/2-75 Sc.rect(4)/2+60 Sc.rect(3)/2+75 Sc.rect(4)/2+260];
        elseif whichAdvisorLocation ==  1
            stmRect1 = [Sc.rect(3)/2-75 Sc.rect(4)/2+60 Sc.rect(3)/2+75 Sc.rect(4)/2+260];
            stmRect2 = [Sc.rect(3)/2-75 Sc.rect(4)/2-260 Sc.rect(3)/2+75 Sc.rect(4)/2-60];
        end
        
        Screen('TextSize',Sc.window,11);
        if settings.trialType == 'choiceTrial'
            %  Computer 1 Advisor
            Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
            [nx, ny, textbounds] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1); % EEG value is *.7
            Screen('TextSize',Sc.window, [48]);
            Screen('TextStyle', Sc.window, [1]);
            if settings.condition == 1
                [nx, ny, textbounds] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1); % EEG value is *.5
            elseif settings.condition == 2
                [nx, ny, textbounds] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1); % EEG value is *.5
            end
            
            % Computer 2 Advisor
            Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
            Screen('TextSize', Sc.window, 13);
            Screen('TextStyle', Sc.window, [0]);
            [nx, ny, textbounds] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
            Screen('TextSize',Sc.window, [48]);
            Screen('TextStyle', Sc.window, [1]);
            if settings.condition == 1
                [nx, ny, textbounds] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
            elseif settings.condition == 2
                [nx, ny, textbounds] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
            end
            
            Screen('TextSize', Sc.window, 13);
            Screen('TextStyle', Sc.window, [0]);
            
        elseif settings.trialType == 'forcedTrial'
            if forcedAdvisorType == 'comp1Advisor'
                Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                [nx, ny, textbounds] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                Screen('TextSize',Sc.window, [48]);
                Screen('TextStyle', Sc.window, [1]);
                if settings.condition == 1
                    [nx, ny, textbounds] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                elseif settings.condition == 2
                    [nx, ny, textbounds] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                end
                
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, [0]);
            elseif forcedAdvisorType == 'comp2Advisor'
                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                [nx, ny, textbounds] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                Screen('TextSize',Sc.window, [48]);
                Screen('TextStyle', Sc.window, [1]);
                if settings.condition == 1
                    [nx, ny, textbounds] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                elseif settings.condition == 2
                    [nx, ny, textbounds] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                end
                
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, [0]);
            end
        end
        add_fixation
        draw_static(Sc,settings)
        Screen('Flip', Sc.window);
        optRects = [stmRect1; stmRect2];
        ShowCursor('Arrow');
        if settings.trialType == 'forcedTrial'
            while 1
                [x,y,buttons] = GetMouse;
                if(buttons(1))
                    % if left button pressed check if inside a rectangle
                    diffs = [x - optRects(:,1) y - optRects(:,2) optRects(:,3) - x optRects(:,4) - y];
                    diffs_sign = sign(diffs);  diffs_sign_sum = sum(diffs_sign, 2);
                    sum4 = find(diffs_sign_sum == 4);
                    if(~isempty(sum4))
                        if forcedAdvisorType == 'comp1Advisor'
                            Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                            whichAdvisor = 1;
                        elseif forcedAdvisorType == 'comp2Advisor'
                            Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                            whichAdvisor = 2;
                        end
                        Screen('Flip', Sc.window);
                        % wait for mouse release
                        while 1, [x,y,buttons] = GetMouse; if(~buttons(1)), break; end, end
                        break;
                    end
                end
            end
        elseif settings.trialType == 'choiceTrial'
            while 1
                [x,y,buttons] = GetMouse;
                if(buttons(1))
                    % if left button pressed check if inside a rectangle
                    diffs = [x - optRects(:,1) y - optRects(:,2) optRects(:,3) - x optRects(:,4) - y];
                    diffs_sign = sign(diffs);  diffs_sign_sum = sum(diffs_sign, 2);
                    sum4 = find(diffs_sign_sum == 4);
                    if(~isempty(sum4))
                        whichAdvisor = sum4;
                        switch whichAdvisor
                            case 1,
                                Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                            case 2,
                                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                        end
                        Screen('Flip', Sc.window);
                        % wait for mouse release
                        while 1, [x,y,buttons] = GetMouse; if(~buttons(1)), break; end, end
                        break;
                    end
                end
            end
        end
        % get second response while recommendation is on screen
        if trials(t).block == 4
            trials(t).algorithm1Answer = advisorBlk4Trials(adjustedDD).algorithm1Answer(randForcedTrial,1);
            settings.algorithm1Answer = advisorBlk4Trials(adjustedDD).algorithm1Answer(randForcedTrial,1);
            trials(t).algorithm1Correct = advisorBlk4Trials(adjustedDD).algorithm1Correct(randForcedTrial,1);
            trials(t).algorithm1Confidence = advisorBlk4Trials(adjustedDD).algorithm1Confidence(randForcedTrial,1);
            settings.algorithm1Confidence = advisorBlk4Trials(adjustedDD).algorithm1Confidence(randForcedTrial,1);
            trials(t).algorithm2Answer = advisorBlk4Trials(adjustedDD).algorithm2Answer(randForcedTrial,1);
            settings.algorithm2Answer = advisorBlk4Trials(adjustedDD).algorithm2Answer(randForcedTrial,1);
            trials(t).algorithm2Correct = advisorBlk4Trials(adjustedDD).algorithm2Correct(randForcedTrial,1);
            trials(t).algorithm2Confidence = advisorBlk4Trials(adjustedDD).algorithm2Confidence(randForcedTrial,1);
            settings.algorithm2Confidence = advisorBlk4Trials(adjustedDD).algorithm2Confidence(randForcedTrial,1);
        end
        if trials(t).block >= 5
            if settings.trialType == 'choiceTrial'
                trials(t).algorithm1Answer = advisorChoiceTrials(adjustedDD).algorithm1Answer(randChoiceTrial,1);
                settings.algorithm1Answer = advisorChoiceTrials(adjustedDD).algorithm1Answer(randChoiceTrial,1);
                trials(t).algorithm1Correct = advisorChoiceTrials(adjustedDD).algorithm1Correct(randChoiceTrial,1);
                trials(t).algorithm1Confidence = advisorChoiceTrials(adjustedDD).algorithm1Confidence(randChoiceTrial,1);
                settings.algorithm1Confidence = advisorChoiceTrials(adjustedDD).algorithm1Confidence(randChoiceTrial,1);
                trials(t).algorithm2Answer = advisorChoiceTrials(adjustedDD).algorithm2Answer(randChoiceTrial,1);
                settings.algorithm2Answer = advisorChoiceTrials(adjustedDD).algorithm2Answer(randChoiceTrial,1);
                trials(t).algorithm2Correct = advisorChoiceTrials(adjustedDD).algorithm2Correct(randChoiceTrial,1);
                trials(t).algorithm2Confidence = advisorChoiceTrials(adjustedDD).algorithm2Confidence(randChoiceTrial,1);
                settings.algorithm2Confidence = advisorChoiceTrials(adjustedDD).algorithm2Confidence(randChoiceTrial,1);
            elseif settings.trialType == 'forcedTrial'
                trials(t).algorithm1Answer = advisorForcedTrials(adjustedDD).algorithm1Answer(randForcedTrial,1);
                settings.algorithm1Answer = advisorForcedTrials(adjustedDD).algorithm1Answer(randForcedTrial,1);
                trials(t).algorithm1Correct = advisorForcedTrials(adjustedDD).algorithm1Correct(randForcedTrial,1);
                trials(t).algorithm1Confidence = advisorForcedTrials(adjustedDD).algorithm1Confidence(randForcedTrial,1);
                settings.algorithm1Confidence = advisorForcedTrials(adjustedDD).algorithm1Confidence(randForcedTrial,1);
                trials(t).algorithm2Answer = advisorForcedTrials(adjustedDD).algorithm2Answer(randForcedTrial,1);
                settings.algorithm2Answer = advisorForcedTrials(adjustedDD).algorithm2Answer(randForcedTrial,1);
                trials(t).algorithm2Correct = advisorForcedTrials(adjustedDD).algorithm2Correct(randForcedTrial,1);
                trials(t).algorithm2Confidence = advisorForcedTrials(adjustedDD).algorithm2Confidence(randForcedTrial,1);
                settings.algorithm2Confidence = advisorForcedTrials(adjustedDD).algorithm2Confidence(randForcedTrial,1);
            end
        end
        settings.whichAdvisor = whichAdvisor;
        settings.stmRect1 = stmRect1;
        settings.stmRect2 = stmRect2;
        [trials(t).cj2, trials(t).resp2_t, trials(t).int2, trials(t).responded2] = drag_slider_im(Sc,settings,trials(t).cj1);
        trials(t).whichAdvisor = whichAdvisor;
    end
    
    %% Post Advisor Decision
    if trials(t).block>=4
        time = GetSecs;
        trials(t).cor2 = trials(t).int2 == trials(t).wherelarger;  % define accuracy
        trials(t).rt2 = trials(t).resp2_t - time;  % define reaction times
        time = trials(t).resp2_t;
    else
        trials(t).cj2 = NaN;
        trials(t).resp2_t = NaN;
        trials(t).int2 = NaN;
        trials(t).responded2 =0;
        trials(t).cor2 = NaN;
        trials(t).rt2  = NaN;
    end
    %% compute timing variables
    trials(t).act_stimdur = trials(t).offsetstim - trials(t).onsetstim;
    %% Give Advisor values NaN until after block 3
    if trials(t).block<=3
        trials(t).choiceTrial = 0;
        trials(t).forcedTrial = 0;
        trials(t).forcedAdvisor = 0;
        trials(t).algorithm1Answer = NaN;
        trials(t).algorithm1Correct = NaN;
        trials(t).algorithm1Confidence = NaN;
        trials(t).algorithm2Answer = NaN;
        trials(t).algorithm2Correct = NaN;
        trials(t).algorithm2Confidence = NaN;
        trials(t).whichAdvisor = NaN;
        trials(t).trialType = NaN;
        trials(t).randChoiceTrial = NaN;
        trials(t).randForcedTrials = NaN;
        trials(t).forcedAdvisorType = NaN;
        trials(t).randTrialSelect = NaN;
    end
    %% close audio/screen buffers
    Screen('Close');
    %% error feedback with a beep
    if trials(t).block <= 3
        if trials(t).cor1 == 0
            Beeper(1000,.4,.5);
        end
    elseif  trials(t).block >= 4
        if trials(t).cor2 == 0
            Beeper(1000,.4,.5);
        end
    end
    %% save and break
    if trials(t).break
        %-- Save data every 20th trials
        save([rawdata_path subject.dir '/behaviour/' subject.fileName '_' num2str(round(t/20))],'trials', 'settings', 'subject', 't')
        %-- break
        Screen('TextSize',Sc.window,18);
        DrawFormattedText(Sc.window, 'Break. Press button to continue','center', 'center', [0 0 0]);
        Screen('Flip', Sc.window);
        pause(1);
        collect_response(settings.response, inf);
    end
    %% feedback
    if trials(t).feedback % give overall feedback only once in a while
        feedback_interblock;
    end
end
%% collect questionnaire
if (doQuestionnaires)
settings.whichQuestionList = 3;
[settings] = questionnaireFunction(settings, Sc);
end
%% save final file
save([rawdata_path subject.dir '/behaviour/' subject.fileName '_final'], 'subject','settings','trials');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Thanks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

insimdata = imread(char('Slide21.JPG'));
texins = Screen('MakeTexture', Sc.window, insimdata);
Screen('DrawTexture', Sc.window, texins);
Screen('Flip',Sc.window);
WaitSecs(.500);
KbWait;
%% close PTB
Screen('CloseAll');
ListenChar(0);
DisableKeysForKbCheck([]);
ShowCursor()
Priority(0);
toc
