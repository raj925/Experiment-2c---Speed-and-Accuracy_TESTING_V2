settings.rawdata_path = 'rawdata/';  % save paths in settings
%% Initial settings
settings.betaTesting = false; % Setting to switch between #of trials for debugging or regular use
settings.do_instr = false;   % Setting to skip instructions while debugging
settings.cognitiveLoadManipulation = true;
settings.roomID = 2; %1=office,2=home,3=BehLab,4=EEG,5=BonusRoom
settings.doQuestionnaires = false; % Turn questionnaires on/off
settings.adjustedDD = 12;
[settings] = createSettings(settings);
[trials] = buildTrialsStruct(settings);
[cognitiveLoadTable] = createCogLoadTable(settings,trials);
% [trials] = buildTrialsStruct(settings,cognitiveLoadTable);
% [trials] = buildTrialsStruct(settings,trials);