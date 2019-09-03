%% For debugging
settings.rawdata_path        = 'rawdata/';  % save paths in settings

%% Subject inputs
% Basic Subject Information
prompt = {'Subject ID:','Gender(m/f):','Age:','Experiment restarted? Yes=1 or No=0: '};
answer = inputdlg(prompt); % Struct of answers from 'prompt' above

% Highest Education
str = {'Some High School', 'High School Graduate', 'Some College', 'Trade/Technical/Vocational Training',...
    'College Graduate', 'Some Postgraduate Work', 'Post Graduate Degree'};
[s,v] = listdlg('PromptString', 'Highest Level of School Completed',...
    'SelectionMode','single',...
    'ListString', str);
% Hours per day on electronic devices
prompt = {'How many hours on any given day would you say you spend on an electronic device such as a smartphone or computer? (enter a single digit, such as: 1)'};
answer1 = inputdlg(prompt); % Answer to electronic devices question
% Is a computer integral to your work/education?
choice = questdlg('Is using a computer an integral part of your employment or education?', ...
	'Options:', ...
	'Yes','No','Unsure','Unsure');
% Convert 'choice' ansewrs to numbers
choiceNum = sum(double(choice)); 
if choiceNum == 305; choice = 1; elseif choiceNum == 189;...
        choice = 2; elseif choiceNum == 642; choice = 3; end
% Convert gender answers to 1/0 from 'prompt' above
gender = answer{2};
if gender == 'm'; gender = 1; elseif gender == 'f'; gender = 0; end
%% Create Subject Struct
subject.employmentElectonics = choice; %1=yes,2=No,3=Unsure
subject.electronicsUsage = str2double(answer1{1});
subject.id          = str2double(answer{1});
subject.gender      = gender;
subject.age         = str2double(answer{3});
subject.education = s;
subject.restart     = str2double(answer{4});
subject.date        = date;
subject.start_time  = clock;
subject.name        = subject.id;  
subject.screen      = 0;

%% testing mode
if isempty(subject.id) || isempty(subject.restart)
    warning('TESTING MODE');
    subject.male            = NaN;
    subject.age             = NaN;
    subject.right_handed    = NaN;
    subject.screen          = 0; % small size screen:1
    subject.name            = 'test';
    subject.id              = 999;
    subject.restart         = 0;
end
if isempty(subject.name)
    subject.name = 'test';
end
%% saving directory
    subject.dir = subject.name;
% %% create directory if does not already exist
if ~exist([settings.rawdata_path subject.dir '/behaviour'], 'dir') 
    % mkdir([rawdata_path subject.dir '/behaviour']);
    mkdir([settings.rawdata_path subject.dir '/behaviour']);
end

%% Unique filename depending on computer clock (avoids overwriting)
subject.fileName = [num2str(round(datenum(subject.start_time)*100000)) '_' num2str(subject.id)];
