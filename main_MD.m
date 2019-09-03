    %% advisor Experiment 2c: Speed and Accuracy %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% created by Sriraj Aiyer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sriraj.aiyer@psy.ox.ac.uk

% This experiment will look at the differences in expressed confidence and 
% advisor choice when participants are encouraged to prioritise either
% speed or accuracy for a given block, attempting to encourage System 2 
% thinking.

% This experiment will proceed like the previous studies.  The first 3
% blocks (30 trials each) will give the participant practice with the task
% and will staircase the individual to approximately %70 accuracy.  After
% practice the dotdifference will be locked for the remainder of the
% experiment.

% Block 4 will be 60 forced trials where the participant will get practice
% with both advisors.  The observed accuracy of both advisors will be
% controlled at %70. 

% Blocks 5 and 6 are 20 forced and 40 choice trials for the advisors.

% Blocks 7-8 and 9-10 are one of the speed or accuracy blocks (order
% depends on whether subject id is even or odd). Trial types are the same
% as blocks 5-6. The speed block enforces a time limit on cj2 responses,
% calculated by finding the median response time from blocks 5-6. The
% accuracy block uses the accuracy of block 5-6 cj1 responses as a
% threshold for blocks 7-10 cj2 responses, with participants rewarded for
% performing better than the threshold.
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% clear
close all;
clc;
settings.rawdata_path = 'rawdata/';  % save paths in settings
%% start ticking
tic
%% Subjects' details
[subject] = createSubjectDirectory(settings);
%% Initial settings
settings.betaTesting = false; % Setting to switch between #of trials for debugging or regular use
settings.do_instr = true;   % Setting to skip instructions while debugging
settings.speedAndAccuracyManip = true;           
settings.roomID = 4;  %1=office,2=home,3=BehLab,4=EEG,5=BonusRoom
settings.doQuestionnaires = true; % Turn questionnaires on/off
%% Create starting settings
[settings] = createSettings(settings);
%% Build trials
[trials] = buildTrialsStruct(settings);
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
% Set parameters based on which machine is being used
if settings.roomID == 1 % office
    Sc = start_psychtb([0 0 1920 1200]);
elseif settings.roomID == 2 % home
    Screen('Preference', 'SkipSyncTests', 1);
    Sc = start_psychtb([0 0 1366 768]);
elseif settings.roomID == 3 %3 = BehLab, 4 = EEG, 5 = BonusRoom
    Sc = start_psychtb(0);
elseif settings.roomID == 4 % Macbook
    Screen('Preference', 'SkipSyncTests', 1);
    Screen('Preference', 'TextRenderer', 0);
    Sc = start_psychtb([0 0 1440 900]);
elseif settings.roomID == 5 %Group tesing room
    Sc = start_psychtb([0 0 1920 1080]);
end

if (settings.doQuestionnaires)
    settings.whichQuestionList = 1;
    [settings] = questionnaireFunction(settings, Sc);
    
    settings.whichQuestionList = 2;     
    [settings] = questionnaireFunction(settings, Sc);
end


subjectEvenOdd = mod(subject.id,2);
if subjectEvenOdd == 0 % Even subject.id number
    settings.SCACCondition = 1; % 1 is speed for blocks 7-8, acc for 9-10
elseif subjectEvenOdd == 1 % Odd subject.id number
    settings.SCACCondition = 2; % 2 is acc for blocks 7-8, speed for 9-10
end

spaceKey  = KbName('space');
settings.instr.instr = {'Left click with the mouse' ...
    'Press spacebar to confirm response'};
