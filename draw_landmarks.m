function [] = draw_landmarks(Sc,settings)
% Usage: 
% [] = draw_landmarks(Sc,settings)
% 
% Required fields are settings.instr.cjtext, settings.instr.interval and 
% settings.bar.barlength.
% The first one refers to 2 confidence landmarks (eg. sure maybe)
% The second one refers to interval landmarks (eg. LEFT and RIGHT)
% The third one refers to the length of the confidence scale
% Defaults values are assigned only for settings.instr fields.

% Niccolo Pescetelli

%% define font and font size
Screen('TextSize', Sc.window, 13);
Screen('TextFont', Sc.window, 'Myriad Pro');
%% check for required fields
if ~isfield(settings,'instr')
    settings.instr.cjtext = {'Certainly' 'Maybe'};
    settings.instr.interval = {'LEFT' 'RIGHT'};
end
if ~isfield(settings.instr,'cjtext')
    settings.instr.cjtext = {'Certainly' 'Maybe'};
end
if ~isfield(settings.instr,'instr')
    settings.instr.interval = {'LEFT' 'RIGHT'};
end
if ~isfield(settings.instr, 'xshift')
    settings.instr.xshift = [linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5,...
            settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,length(settings.instr.cjtext)) ...
        linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, ...
            settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,length(settings.instr.cjtext))];
end
%% define instructions for confidence judgement
% Preallocate 'bounds' double
bounds = zeros((length(settings.instr.cjtext)),4);
for i=1:length(settings.instr.cjtext)
    bounds(i,:) = Screen('TextBounds',Sc.window,settings.instr.cjtext{i});
end
LintBounds              = Screen('TextBounds',Sc.window,settings.instr.interval{1});
RintBounds              = Screen('TextBounds',Sc.window,settings.instr.interval{2});
%% draw confidence landmarks
for i=1:length(settings.instr.xshift)
    Screen('DrawText', Sc.window, ...
        settings.instr.cjtext{mod(i-1,length(settings.instr.cjtext))+1}, ...
        settings.instr.xshift(i) - bounds(mod(i-1,length(settings.instr.cjtext))+1,3)/2, ...
        Sc.rect(4).*settings.bar.positiony-40, 0);
end
%% draw interval landmarks
Screen('DrawText', Sc.window, settings.instr.interval{1}, ...
    Sc.center(1)- (settings.bar.barlength*.25 + settings.bar.gaplength*.5) - LintBounds(3)*.5, ...
    (Sc.rect(4).*settings.bar.positiony +40), 0);

Screen('DrawText', Sc.window, settings.instr.interval{2}, ...
    Sc.center(1)+ (settings.bar.barlength*.25 + settings.bar.gaplength*.5) - RintBounds(3)*.5, ...
    (Sc.rect(4).*settings.bar.positiony +40), 0);
return