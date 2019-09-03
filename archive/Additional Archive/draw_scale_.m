function [] = draw_scale_(Sc,settings)
% Usage:
% [] = draw_scale(Sc,settings)
%
% settings must have .bar fields in order to work. 
% settings.bar must have gaprect and barrect fields
% Default values are assigned otherwise.
%
% Niccolo Pescetelli

%% check for fields existence
if ~isfield(settings,'bar')
    settings.bar.maxScale            = 55;
    settings.bar.minScale            = -55;
    settings.bar.nScale              = length([settings.bar.minScale:settings.bar.maxScale]);
    settings.bar.cursorwidth         = Sc.rect(3)/200;
    settings.bar.cursorheight        = 20;
    settings.bar.positiony           = .7;
    settings.bar.barrect             = CenterRectOnPoint([0 0 (settings.bar.nScale*settings.bar.cursorwidth) (settings.bar.cursorheight)], ...
        Sc.center(1),Sc.rect(4)*settings.bar.positiony);
    settings.bar.barlength           = settings.bar.barrect(3)- settings.bar.barrect(1);
    settings.bar.gap_size            = 11;
    settings.bar.gaprect            = CenterRectOnPoint([0,0,settings.bar.cursorwidth * settings.bar.gap_size,settings.bar.cursorheight],...
        Sc.center(1), Sc.size(2)*settings.bar.positiony);
end
if ~isfield(settings.bar,'gaprect'),
    settings.bar.gaprect            = CenterRectOnPoint([0,0,settings.bar.cursorwidth * settings.bar.gap_size,settings.bar.cursorheight],...
        Sc.center(1), ...
        Sc.rect(4)*settings.bar.positiony);
end
if ~isfield(settings.bar,'barrect'),
    settings.bar.barrect             = CenterRectOnPoint([0 0 (settings.bar.nScale*settings.bar.cursorwidth) (settings.bar.cursorheight)], ...
        Sc.center(1),Sc.size(2)*settings.bar.positiony);
end

%% draw barrect and gap
rect = [settings.bar.barrect' settings.bar.gaprect'];
Screen('FillRect', Sc.window, [[.3 .3 .3]' [.5 .5 .5]'],rect);
Screen('TextFont', Sc.window, 'Myriad Pro');

end