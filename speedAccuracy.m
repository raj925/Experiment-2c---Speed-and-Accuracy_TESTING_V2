% t = timer;
% t.StartDelay = 3;
% t.TimerFcn = @(myTimerObj, thisEvent)disp('3 seconds have elapsed');
% start(t);

%% TIMING

% htext = uicontrol('style', 'text', 'string', '10.00');
% tic;
% while toc <= 10
%     set(htext, 'string', num2str(10-toc, '%5.2f'));
%     txtline = ['Time: '...
%             num2str(htext) '%'];
%     DrawFormattedText(Sc.window, txtline,'center', 'center', [0 0 0]);  
% end

%%

function f = speedAcc()

    spaceKey  = KbName('space');
    settings.instr.instr = {'Left click with the mouse' ...
        'Press spacebar to confirm response'};
    ShowCursor('Arrow');

    subjectEvenOdd = mod(subject.id,2);
    if subjectEvenOdd == 0 % Even subject.id number
        settings.SCACCondition = 1; % 1 = 1 letter first, 2 = 5 letter first
    elseif subjectEvenOdd == 1 % Odd subject.id number
        settings.SCACCondition = 2; % 1 = 1 letter first, 2 = 5 letter first
    end

    % need to set this flag so it knows to add extra break screen for
    % instructions, same as cogload
    trials(t).speedAccuracy = 1;


    %set Accuracy Threshold

    blockAcc5 = trials(210).blockAcc;
    blockAcc6 = trials(210).blockAcc;

    %Average

    accThreshold = (blockAcc5 + blockAcc6) / 2;

    %Lowest

    if blockAcc5 < blockAcc6
        accThreshold = blockAcc5;
    else
        accThreshold = blockAcc6;
    end

    if trials(t).speedAccuracy == 1
        while exitResponse==0
            thresholdText = ['Your accuracy threshold for the next block is'...
                    num2str(accThreshold) '%'];
            [~, ~] = DrawFormattedText(Sc.window, thresholdText,'center', (Sc.rect(4)*.825), [255 255 255], 50, 0, 0, 2);
            [~, ~] = DrawFormattedText(Sc.window, 'Press the Spacebar when ready to continue.','center', (Sc.rect(4)*.825), [255 255 255], 50, 0, 0, 2);
            ListenChar(0);
            [~,~,~]=GetMouse();
            ListenChar(2);
            resp(b) = 1;
            [~, ~, keyCode] = KbCheck;
            if keyCode(spaceKey) && resp(b) > 0
                exitResponse = true;
                Screen('Flip',Sc.window);
                ListenChar(0);
            end
        end
    end

    %Set Speed Threshold

    %Take the post advisor times for blocks 5 and 6
    PATime = [trials(151:270).postAdviceTime];
    speThreshold = mean(PATime);

    if trials(t).speedAccuracy == 1
        while exitResponse==0
            thresholdText = ['You will have this amount of time to make your final decision during the next block: '...
                num2str(speThreshold) '%'];
        [~, ~] = DrawFormattedText(Sc.window, thresholdText,'center', (Sc.rect(4)*.825), [255 255 255], 50, 0, 0, 2);
        [~, ~] = DrawFormattedText(Sc.window, 'Press the Spacebar when ready to continue.','center', (Sc.rect(4)*.825), [255 255 255], 50, 0, 0, 2);
            ListenChar(0);
            [~,~,~]=GetMouse();
            ListenChar(2);
            resp(b) = 1;
            [~, ~, keyCode] = KbCheck;
            if keyCode(spaceKey) && resp(b) > 0
                exitResponse = true;
                Screen('Flip',Sc.window);
                ListenChar(0);
            end
        end
    end

    if countdown == 0
        Beeper(600,.4,.25);
        Beeper(600,.4,.25);
        Beeper(600,.4,.25);
        trials(t).timeRanOut = 1;
        trials(t).cj2 = 0;
        trials(t).cor2 = 0;
        DrawFormattedText(Sc.window, 'You ran out of time!', 'center', 'center', [0 0 0]);
    end


    if block > 6
        if settings.SCACCondition == 2
            finishedBlockAcc = trials(t).blockAcc;
            accDiff = round(accThreshold - finishedBlockAcc);
            txtline = ['Your accuracy in the last block was '...
                num2str(round(nanmean([trials([trials.block]==trials(t).block).cor1]).*100)) '%'];
            txtline2 = ['The required accuracy for the previous block was'...
                num2str(accThreshold) '%'];
            if accDiff < 0
                txtline3 = ['Your accuracy in the last block was lower than the required threshold by '...
                num2str(abs(accDiff)) '%'];
            else
                txtline3 = ['Your accuracy in the last block was higher than the required threshold by '...
                num2str(accDiff) '%'];
            end
            trials(t).accDiff = accDiff;
            DrawFormattedText(Sc.window, txtline,'center', 'center', [0 0 0]);  
        else
            numOfRunouts = sum([trials(t-59:t).timeRanOut]==1);
            txtline2 = ['You ran out of time this many times: '...
                num2str(numOfRunouts) '%'];
        end
    end
    
    f = "done!";
end

