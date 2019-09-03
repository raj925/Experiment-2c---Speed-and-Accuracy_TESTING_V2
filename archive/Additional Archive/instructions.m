function [] = instructions(Sc,settings, set)
% Usage:
% instructions(set, groups)
% Inputs:
% set: instruction part. Typically block number
% groups: vector indicating the boundaries of slides groupings


r = settings.instr.groups(set);

while r< settings.instr.groups(set+1)
    insimdata = imread(['Slide' num2str(r) '.JPG']);
    texins = Screen('MakeTexture', Sc.window, insimdata);
    Screen('DrawTexture', Sc.window, texins,[],Sc.rect);
    Screen('Flip',Sc.window);
    WaitSecs(.25);
    [responded tilde code] = collect_response(settings,inf);
    switch code
        case 'LeftArrow'
            r = r-1;
        case 'RightArrow'
            r = r+1;
    end
    if r<settings.instr.groups(set),r=settings.instr.groups(set);end
end

return