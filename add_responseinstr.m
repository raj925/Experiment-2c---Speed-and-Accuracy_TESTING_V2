function [] = add_responseinstr(Sc,settings)
% Usage:
% [] = add_responseinstr(Sc,settings)
% 
% Required fields:
% settings.instr.instr refers to the response mode instructions 
% at the bottom of the page.
% settings.bar.positiony
% 
% Default values are assigned only to settings.instr.instr
% 
% Niccolo Pescetelli

%% check required fields
if ~isfield(settings,'instr')
    settings.instr.instr = {'Left click with the mouse' ...
        'Press spacebar to confirm response'};
end
if ~isfield(settings.instr,'instr')
    settings.instr.instr = {'Left click with the mouse' ...
        'Press spacebar to confirm response'};
end

%% add response istructions
Screen('TextSize', Sc.window, 13);Screen('TextFont', Sc.window, 'Myriad Pro');
DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*settings.bar.positiony+80, 0);
DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*settings.bar.positiony+100, 0);

return
