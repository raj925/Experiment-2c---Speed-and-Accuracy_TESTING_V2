function [trials] = buildTrialsStruct(settings,trials)
%% Load advisor .mat files and create tables to randomize trial selection
advisorChoiceTrials = load('advisorChoiceTrials'); % Advisor tables, one advisor set for each dotdifference from 1:15, both advisors are 70% accurate
advisorForcedTrials = load('advisorForcedTrials'); % Same as above table, just a different set for the forced trials (trials 1:60 are for the human advisor and 61:120 are for the computer advisor for each dd)
advisorBlk4Trials = load('advisorBlk4Trials.mat');

randomTrialSelectionBlock4 = settings.randomTrialSelectionBlock4;
randomTrialSelectionBlock5 = settings.randomTrialSelectionBlock5;
randomTrialSelectionBlock6 = settings.randomTrialSelectionBlock6;
randomTrialSelectionBlock7 = settings.randomTrialSelectionBlock7;
randomTrialSelectionBlock8 = settings.randomTrialSelectionBlock8;
randomTrialSelectionBlock9 = settings.randomTrialSelectionBlock9;
randomTrialSelectionBlock10 = settings.randomTrialSelectionBlock10;
randomizeChoiceTrials = settings.randomizeChoiceTrials;
randomizeForcedTrials = settings.randomizeForcedTrials;

