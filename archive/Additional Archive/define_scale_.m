settings.bar.maxScale            = 50;
settings.bar.minScale            = -50;
settings.bar.nScale              = length([settings.bar.minScale:settings.bar.maxScale]);
settings.bar.cursorwidth         = Sc.rect(3)/150;
settings.bar.cursorheight        = 20;
settings.bar.positiony           = .8;
settings.bar.barrect             = CenterRectOnPoint([0 0 (settings.bar.nScale*settings.bar.cursorwidth) (settings.bar.cursorheight)], ...
    Sc.center(1),Sc.rect(4)*settings.bar.positiony);
settings.bar.barlength           = settings.bar.barrect(3)- settings.bar.barrect(1);
settings.bar.gap_size            = 5;
settings.bar.gaprect            = CenterRectOnPoint([0,0,settings.bar.cursorwidth * settings.bar.gap_size,settings.bar.cursorheight],...
    Sc.center(1), Sc.rect(4)*settings.bar.positiony);
settings.bar.gaplength=(settings.bar.gaprect(3)-settings.bar.gaprect(1)).*.5;
% define cursor possible positions along x-axis
settings.bar.xshift = [linspace(settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,...
        settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5,settings.bar.maxScale) ...
    linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, ...
        settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale)];


% % temporary short names
% maxScale                    = settings.bar.maxScale;
% minScale                    = settings.bar.minScale;
% nScale                      = settings.bar.nScale;
% cursorwidth                 = settings.bar.cursorwidth;
% cursorheight                = settings.bar.cursorheight;
% barrect                     = settings.bar.barrect;
% barlength                   = settings.bar.barlength;
% gap_size                    = settings.bar.gap_size;
% gap                         = settings.bar.gap_rect;