
function settings = getscripts(settings)
% settings = getscripts([settings])
% read and output all files in a variable to keep track of file changes
% by default:
%       settings.path = pwd
%       settings.filetype = '*.m'
% JeanRémi King, jeanremi.king@gmail.com

if nargin == 0
    settings = [];
end
if ~isfield(settings, 'path'), settings.path = [pwd '/']; end
if ~isfield(settings, 'filetype'), settings.filetype = '*.m'; end

%-- read all script in folder
files = dir([settings.path settings.filetype ]);
for f = 1:length(files) 
    fid = fopen(files(f).name, 'r');
    try
        eval(['settings.' files(f).name(1:(end-(length(settings.filetype)-1))) ' = fread(fid,''uint8=>char'')'';']);
    catch
        % deal with bad naming
        eval(['settings.file_' num2str(f) ' = fread(fid,''uint8=>char'')'';']);
    end
    fclose(fid);
end