ShowCursor('Arrow');

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
                space = 'Press Space to begin.';
                c = newline;
                if settings.SCACCondition == 1
                    Screen('TextSize',Sc.window,18);
                    textline = ['In the next block, there will be a strict time limit applied to part of the decision made on each trial.' c c 'Specifically, you will have limited time from when you are first given a choice of advisors to when you commit to a final decision.' c c 'You will not be able to answer after the time limit has elapsed, so please attempt to indicate your final answer in time.' c c 'To help you do this, the fixation cross in the middle of the screen will turn red when you have a short amount of time left.'];
                    textline = [textline c c space];
                    DrawFormattedText(Sc.window, textline,'center', 'center', [0 0 0]);
                    Screen('Flip', Sc.window);
                    pause(1);
                    collect_response(settings.response, inf);
                elseif settings.SCACCondition == 2
                    Screen('TextSize',Sc.window,18);
                    textline = ['In the next block, you will be rewarded for your performance (and not timed).' c c 'Specifically, you can earn extra money at the end of the experiment based on the accuracy of your final decision (after receiving advice) on each trial.' c c 'The more accurate you are on these final decisions, the more rewards you will earn.'];
                    textline = [textline c c space]; 
                    DrawFormattedText(Sc.window, textline,'center', 'center', [0 0 0]);
                    Screen('Flip', Sc.window);
                    pause(1);
                    collect_response(settings.response, inf);
                end
            end
        end
    end

    %% Speed and Accuracy Manipulation
    
    % If this is a speed/accuracy experiment, set in the settings flags
    % above.
    if t < trials(end).trialNumber & (settings.speedAndAccuracyManip) == 1
        trial7Marker = (settings.nblocksprac * settings.ntrialsprac) + (3*settings.ntrials) + 1;
        numOfTrials = (settings.ntrials*2);
        trial9Marker = trial7Marker+numOfTrials;
        % Depending on subject condition, set flags for speed and acc in
        % the relevant blocks. 
        if settings.SCACCondition == 1
            for x = trial7Marker:trial9Marker
                trials(x).speedManip = 1;
                trials(x).accManip = 0;
            end
            for y = trial9Marker:trial9Marker+numOfTrials
                trials(y).accManip = 1;
                trials(y).speedManip = 0;
            end
        else
            for x = trial7Marker:trial9Marker
                trials(x).accManip = 1;
                trials(x).speedManip = 0;
            end
            for y = trial9Marker:trial9Marker+numOfTrials
                trials(y).speedManip = 1;
                trials(y).accManip = 0;
            end
        end
        % Preallocate struct for recording data from the speed and accuracy
        % manipulations.
        speedAccTable = struct('block', cell(1,4), 'block5Accuracy', cell(1,4),...
        'block6Accuracy', cell(1,4), 'block5Speed', cell(1,4), 'block6Speed', cell(1,4),...
        'speThreshold', cell(1,4), 'accThreshold', cell(1,4), 'numOfTimeRunouts', cell(1,4),...
        'currentBlockAcc', cell(1,4), 'currentBlockSpeed', cell(1,4), 'accDiff', cell(1,4), 'reward', cell(1,4));
        for i = 1:4 % Add block number to speedAccTable
            speedAccTable(i).block = i+6;
        end
    end                                                                                                                                                                                                                                    

    %% start trial
    % Clear screen to background color
    draw_static(Sc,settings)
    trials(t).time_starttrial = Screen('Flip',Sc.window);
    reso = get(0,'ScreenSize');
    SetMouse(reso(:,3)/2, reso(:,4)/2);
    if t == 1 || subject.restart == 1 || trials(t).break == 1, time = GetSecs; end
    if trials(t).block == settings.blk4expstart              % Should be block 4
        practiceDD = [trials(1:settings.w-1).dotdifference]; % Creates an average DD based on the final DD and the lowest DD attained in blocks 1:3
        lowestpracticeDD = min(practiceDD);
        finalDD = trials(settings.w).dotdifference;
        averagefinalDD = (lowestpracticeDD + finalDD)/2;
        adjustedDD = fix(averagefinalDD);
        if adjustedDD >= 16
            adjustedDD = 15; % There are no advisors over dotdifference of 15, hence if the subject is over a 15 DD, they will be fixed to 15 DD
        end
        settings.adjustedDD = adjustedDD;
        [trials] = buildTrialsStruct(settings,trials);
    end
    % Create stimulus dots, randomly distribute, and make values logical
    % Occurs during practice blocks only.
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
                % removed actions, placed in buildTrialsStruct
            case 3
                % removed actions, placed in buildTrialsStruct
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
    %     settings.whichAdvisor = NaN; % no advisor recommendation here
    [trials(t).cj1, trials(t).resp1_t, trials(t).int1, trials(t).responded1] = drag_slider_im(Sc,settings);
    trials(t).cor1 = trials(t).int1 == trials(t).wherelarger;  % define accuracy
    trials(t).rt1 = trials(t).resp1_t - trials(t).offsetstim;  % define reaction times
    time = trials(t).resp1_t;
    %% present advisor options
    if trials(t).block>=4
        whichAdvisorLocation = round(rand);
        if whichAdvisorLocation == 0
            stmRect1 = [Sc.rect(3)/2-75 Sc.rect(4)/2-260 Sc.rect(3)/2+75 Sc.rect(4)/2-60];
            topBox = [Sc.rect(3)/2-75 Sc.rect(4)/2-260 Sc.rect(3)/2+75 Sc.rect(4)/2-60];
            stmRect2 = [Sc.rect(3)/2-75 Sc.rect(4)/2+60 Sc.rect(3)/2+75 Sc.rect(4)/2+260];
            bottomBox = [Sc.rect(3)/2-75 Sc.rect(4)/2+60 Sc.rect(3)/2+75 Sc.rect(4)/2+260];
        elseif whichAdvisorLocation ==  1
            stmRect1 = [Sc.rect(3)/2-75 Sc.rect(4)/2+60 Sc.rect(3)/2+75 Sc.rect(4)/2+260];
            bottomBox = [Sc.rect(3)/2-75 Sc.rect(4)/2+60 Sc.rect(3)/2+75 Sc.rect(4)/2+260];
            stmRect2 = [Sc.rect(3)/2-75 Sc.rect(4)/2-260 Sc.rect(3)/2+75 Sc.rect(4)/2-60];
            topBox = [Sc.rect(3)/2-75 Sc.rect(4)/2-260 Sc.rect(3)/2+75 Sc.rect(4)/2-60];
        end
        trials(t).whichAdvisorLocation = whichAdvisorLocation;
        Screen('TextSize',Sc.window,11);
        if trials(t).trialType == 1 % Choice Trial
            %  Computer 1 Advisor
            Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
            [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1); % EEG value is *.7
            Screen('TextSize',Sc.window, 48);
            Screen('TextStyle', Sc.window, 1);
            if settings.condition == 1
                [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1); % EEG value is *.5
            elseif settings.condition == 2
                [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1); % EEG value is *.5
            end
            
            % Computer 2 Advisor
            Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
            Screen('TextSize', Sc.window, 13);
            Screen('TextStyle', Sc.window, 0);
            [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
            Screen('TextSize',Sc.window, 48);
            Screen('TextStyle', Sc.window, 1);
            if settings.condition == 1
                [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
            elseif settings.condition == 2
                [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
            end
            
            Screen('TextSize', Sc.window, 13);
            Screen('TextStyle', Sc.window, 0);
            
        elseif trials(t).trialType == 2 % Forced Trial
            if trials(t).forcedAdvisorType == 'comp1Advisor'
                Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                Screen('TextSize',Sc.window, 48);
                Screen('TextStyle', Sc.window, 1);
                if settings.condition == 1
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                elseif settings.condition == 2
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                end
                
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, 0);
            elseif trials(t).forcedAdvisorType == 'comp2Advisor'
                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                Screen('TextSize',Sc.window, 48);
                Screen('TextStyle', Sc.window, 1);
                if settings.condition == 1
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                elseif settings.condition == 2
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                end
                
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, 0);
            end
        end
        add_fixation
        draw_static(Sc,settings)
        Screen('Flip', Sc.window);
        advisorOnset = GetSecs;
        trials(t).advisorOnset = advisorOnset;
        optRects = [stmRect1; stmRect2];
        ShowCursor('Arrow');
        if trials(t).trialType == 2 % Forced Trial
            while 1
                [x,y,buttons] = GetMouse;
                if(buttons(1))
                    % if left button pressed check if inside a rectangle
                    diffs = [x - optRects(:,1) y - optRects(:,2) optRects(:,3) - x optRects(:,4) - y];
                    diffs_sign = sign(diffs);  diffs_sign_sum = sum(diffs_sign, 2);
                    sum4 = find(diffs_sign_sum == 4);
                    if(~isempty(sum4))
                        if trials(t).forcedAdvisorType == 'comp1Advisor'
                            Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                            whichAdvisor = 1;
                            if trials(t).whichAdvisorLocation == 0
                                trials(t).whichBox = 1;
                            elseif trials(t).whichAdvisorLocation == 1
                                trials(t).whichBox = 2;
                            end
                        elseif trials(t).forcedAdvisorType == 'comp2Advisor'
                            Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                            whichAdvisor = 2;
                            if trials(t).whichAdvisorLocation == 0
                                trials(t).whichBox = 2;
                            elseif trials(t).whichAdvisorLocation == 1
                                trials(t).whichBox = 1;
                            end
                        end
                        Screen('Flip', Sc.window);
                        % wait for mouse release
                        while 1, [x,y,buttons] = GetMouse; if(~buttons(1)), break; end, end
                        advisorChosen = GetSecs;
                        trials(t).advisorChosen = advisorChosen;
                        trials(t).advisorRT = advisorChosen - advisorOnset;
                        break;
                    end
                end
            end
        elseif trials(t).trialType == 1 % Choice Trial
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
                            case 1
                                Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                                if trials(t).whichAdvisorLocation == 0
                                    trials(t).whichBox = 1;
                                elseif trials(t).whichAdvisorLocation == 1
                                    trials(t).whichBox = 2;
                                end
                            case 2
                                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                                if trials(t).whichAdvisorLocation == 0
                                    trials(t).whichBox = 2;
                                elseif trials(t).whichAdvisorLocation == 1
                                    trials(t).whichBox = 1;
                                end
                        end
                        Screen('Flip', Sc.window);
                        % wait for mouse release
                        while 1, [x,y,buttons] = GetMouse; if(~buttons(1)), break; end, end
                        advisorChosen = GetSecs;
                        trials(t).advisorChosen = advisorChosen;
                        trials(t).advisorRT = advisorChosen - advisorOnset;
                        break;
                    end
                end
            end
        end
        % get second response while recommendation is on screen
        if trials(t).block >= 4
            settings.trialType = trials(t).trialType;
            settings.forcedAdvisorType = trials(t).forcedAdvisorType;
            settings.algorithm1Answer =  trials(t).algorithm1Answer;
            settings.algorithm1Confidence = trials(t).algorithm1Confidence;
            settings.algorithm2Answer = trials(t).algorithm2Answer;
            settings.algorithm2Confidence = trials(t).algorithm2Confidence;
        end
        settings.whichAdvisor = whichAdvisor;
        settings.stmRect1 = stmRect1;
        settings.stmRect2 = stmRect2;
        [trials(t).cj2, trials(t).resp2_t, trials(t).int2, trials(t).responded2] = drag_slider_im(Sc,settings,trials(t).resp1_t,trials(t).speedManip,speedAccTable(1).speThreshold,whichAdvisor,stmRect1,stmRect2,trials(t).cj1);
        trials(t).whichAdvisor = whichAdvisor;  
    end
    
    %% Post Advisor Decision
    if trials(t).block>=4
        time = GetSecs;
        trials(t).cor2 = trials(t).int2 == trials(t).wherelarger;  % define accuracy
        trials(t).rt2 = trials(t).resp2_t - time;  % define reaction times
        time = trials(t).resp2_t;
        trials(t).time_endtrial = time;
        trials(t).time_trialTime = trials(t).time_endtrial - trials(t).time_starttrial;
        trials(t).ctcTime = trials(t).resp2_t - trials(t).resp1_t;
        % did the participant run out of time on this trial?
        if trials(t).block >= 4
            if trials(t).block < 7
                trials(t).timeRanOut = 0;
            else
                if isempty(trials(t).resp2_t)
                    trials(t).timeRanOut = 1;
                    trials(t).ctcTime = 0;
                else
                    trials(t).timeRanOut = 0;                
                end
            end
        end
    end
    %% compute timing variables
    trials(t).act_stimdur = trials(t).offsetstim - trials(t).onsetstim;
    %% close audio/screen buffers
    Screen('Close');
    %% error feedback with a beep
    if trials(t).block <= 3
        if trials(t).cor1 == 0
            Beeper(1000,.4,.5);
        end
    elseif  trials(t).block >= 4
        if trials(t).cor2 == 0
            if trials(t).timeRanOut ~= 1
                Beeper(1000,.4,.5);
            end
        end
    end
    %% save and break
    if trials(t).break
        Screen('TextSize',Sc.window,18);
        DrawFormattedText(Sc.window, 'Loading...','center', 'center', [0 0 0]);
        Screen('Flip', Sc.window);
        %-- Save data every 20th trials
        save([settings.rawdata_path subject.dir '/behaviour/' subject.fileName '_' num2str(round(t/20))],'trials', 'settings', 'subject', 't');
        if trials(t).block > 4
            % Calculate the accuracy and average speed of the last block in
            % each break.
            blocky = trials([trials.block]==trials(t).block); 
            blockSpeed = round(nanmean(nonzeros([trials(t-(settings.ntrials-1):t).ctcTime])),2);
            % Blocks 5 and 6 data are stored in separate headers of the
            % SpeedAccTable, 7-10 are stored in their block's row.
            if trials(t).block == 5
                blockAcc = round(nanmean([trials([trials.block]==trials(t).block).cor2]).*100);
                speedAccTable(1).block5Accuracy = blockAcc;
                speedAccTable(1).block5Speed = blockSpeed;
            elseif trials(t).block == 6
                blockAcc = round(nanmean([trials([trials.block]==trials(t).block).cor2]).*100);
                speedAccTable(1).block6Accuracy = blockAcc;
                speedAccTable(1).block6Speed = blockSpeed;
            else
                validTrials = size([trials(t-(settings.ntrials-1):t).cor2],2) - sum([trials(t-(settings.ntrials-1):t).timeRanOut]==1);
                if validTrials == 0
                    blockAcc = 0;
                else
                    timeRanOut = [blocky.timeRanOut].';
                    cor2 = [blocky.cor2].';
                    timeup = sum(timeRanOut==0&cor2==1);
                    blockAcc = round( timeup/validTrials ,2)*100;
                end
                speedAccTable(trials(t).block-6).currentBlockAcc = blockAcc;
                speedAccTable(trials(t).block-6).currentBlockSpeed = blockSpeed;
            end
        end
        if trials(t).block == 6          
            if settings.speedAndAccuracyManip == 1
                block5Acc = speedAccTable(1).block5Accuracy;
                block6Acc = speedAccTable(1).block6Accuracy;
                % If you want to use higher block accuracy instead,
                % uncomment this.
%                 if block5Acc > block6Acc
%                     accThreshold = round(block5Acc,0);
%                     speedAccTable(1).accThreshold = accThreshold;
%                 else
%                     accThreshold = round(block6Acc,0);
%                     speedAccTable(1).accThreshold = accThreshold;
%                 end

                % Accuracy threshold is calculated by subtracting some
                % adjustment value (in this case 4) from the average cj1
                % of blocks 5-6.
                adjustment = 2;
                accThreshold = (block5Acc + block6Acc)/2;
                speedAccTable(1).accThreshold = accThreshold-adjustment;
                
                % Speed threshold is taken from the median of response time
                % of blocks 5 - 6 choice to choice time (between making cj1
                % and cj2). 
                speThreshold = round(median([trials(t-((settings.ntrials*2)-1):t).ctcTime]),2);
                speedAccTable(1).speThreshold = speThreshold;
            end         
        end 
        if trials(t).block > 6
            if trials(t).speedManip == 1
                %How many times did the participant run out of time in
                %the block?
                numOfRunouts = sum([trials(t-(settings.ntrials-1):t).timeRanOut]==1);
                speedAccTable(trials(t).block-6).numOfTimeRunouts = numOfRunouts;
            else
                % Difference between the accuracy threshold and
                % the block's accuracy of cj2.
                speedAccTable(trials(t).block-6).accDiff = speedAccTable(trials(t).block-6).currentBlockAcc - speedAccTable(1).accThreshold;
                % Reward is rounding up the square root of accDiff.
                if speedAccTable(trials(t).block-6).accDiff < 0
                    speedAccTable(trials(t).block-6).reward = 0;
                else
                    speedAccTable(trials(t).block-6).reward = ceil(sqrt(speedAccTable(trials(t).block-6).accDiff));
                end
            end
        end
        %-- break
        Screen('TextSize',Sc.window,18);
        DrawFormattedText(Sc.window, 'Break. Press Space to continue','center', 'center', [0 0 0]);
        Screen('Flip', Sc.window);
        pause(1);
        collect_response(settings.response, inf);
    end
    %% feedback
    if trials(t).feedback % give overall feedback only once in a while
        feedback_interblock;
        if(settings.do_instr)
            if trials(t).block > 6
        % Tell participants if the next block is either speed or
        % accuracy.
                if trials(t).block < 8
                    space = 'Press Space to begin.';
                    c = newline;
                    if settings.SCACCondition == 1
                        Screen('TextSize',Sc.window,18);
                        textline = ['In the next block, there will be a strict time limit applied to part of the decision made on each trial.' c c 'Specifically, you will have limited time from when you are first given a choice of advisors to when you commit to a final decision.' c c 'You will not be able to answer after the time limit has elapsed, so please attempt to indicate your final answer in time.' c c 'To help you do this, the fixation cross in the middle of the screen will turn red when you have a short amount of time left.'];
                        textline = [textline c c space];
                        DrawFormattedText(Sc.window, textline,'center', 'center', [0 0 0]);
                        Screen('Flip', Sc.window);
                        pause(1);
                        collect_response(settings.response, inf);
                    elseif settings.SCACCondition == 2
                        Screen('TextSize',Sc.window,18);
                        textline = ['In the next block, you will be rewarded for your performance (and not timed).' c c 'Specifically, you can earn extra money at the end of the experiment based on the accuracy of your final decision (after receiving advice) on each trial.' c c 'The more accurate you are on these final decisions, the more rewards you will earn.'];
                        textline = [textline c c space]; 
                        DrawFormattedText(Sc.window, textline,'center', 'center', [0 0 0]);
                        Screen('Flip', Sc.window);
                        pause(1);
                        collect_response(settings.response, inf);
                    end
                else
                    if trials(t).block ~= 10
                        space = 'Press Space to begin.';
                        c = newline;  
                        if settings.SCACCondition == 1
                            Screen('TextSize',Sc.window,18);
                            textline = ['In the next block, you will be rewarded for your performance (and not timed).' c c 'Specifically, you can earn extra money at the end of the experiment based on the accuracy of your final decision (after receiving advice) on each trial.' c c 'The more accurate you are on these final decisions, the more rewards you will earn.'];
                            textline = [textline c c space];
                            DrawFormattedText(Sc.window, textline ,'center', 'center', [0 0 0]);
                            Screen('Flip', Sc.window);
                            pause(1);
                            collect_response(settings.response, inf);
                        elseif settings.SCACCondition == 2
                            Screen('TextSize',Sc.window,18);
                            textline = ['In the next block, there will be a strict time limit applied to part of the decision made on each trial.' c c 'Specifically, you will have limited time from when you are first given a choice of advisors to when you commit to a final decision.' c c 'You will not be able to answer after the time limit has elapsed, so please attempt to indicate your final answer in time.' c c 'To help you do this, the fixation cross in the middle of the screen will turn red when you have a short amount of time left.'];
                            textline = [textline c c space];
                            DrawFormattedText(Sc.window, textline,'center', 'center', [0 0 0]);
                            Screen('Flip', Sc.window);
                            pause(1);
                            collect_response(settings.response, inf);
                        end  
                    end
                end
            end
        end
    end
end
%% collect questionnaire
if (settings.doQuestionnaires)
    settings.whichQuestionList = 3;
    [settings] = questionnaireFunction(settings, Sc);
end
%% save final file
save([settings.rawdata_path subject.dir '/behaviour/' subject.fileName '_final'], 'subject','settings','trials','speedAccTable');
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
