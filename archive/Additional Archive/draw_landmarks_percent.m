function [] = draw_landmarks(Sc,settings)
% Usage: 
% [] = draw_landmarks_percent(Sc,settings)
% 
% Required fields are settings.instr.percent and settings.bar.barlength.
% The first one refers to percentage landmarks (eg. 100% 50%)
% The third one refers to the length of the confidence scale
% Defaults values are assigned only for settings.instr fields.

% Niccolo Pescetelli

%% define font and font size
Screen('TextSize', Sc.window, 13);Screen('TextFont', Sc.window, 'Myriad Pro');

%% default values
if ~isfield(settings.instr,'percent'),    settings.instr.percent = {'50%' '100%'}; end

%% define instructions for confidence judgement
bounds1               = Screen('TextBounds',Sc.window,settings.instr.percent{1});
bounds2               = Screen('TextBounds',Sc.window,settings.instr.percent{2});

%% draw percentage landmarks
Screen('DrawText', Sc.window, settings.instr.percent{2}, settings.instr.xshift(1) - bounds2(3)/2, Sc.rect(4).*settings.bar.positiony+20, 0);
Screen('DrawText', Sc.window, settings.instr.percent{1}, Sc.center(1) - bounds1(3)/2, Sc.rect(4).* settings.bar.positiony +20, 0);
Screen('DrawText', Sc.window, settings.instr.percent{2}, settings.instr.xshift(4) - bounds2(3)/2, Sc.rect(4).*settings.bar.positiony +20, 0);

return