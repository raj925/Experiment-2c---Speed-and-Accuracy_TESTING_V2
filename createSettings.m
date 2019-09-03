function [settings] = createSettings(settings)
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

%% initialise variables

if (settings.betaTesting)
    if (settings.speedAndAccuracyManip)
        settings.ntrials         = 4; %number of experimental trials per block, should be 60
        settings.nblocks         = 6; %number of experimental blocks, should be 6
        settings.ntrialsprac     = 4; %number of practice trials per block, should be 30
        settings.nblocksprac     = 3; %number of practice blocks, should be 3
        settings.ntrialsNew4     = 4; %number of new block 4 trials, should be 60
        settings.nblocksNew4     = 1; %should be 1
        settings.blk4expstart    = 4; %block number where the experimental portion begins, should be 4
    else
        settings.ntrials         = 4; %number of experimental trials per block, should be 60
        settings.nblocks         = 6; %number of experimental blocks, should be 6
        settings.ntrialsprac     = 4; %number of practice trials per block, should be 30
        settings.nblocksprac     = 3; %number of practice blocks, should be 3
        settings.ntrialsNew4     = 4; %number of new block 4 trials, should be 60
        settings.nblocksNew4     = 1; %should be 1
        settings.blk4expstart    = 4; %block number where the experimental portion begins, should be 4
    end
else
    settings.ntrials         = 60; %number of experimental trials per block, should be 60
    settings.nblocks         = 6; %number of experimental blocks, should be 6
    settings.ntrialsprac     = 30; %number of practice trials per block, should be 30
    settings.nblocksprac     = 3; %number of practice blocks, should be 3
    settings.ntrialsNew4     = 60; %number of new block 4 trials, should be 60
    settings.nblocksNew4     = 1; %should be 1
    settings.blk4expstart    = 4; %block number where the experimental portion begins, should be 4
end

settings.ntotalblocks    = settings.nblocks + settings.nblocksprac + settings.nblocksNew4; % there are 3 practice blocks and 6 experimental blocks making 9 blocks in total
settings.ntrialsall      = [repmat(settings.ntrialsprac,1,settings.nblocksprac)...
    repmat(settings.ntrialsNew4, 1, settings.nblocksNew4)...
    repmat(settings.ntrials, 1, settings.nblocks)];
settings.w = (settings.nblocksprac*settings.ntrialsprac);  % Added 'w' variable for Block 4 to allow for changing number of practice trials
settings.w4 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4); % adjustment for block 5
settings.w5 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials); % Added 'wx' variable to allow RNG to start at one for block 6
settings.w6 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*2); % Adjustment for Block 7
settings.w7 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*3); % Adjustment for Block 8
settings.w8 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*4); % Adjustment for Block 9
settings.w9 = (settings.nblocksprac*settings.ntrialsprac + settings.nblocksNew4*settings.ntrialsNew4 + settings.ntrials*5); % Adjustment for Block 10
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
settings.rawdata_path        = 'rawdata/';  % save paths in settings
% settings.question = [];
conditionVariable = round(rand(1)); %randomize condition
if conditionVariable == 0
    conditionVariable = 1;
elseif conditionVariable == 1
    conditionVariable = 2;
end
settings.condition = conditionVariable; % condition 1 is where Computer 1 has expressed confidence, condition 2 is where Computer 1 just answers left or right

settings.currentTrial = 0;
settings.currentBlock = 0;

settings.randomTrialSelectionBlock4 = randperm(60);
settings.randomTrialSelectionBlock5 = randperm(60);
settings.randomTrialSelectionBlock6 = datasample(61:120,60,'Replace',false);
settings.randomTrialSelectionBlock7 = datasample(121:180,60,'Replace',false);
settings.randomTrialSelectionBlock8 = datasample(181:240,60,'Replace',false);
settings.randomTrialSelectionBlock9 = datasample(241:300,60,'Replace',false);
settings.randomTrialSelectionBlock10 = datasample(301:360,60,'Replace',false);
settings.randomizeChoiceTrials = randperm(240);
settings.randomizeForcedTrials = randperm(120);

end

