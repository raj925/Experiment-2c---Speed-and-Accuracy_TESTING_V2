%-- add progression bar. Helps motivation
Start='start';
End='end';
startbounds = Screen('TextBounds', Sc.window, Start);
endbounds = Screen('TextBounds', Sc.window, End);
viscursorwidth=1;
viscursorheight=20;
subblock = t; 
prbarrect=CenterRectOnPoint([0 0 (length(trials) * viscursorwidth) ...
    (viscursorheight)],Sc.center(1),Sc.center(2)-250);
donerect=[prbarrect(1) prbarrect(2) (prbarrect(1)+ t * viscursorwidth) prbarrect(4)];

% continue prompt
Screen('TextSize', Sc.window, 16);
if t~=length(trials)
txtline = ['Please press any key to continue with block ' int2str(trials(t+1).block)...
    ' out of ' int2str(settings.nblocks+settings.nblocksprac+settings.nblocksNew4) '.'];
DrawFormattedText(Sc.window, txtline, 'center', ...
    Sc.center(2)+0.2*Sc.size(2), [0 0 0], [], [], [], 1.5);
end
% feedback
% txtline = ['Your performance in the last block has been '...
%     num2str(round(nanmean([trials([trials.block]==trials(t).block).cor]).*100)) '%'];

if trials(t).block<=3
    txtline = ['Your performance in the last block was '...
        num2str(round(nanmean([trials([trials.block]==trials(t).block).cor1]).*100)) '%'];
elseif trials(t).block>=4
    txtline = ['Your performance in the last block was ' ...
        num2str(round(nanmean([trials([trials.block]==trials(t).block).cor2]).*100)) '%'];
% else
%     txtline = ['Your performance in the last block has been ' ...
%         num2str(round(nanmean([trials([trials.block]==trials(t).block-1).cor]).*100)) '%'];
end

DrawFormattedText(Sc.window, txtline, 'center', ...
    Sc.center(2)-0.1*Sc.size(2), [0 0 0], [], [], [], 1.5);

%add progression bar
Screen('FrameRect',Sc.window,[.9 .9 .9],prbarrect);
Screen('FillRect', Sc.window, [.9 .9 .9],donerect);
DrawFormattedText(Sc.window,Start, prbarrect(1)-startbounds(3)-10,prbarrect(2)-viscursorheight);
DrawFormattedText(Sc.window,End, prbarrect(3)+10,prbarrect(2)-viscursorheight);
Screen('Flip',Sc.window);
WaitSecs(.5);
collect_response(settings,inf)
add_fixation;
Screen('Flip',Sc.window);
WaitSecs(.5);