if settings.currentBlock == 0
    %% Preallocate Structure
    
    % Calculate length of trials struct, based on settings inputs
    b = sum(settings.ntrialsall);
    
    % Create Trials Struct
    trials = struct('trialNumber',cell(1,b),'staircase',cell(1,b),...
        'block',cell(1,b),'wherelarger',cell(1,b),'wheredots',...
        cell(1,b),'break',cell(1,b),'feedback',cell(1,b),'instr',cell(1,b),...
        'dotdifference',cell(1,b),'time_starttrial',cell(1,b),...
        'VBLTimestampOnsetStim',cell(1,b),'onsetstim',cell(1,b),...
        'tmissed_onset1',cell(1,b),'VBLTimestampOffsetStim',cell(1,b),...
        'offsetstim',cell(1,b),'tmissed_offset1',cell(1,b),'cj1',...
        cell(1,b),'resp1_t',cell(1,b),'int1',cell(1,b),'responded1',...
        cell(1,b),'cor1',cell(1,b),'rt1',cell(1,b),'cj2',cell(1,b),...
        'resp2_t',cell(1,b),'int2',cell(1,b),'responded2',cell(1,b),...
        'cor2',cell(1,b),'rt2',cell(1,b),'act_stimdur',cell(1,b),...
        'choiceTrial',cell(1,b),'forcedTrial',cell(1,b),'algorithm1Answer',...
        cell(1,b),'algorithm1Correct',cell(1,b),'algorithm1Confidence',...
        cell(1,b),'algorithm2Answer',cell(1,b),'algorithm2Correct',...
        cell(1,b),'algorithm2Confidence',cell(1,b),'whichAdvisor',...
        cell(1,b),'whichBox',cell(1,b),'trialType',cell(1,b),...
        'randChoiceTrial',cell(1,b),'randForcedTrials',cell(1,b),...
        'forcedAdvisorType',cell(1,b),'randTrialSelect',cell(1,b),...
        'forcedAdvisor',cell(1,b),'whichAdvisorLocation',cell(1,b),...
        'speedManip',cell(1,b),'accManip',cell(1,b),'timeRanOut',cell(1,b));
    %% Add Trial Number
    for n = 1:b
        trials(n).trialNumber = n;
    end
    %% Add Staircase
    % Practice Trials
    for n = 1:settings.w
        trials(n).staircase = 1; % select staircase
    end
    % Block 4, Advisor Practice (Forced Trials)
    for m = settings.w+1:settings.w4
        trials(m).staircase = 2; % select staircase
    end
    % Remaining Blocks, Experimental (Choice & Forced Trials)
    for h = settings.w4+1:sum(settings.ntrialsall)
        trials(h).staircase = 3; % select staircase
    end
    %% Add Block Numbers
    % Practice Trials
    t=0;
    for m = 1:settings.nblocksprac
        for p = 1:settings.ntrialsprac
            t = t+1;
            trials(t).block = m; % add block number
        end
    end
    clear m; clear p;
    % Remaining Trials
    for b = (settings.nblocksprac + 1):settings.ntotalblocks
        for p = 1 : settings.ntrials
            t=t+1;
            trials(t).block = b;
        end
    end
    clear t;
    for t = 1 : length(trials)-1
        % add where dots field
        trials(t).wheredots     = zeros(2,400);
        
        %-- add breaks and feedback
        if t == 1
            trials(t).break = false;
            trials(t).feedback = false;
            trials(t).instr = true;
            trials(t).speAccManip = false;
        elseif trials(t).block ~= trials(t+1).block
            trials(t).break = true;
            trials(t).feedback = true;
            trials(t).instr = false;
            trials(t).speAccManip = false;
        elseif trials(t).block==4 && trials(t-1).block==3
            trials(t).break = false;
            trials(t).feedback = false;
            trials(t).instr = true;
            trials(t).speAccManip = false;
        elseif trials(t).block==5 && trials(t-1).block==4
            trials(t).break = false;
            trials(t).feedback = false;
            trials(t).instr = true;
            trials(t).speAccManip = false;
        elseif trials(t).block==7 && trials(t-1).block==6
            trials(t).break = false;
            trials(t).feedback = false;
            trials(t).instr = true;
            trials(t).speAccManip = false;
        else
            trials(t).break = false;
            trials(t).feedback = false;
            trials(t).instr = false;
            trials(t).speAccManip = false;
        end
        
        if t == settings.w6+1 || t == settings.w6+11 || t == settings.w6+21 || t == settings.w6+31 || t == settings.w6+41 || t == settings.w6+51 || t == settings.w7+1 || t == settings.w7+11 || t == settings.w7+21 || t == settings.w7+31 || t == settings.w7+41 || t == settings.w7+51 ||...
                t == settings.w8+1 || t == settings.w8+11 || t == settings.w8+21 || t == settings.w8+31 || t == settings.w8+41 || t == settings.w8+51 || t == settings.w9+1 || t == settings.w9+11 || t == settings.w9+21 || t == settings.w9+31 || t == settings.w9+41 || t == settings.w9+51
            trials(t).speAccManip = true;
        end
        trials(end).break=true;
        trials(end).feedback=true;
        trials(end).instr=false;
        trials(end).speAccManip = true;
    end
    %% Add wherelarger
    % Practice Trials (Only at this time)
    t=0;
    wl0 = repmat([1 2],1,settings.ntrialsprac/2 * settings.nblocksprac);
    wl0 = wl0(randperm(length(wl0)));
    for b = 1 : settings.nblocksprac
        for p = 1: settings.ntrialsprac
            t=t+1;
            trials(t).wherelarger   = wl0(t);
            % Populate Additional Variables
            trials(t).choiceTrial = 0;
            trials(t).forcedTrial = 0;
            trials(t).algorithm1Answer = NaN;
            trials(t).algorithm1Correct = NaN;
            trials(t).algorithm1Confidence = NaN;
            trials(t).algorithm2Answer = NaN;
            trials(t).algorithm2Correct = NaN;
            trials(t).algorithm2Confidence = NaN;
            trials(t).whichAdvisor = NaN;
            trials(t).whichBox = NaN;
            trials(t).trialType = NaN;
            trials(t).randChoiceTrial = NaN;
            trials(t).randForcedTrials = NaN;
            trials(t).forcedAdvisorType = NaN;
            trials(t).randTrialSelect = NaN;
            trials(t).cj2 = NaN;
            trials(t).resp2_t = NaN;
            trials(t).int2 = NaN;
            trials(t).responded2 =NaN;
            trials(t).cor2 = NaN;
            trials(t).rt2  = NaN;
            trials(t).forcedAdvisor = NaN;
            trials(t).whichAdvisorLocation = NaN;
        end
    end
    
    %% Randomize Trials
    k = t;
    clear t;
    for t = k+1:sum(settings.ntrialsall)
        if trials(t).block >=4
            %         ShowCursor('Arrow');   % just for debugging
            if trials(t).block == 4
                randomTrialSelection = randomTrialSelectionBlock4(t-settings.w);
                trials(t).trialType = 2;
            end
            
            if trials(t).block == 5
                randomTrialSelection = randomTrialSelectionBlock5(t-settings.w4);
                if randomTrialSelection <= 40
                    trials(t).trialType = 1;
                elseif randomTrialSelection >= 41
                    trials(t).trialType = 2;
                end
            elseif trials(t).block == 6
                randomTrialSelection = randomTrialSelectionBlock6(t-settings.w5);
                if randomTrialSelection >=61 && randomTrialSelection <=100
                    trials(t).trialType = 1;
                elseif randomTrialSelection >=101 && randomTrialSelection <=120
                    trials(t).trialType = 2;
                end
            elseif trials(t).block == 7
                randomTrialSelection = randomTrialSelectionBlock7(t-settings.w6);
                if randomTrialSelection >=121 && randomTrialSelection <=160
                    trials(t).trialType = 1;
                elseif randomTrialSelection >=161 && randomTrialSelection <=180
                    trials(t).trialType = 2;
                end
            elseif trials(t).block == 8
                randomTrialSelection = randomTrialSelectionBlock8(t-settings.w7);
                if randomTrialSelection >=181 && randomTrialSelection <=220
                    trials(t).trialType = 1;
                elseif randomTrialSelection >=221 && randomTrialSelection <=240
                    trials(t).trialType = 2;
                end
            elseif trials(t).block == 9
                randomTrialSelection = randomTrialSelectionBlock9(t-settings.w8);
                if randomTrialSelection >=241 && randomTrialSelection <=280
                    trials(t).trialType = 1;
                elseif randomTrialSelection >=281 && randomTrialSelection <=300
                    trials(t).trialType = 2;
                end
            elseif trials(t).block == 10
                randomTrialSelection = randomTrialSelectionBlock10(t-settings.w9);
                if randomTrialSelection >=301 && randomTrialSelection <=340
                    trials(t).trialType = 1;
                elseif randomTrialSelection >=341 && randomTrialSelection <=360
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
                    settings.forcedAdvisorType = 'comp1Advisor';
                    trials(t).forcedAdvisorType = 'comp1Advisor';
                elseif randomForcedAdvisorChoice == 1 % Or if it's odd, proceed here
                    settings.forcedAdvisorType = 'comp2Advisor';
                    trials(t).forcedAdvisorType = 'comp2Advisor';
                end
            end
        end
    end
    
