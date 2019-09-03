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
elseif trials(t).speedManip == 1
    txtline = ['Your performance in the last block was '...
        num2str(speedAccTable(trials(t).block-6).currentBlockAcc) '%'];
elseif trials(t).block>=4
    txtline = ['Your performance in the last block was ' ...
        num2str(round(nanmean([trials([trials.block]==trials(t).block).cor2]).*100)) '%'];
end
if trials(t).block > 6
    if settings.SCACCondition == 1 || settings.SCACCondition == 2
        c = newline;
        if trials(t).speedManip == 1
            text = ['You ran out of time this many times: ' num2str(numOfRunouts)];
            txtline = [txtline c c text];
        else
            if speedAccTable(trials(t).block-6).accDiff < 0
                text2 = ['Your accuracy in the last block was lower than the required threshold by ' num2str(abs(speedAccTable(trials(t).block-6).accDiff)) '%'];
            else
                text2 = ['Your accuracy in the last block was higher than the required threshold by ' num2str(speedAccTable(trials(t).block-6).accDiff) '%'];
            end
            %txtline = [txtline c c text2]; 
        end
        if trials(t).accManip == 1
            if trials(t).block > 8
                if trials(t).block > 9
                    total = speedAccTable(3).reward + speedAccTable(4).reward;
                    if total <= 0
                        rewarding = 'You unfortunately did not win a bonus this time, but keep trying!';
                    else
                        rewarding = ['Based on your performance, you won £' num2str(total) '!'];
                    end
                    txtline = [txtline c c rewarding];
                else
                    total = speedAccTable(3).reward;
                    if total <= 0
                        rewarding = 'You have not won a bonus so far. Keep trying in the next block!';
                    else
                        rewarding = ['Based on your performance, you have won £' num2str(total) ' so far! Keep trying in the next block!'];
                    end
                    txtline = [txtline c c rewarding];
                end
            end
            if trials(t).block > 6 && trials(t).block < 9
                if trials(t).block > 7
                    total = speedAccTable(1).reward + speedAccTable(2).reward;
                    if total <= 0
                        rewarding = 'You unfortunately did not win a bonus this time, but keep trying!';
                    else
                        rewarding = ['Based on your performance, you won £' num2str(total) '!'];
                    end
                    txtline = [txtline c c rewarding];
                else
                    total = speedAccTable(1).reward;
                    if total <= 0
                        rewarding = 'You have not won a bonus so far. Keep trying in the next block!';
                    else
                        rewarding = ['Based on your performance, you have won £' num2str(total) ' so far! Keep trying in the next block!'];
                    end
                    txtline = [txtline c c rewarding];
                end
            end
        end
    end
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
collect_response(settings,inf);
add_fixation;
Screen('Flip',Sc.window);
WaitSecs(.5);