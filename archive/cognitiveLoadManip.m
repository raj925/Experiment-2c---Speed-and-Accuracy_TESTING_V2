function [cognitiveLoadTable] = cognitiveLoadManip(cognitiveLoadTable,trials,t,Sc,settings)
%% Cognitive Load Manipulation Script, Study 2b
% Created by Aaron Celaya, February 2019

spaceKey  = KbName('space');
settings.instr.instr = {'Left click with the mouse' ...
    'Press spacebar to confirm response'};
ShowCursor('Arrow');

% Assign b values
for i = 1:cognitiveLoadTable(end).b
    if trials(t).trialNumber==cognitiveLoadTable(i).trialNumber
        b = cognitiveLoadTable(i).b;
    end
end
% Assign final b value (after all trials are complete)
if trials(t).trialNumber == trials(end).trialNumber
    b = (cognitiveLoadTable(end).b)+1;
end

% Initialize Variables
exitResponse = 0;
resp(b) = 0;

if b==1
    partI = true;
    partII = false;
elseif b>1 && b<=cognitiveLoadTable(end).b
    partII = true;
    partI = true;
elseif b==(cognitiveLoadTable(end).b)+1
    partII = true;
    partI = false;
end

if (partII) %(check last letters, give feedback)
    Screen('TextSize',Sc.window,36);
    Screen('TextStyle', Sc.window,0);
    if cognitiveLoadTable(b-1).numOfLetters == 1
        Screen('TextSize',Sc.window,24);
        [~, ~] = DrawFormattedText(Sc.window, 'Is this the same letter you saw previously?','center', (Sc.rect(4)*.292), [255 255 255], 55, 0, 0, 2);
    elseif cognitiveLoadTable(b-1).numOfLetters == 5
        Screen('TextSize',Sc.window,24);
        [~, ~] = DrawFormattedText(Sc.window, 'Are these the same letters you saw previously?','center', (Sc.rect(4)*.292), [255 255 255], 55, 0, 0, 2);
    end
    % Define answer oval field
    ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
    ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
    % Draw and position 'yes' and 'no' answers
    Screen('TextSize',Sc.window,24);
    DrawFormattedText(Sc.window, 'No',(Sc.rect(3)*.305), (Sc.rect(4)*.825), [0 0 0]);
    DrawFormattedText(Sc.window, 'Yes',(Sc.rect(3)*.646), (Sc.rect(4)*.825), [0 0 0]);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
    % Draw and position instructions at bottom of page
    Screen('TextSize',Sc.window,13);
    DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
    DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
    % Draw and position manipulated stimuli
    Screen('TextSize',Sc.window,48);
    DrawFormattedText(Sc.window, cognitiveLoadTable(b-1).targetLetters,'center', 'center', [255 255 255]);
    Screen('Flip',Sc.window);
    ShowCursor('Arrow');
    
    % Collect Response
    while exitResponse==0 %checks for completion
        ListenChar(0);
        [x,y,~]=GetMouse();  %waits for a key-press
        
        Screen('TextSize',Sc.window,36);
        Screen('TextStyle', Sc.window,0);
        
        if cognitiveLoadTable(b-1).numOfLetters == 1
            Screen('TextSize',Sc.window,24);
            [~, ~] = DrawFormattedText(Sc.window, 'Is this the same letter you saw previously?','center', (Sc.rect(4)*.292), [255 255 255], 55, 0, 0, 2);
        elseif cognitiveLoadTable(b-1).numOfLetters == 5
            Screen('TextSize',Sc.window,24);
            [~, ~] = DrawFormattedText(Sc.window, 'Are these the same letters you saw previously?','center', (Sc.rect(4)*.292), [255 255 255], 55, 0, 0, 2);
        end
        
        ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
        ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
        Screen('TextSize',Sc.window,24);
        DrawFormattedText(Sc.window, 'No',(Sc.rect(3)*.305), (Sc.rect(4)*.825), [0 0 0]);
        DrawFormattedText(Sc.window, 'Yes',(Sc.rect(3)*.646), (Sc.rect(4)*.825), [0 0 0]);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
        
        Screen('TextSize',Sc.window,13);
        DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
        DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
        Screen('TextSize',Sc.window,48);
        DrawFormattedText(Sc.window, cognitiveLoadTable(b-1).targetLetters,'center', 'center', [255 255 255]);
        
        if x > Sc.rect(3)*.328 && x < Sc.rect(3)*.339 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 2
            [~,~,buttons]=GetMouse();
            if (buttons(1)) == 1
                resp(b) = 2;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl2);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
                Screen('Flip', Sc.window);
            end
        elseif x > Sc.rect(3)*.661 && x < Sc.rect(3)*.672 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 4
            [~,~,buttons]=GetMouse();
            if (buttons(1)) == 1
                resp(b) = 4;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl4);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
                Screen('Flip', Sc.window);
            end
        end
        ListenChar(2);
        [~, ~, keyCode] = KbCheck;
        if keyCode(spaceKey) && resp(b) > 0
            exitResponse = true;
            Screen('Flip',Sc.window);
            ListenChar(0);
        end
        cognitiveLoadTable(b-1).answer = resp(b);
        % Collect response ends
    end
    if b>1
        if cognitiveLoadTable(b-1).targetMatch == 1 && cognitiveLoadTable(b-1).answer == 2
            cognitiveLoadTable(b-1).correct = 0;
            Screen('TextSize',Sc.window,36);
            Screen('TextStyle', Sc.window,0);
            Screen('Flip',Sc.window);
            Beeper(1000,.4,.5);
            WaitSecs(3);
        elseif cognitiveLoadTable(b-1).targetMatch == 0 && cognitiveLoadTable(b-1).answer == 4
            cognitiveLoadTable(b-1).correct = 0;
            Screen('TextSize',Sc.window,36);
            Screen('TextStyle', Sc.window,0);
            Screen('Flip',Sc.window);
            Beeper(1000,.4,.5);
            WaitSecs(3);
        else
            cognitiveLoadTable(b-1).correct = 1;
        end
    end
end

if (partI) %(show new letters)
    exitResponse = 0;
    resp(b) = 0;
    
    Screen('TextSize',Sc.window,24);
    Screen('TextStyle', Sc.window,0);
    [~, ~] = DrawFormattedText(Sc.window, 'Please take a few moments to memorize the letter(s) below.','center', (Sc.rect(4)*.292), [255 255 255], 50, 0, 0, 2);
    [~, ~] = DrawFormattedText(Sc.window, 'Press the Spacebar when ready to continue.','center', (Sc.rect(4)*.825), [255 255 255], 50, 0, 0, 2);
    Screen('TextSize',Sc.window,48);
    DrawFormattedText(Sc.window, cognitiveLoadTable(b).newLetters,'center', 'center', [255 255 255]);Screen('Flip',Sc.window);pause(1);
    while exitResponse==0
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
Screen('Flip',Sc.window);
end
%% Notes:
