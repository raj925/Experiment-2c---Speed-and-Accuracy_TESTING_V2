% prompt dubject info
prompt = {'Subject ID:','Gender(m/f):','Age:','Experiment restarted? Yes=1 or No=0: '};

answer = inputdlg(prompt);

str = {'Some High School', 'High School Graduate', 'Some College', 'Trade/Technical/Vocational Training',...
    'College Graduate', 'Some Postgraduate Work', 'Post Graduate Degree'};

[s,v] = listdlg('PromptString', 'Highest Level of School Completed',...
    'SelectionMode','single',...
    'ListString', str);

subject.education = s;

prompt = {'How many hours on any given day would you say you spend on an electronic device such as a smartphone or computer? (enter a single digit, such as: 1)'};

answer1 = inputdlg(prompt);

choice = questdlg('Is using a computer an integral part of your employment or education?', ...
	'Options:', ...
	'Yes','No','Unsure','Unsure');

subject.employmentElectonics = choice;

subject.electronicsUsage = answer1{1};

subject.id          = answer{1};
subject.gender      = answer{2};
subject.age         = str2num(answer{3});
subject.education = s;
subject.restart     = str2num(answer{4});
subject.date        = date;
subject.start_time  = clock;
subject.name        = num2str(subject.id);  
subject.screen      = 0;

% testing mode
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
if true
    %non feedback
    subject.dir = subject.name;
else
    %feedback
    subject.dir = [subject.name 'f'];
end

% %% create directory if does not already exist
if ~exist([rawdata_path subject.dir '/behaviour'], 'dir') 
    % mkdir([rawdata_path subject.dir '/behaviour']);
    mkdir([rawdata_path subject.dir '/behaviour']);
end

%% Unique filename depending on computer clock (avoids overwriting)
subject.fileName = [num2str(round(datenum(subject.start_time)*100000)) '_' num2str(subject.id)];