elseif settings.currentBlock == 4
    adjustedDD = settings.adjustedDD;
    t = settings.currentTrial;
    
    if trials(t).block == 4
        for i = settings.w+1:settings.w4
            randForcedTrial = trials(i).randForcedTrials;
            trials(i).wherelarger = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).wherelarger(randForcedTrial,1);
            trials(i).dotdifference = adjustedDD;
            trials(i).wheredots = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).wheredots{randForcedTrial,1};
            trials(i).wheredots = logical(trials(i).wheredots);
            trials(i).algorithm1Answer = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).algorithm1Answer(randForcedTrial,1);
            trials(i).algorithm1Correct = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).algorithm1Correct(randForcedTrial,1);
            trials(i).algorithm1Confidence = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).algorithm1Confidence(randForcedTrial,1);
            trials(i).algorithm2Answer = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).algorithm2Answer(randForcedTrial,1);
            trials(i).algorithm2Correct = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).algorithm2Correct(randForcedTrial,1);
            trials(i).algorithm2Confidence = advisorBlk4Trials.advisorBlk4Trials(adjustedDD).algorithm2Confidence(randForcedTrial,1);
        end
        
        for q = i+1:sum(settings.ntrialsall)
            trials(q).dotdifference = adjustedDD;
            if trials(q).trialType == 1 % Choice Trial
                randChoiceTrial = trials(q).randChoiceTrial;
                trials(q).wherelarger = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).wherelarger(randChoiceTrial,1);
                trials(q).wheredots = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).wheredots{randChoiceTrial,1};
                trials(q).wheredots = logical(trials(q).wheredots);
                trials(q).algorithm1Answer = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).algorithm1Answer(randChoiceTrial,1);
                trials(q).algorithm1Correct = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).algorithm1Correct(randChoiceTrial,1);
                trials(q).algorithm1Confidence = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).algorithm1Confidence(randChoiceTrial,1);
                trials(q).algorithm2Answer = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).algorithm2Answer(randChoiceTrial,1);
                trials(q).algorithm2Correct = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).algorithm2Correct(randChoiceTrial,1);
                trials(q).algorithm2Confidence = advisorChoiceTrials.advisorChoiceTrials(adjustedDD).algorithm2Confidence(randChoiceTrial,1);
            elseif trials(q).trialType == 2 % Forced Trial
                randForcedTrial = trials(q).randForcedTrials;
                trials(q).wherelarger = advisorForcedTrials.advisorForcedTrials(adjustedDD).wherelarger(randForcedTrial,1);
                trials(q).wheredots = advisorForcedTrials.advisorForcedTrials(adjustedDD).wheredots{randForcedTrial,1};
                trials(q).wheredots = logical(trials(q).wheredots);
                trials(q).algorithm1Answer = advisorForcedTrials.advisorForcedTrials(adjustedDD).algorithm1Answer(randForcedTrial,1);
                trials(q).algorithm1Correct = advisorForcedTrials.advisorForcedTrials(adjustedDD).algorithm1Correct(randForcedTrial,1);
                trials(q).algorithm1Confidence = advisorForcedTrials.advisorForcedTrials(adjustedDD).algorithm1Confidence(randForcedTrial,1);
                trials(q).algorithm2Answer = advisorForcedTrials.advisorForcedTrials(adjustedDD).algorithm2Answer(randForcedTrial,1);
                trials(q).algorithm2Correct = advisorForcedTrials.advisorForcedTrials(adjustedDD).algorithm2Correct(randForcedTrial,1);
                trials(q).algorithm2Confidence = advisorForcedTrials.advisorForcedTrials(adjustedDD).algorithm2Confidence(randForcedTrial,1);
            end
        end
    end
end

%% Check the design graphically

% img_dsg(trials,{'block','instr','break','feedback','staircase','wherelarger','cogLoadManip'})

