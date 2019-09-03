%% Build trials
trials = [];
trialid = 0;
index=1;
[block_trials0, block_trials1, block_trials2] =deal([]); %initialize as empty vectors

%% practice trials
for b = 1: settings.nblocksprac
    block_trials0 = []; %clear vector
    for t = 1: (settings.ntrialsprac)
        trialid                                 = trialid+1;
        block_trials0(end+1).trialid            = trialid;
        block_trials0(end).staircase = 1; % apply staircase
        block_trials0(end).questionnaireAns     = NaN;
    end
    block_trials0    = block_trials0(randperm(length(block_trials0)));         % randomize trials within block
    trials           = cat(2,trials,block_trials0);                            % concatenate practice block
end

%% new block 4

for b = 1 : settings.nblocksNew4
    block_trials1   = [];
    for i = 1 : settings.ntrialsNew4
        trialid                              = trialid+1;
        block_trials1(end+1).trialid         = trialid;
        for b=4
            block_trials1(end).staircase = 2;
            block_trials1(end).questionnaireAns  = NaN;
        end
    end
    block_trials1   = block_trials1(randperm(length(block_trials1)));  % randomize trials within two blocks
    trials          = cat(2,trials,block_trials1);                     % concatenate experimental block
end

%% experimental trials
for b = 1 : settings.nblocks
    block_trials2   = [];
    for i = 1 : settings.ntrials
        trialid                              = trialid+1;
        block_trials2(end+1).trialid         = trialid;
        if b<4
            block_trials2(end).staircase = 3;
            block_trials2(end).questionnaireAns  = NaN;
        elseif b>=4
            block_trials2(end).staircase = 3;
            block_trials2(end).questionnaireAns  = NaN;
        end
    end
    block_trials2   = block_trials2(randperm(length(block_trials2)));  % randomize trials within two blocks
    trials          = cat(2,trials,block_trials2);                     % concatenate experimental block
end
clear  block_trial*;

%% add block number
t=0;
wl0 = repmat([1 2],1,settings.ntrialsprac/2 * settings.nblocksprac);
wl0 = wl0(randperm(length(wl0)));
for b = 1 : settings.nblocksprac
    for p = 1: settings.ntrialsprac
        t=t+1;
        trials(t).block = b;
        % add where larger
        trials(t).wherelarger   = wl0(t);
    end
end
for b = (settings.nblocksprac + 1) : settings.ntotalblocks
    wl1 = repmat([1 2],1,settings.ntrials/2);
    wl1 = wl1(randperm(length(wl1)));
    for p = 1 : settings.ntrials
        t=t+1;
        trials(t).block = b;
        % add where larger
        trials(t).wherelarger   = wl1(p);
    end
end
clear part b  t

%% check fields: none should be empty
fields = fieldnames(trials);
for f= 1:length(fields)
    if eval(['length({trials.' fields{f} '})']) ~= length(trials)
        disp(['Empty fields in ' fields{f} '!']);
    end
end
clear f

%%
for t = 1 : length(trials)-1
    % add where dots field
    trials(t).wheredots     = zeros(2,400);
    
    %-- add breaks and feedback
    if t == 1
        trials(t).break         = false;
        trials(t).feedback      = false;
        trials(t).instr         = true;
        trials(t).questionnaire = 0;
        trials(t).cogLoadManip = false;
    elseif trials(t).block ~= trials(t+1).block
        trials(t).break         = true;
        trials(t).feedback      = true;
        trials(t).instr     = false;
        trials(t).questionnaire = 0;
        trials(t).cogLoadManip = false;
    elseif trials(t).block==4 && trials(t-1).block==3
        trials(t).break         = false;
        trials(t).feedback      = false;
        trials(t).instr     = true;
        trials(t).questionnaire = 0;
        trials(t).cogLoadManip = false;
        
    elseif trials(t).block==5 && trials(t-1).block==4
        trials(t).break         = false;
        trials(t).feedback      = false;
        trials(t).instr     = true;
        trials(t).questionnaire = 0;
        trials(t).cogLoadManip = false;
    else
        trials(t).break         = false;
        trials(t).feedback      = false;
        trials(t).instr         = false;
        trials(t).questionnaire = 0;
        trials(t).cogLoadManip = false;
    end
    
    if t == w6+1 || t == w6+11 || t == w6+21 || t == w6+31 || t == w6+41 || t == w6+51 || t == w7+1 || t == w7+11 || t == w7+21 || t == w7+31 || t == w7+41 || t == w7+51 ||...
            t == w8+1 || t == w8+11 || t == w8+21 || t == w8+31 || t == w8+41 || t == w8+51 || t == w9+1 || t == w9+11 || t == w9+21 || t == w9+31 || t == w9+41 || t == w9+51
        trials(t).cogLoadManip = true;
    end
    
    if (settings.debugging)
        if t == w6+1 || t == w6+11 || t == w6+21 || t == w6+31 || t == w6+41 || t == w6+51 || t == w7+1 || t == w7+11 || t == w7+21 || t == w7+31 || t == w7+41 || t == w7+51 ||...
                t == w8+1 || t == w8+11 || t == w8+21 || t == w8+31 || t == w8+41 || t == w8+51 || t == w9+1 || t == w9+11 || t == w9+21 || t == w9+31 || t == w9+41 || t == w9+51
            trials(t).cogLoadManip = true;
        end
    end
    trials(end).break=true;
    trials(end).feedback=true;
    trials(end).instr=false;
    clear wl* t
    
    % check the design manually
    if 0
        % after randomization
        img_dsg(trials,{'block','instr','break','feedback','wherelarger','staircase','cogLoadManip'})
        figure(gcf+1);
        [z index] = sort([trials.trialid]);clear z;
        img_dsg(trials(index),{'block','instr','break','feedback','wherelarger','staircase'})
    end
    
