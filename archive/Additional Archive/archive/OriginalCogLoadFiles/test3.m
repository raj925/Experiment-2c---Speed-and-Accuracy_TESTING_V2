alphabet = 'A':'Z';
str=alphabet(randi(numel(alphabet)));

cogLoad1 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad2 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad3 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad4 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad5 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad6 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad7 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad8 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad9 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad10 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad11 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad12 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];

cogLoad13 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad14 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad15 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad16 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad17 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad18 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad19 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad20 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad21 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad22 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad23 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];
cogLoad24 = [alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet))),alphabet(randi(numel(alphabet)))];


Sc = start_psychtb([0 0 1920 1200]);
spaceKey  = KbName('space');
settings.instr.instr = {'Left click with the mouse' ...
    'Press spacebar to confirm response'};




for i = 1
    exitResponse = 0;
    buttons=[];
    resp(i) = 0;
    ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
    ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
    
    Screen('TextSize',Sc.window, [36]);
    Screen('TextStyle', Sc.window, [0]);
    DrawFormattedText(Sc.window, 'Please take a few moments to','center', [Sc.rect(4)*.292], [0 0 0]);
    DrawFormattedText(Sc.window, 'answer some additional questions','center', [Sc.rect(4)*.333], [0 0 0]);
    
    Screen('TextSize',Sc.window, [24]);
    % Behavioural Testing Room Parameters
    DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.305], [Sc.rect(4)*.825], [0 0 0]);
    DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.646], [Sc.rect(4)*.825], [0 0 0]);
    % End Behavioural Testing Room Parameters
    
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
    Screen('TextSize',Sc.window, [13]);
    DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
    DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
    Screen('TextSize',Sc.window, [24]);
    if i == 1
%         DrawFormattedText(Sc.window, 'I am confident in the COMPUTER 1 advisor.','center', 'center', [255 255 255]);
        DrawFormattedText(Sc.window, cogLoad24,'center', 'center', [255 255 255]);
    end
    
    Screen('Flip',Sc.window);
    ShowCursor('Arrow');
    
    while exitResponse==0 %checks for completion
        ListenChar(0);
        buttons=[];
        keyCode(spaceKey) = 0;
        keyCode = [];
        [x,y,buttons]=GetMouse();  %waits for a key-press
        
        Screen('TextSize',Sc.window, [36]);
        Screen('TextStyle', Sc.window, [0]);
        DrawFormattedText(Sc.window, 'Please take a few moments to','center', [Sc.rect(4)*.292], [0 0 0]);
        DrawFormattedText(Sc.window, 'answer some additional questions','center', [Sc.rect(4)*.333], [0 0 0]);
        Screen('TextSize',Sc.window, [24]);
        
        if i == 1
%             DrawFormattedText(Sc.window, 'I am confident in the COMPUTER 1 advisor.','center', 'center', [255 255 255]);
            DrawFormattedText(Sc.window, cogLoad24,'center', 'center', [255 255 255]);
        end
        
        Screen('TextSize',Sc.window, [24]);
        
        DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.305], [Sc.rect(4)*.825], [0 0 0]);
        DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.646], [Sc.rect(4)*.825], [0 0 0]);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
        Screen('TextSize',Sc.window, [13]);
        DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
        DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
        Screen('TextSize',Sc.window, [24]);
        if x>Sc.rect(3)*.161 && x<Sc.rect(3)*.172 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 1
            [~,~,buttons]=GetMouse();
            if (buttons(1)) == 1
                resp(i) = 1;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl1);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl1,2,2);
                Screen('Flip', Sc.window);
            end
        elseif x > Sc.rect(3)*.328 && x < Sc.rect(3)*.339 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 2
            [~,~,buttons]=GetMouse();
            if (buttons(1)) == 1
                resp(i) = 2;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl2);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
                Screen('Flip', Sc.window);
            end
        elseif x > Sc.rect(3)*.495 && x < Sc.rect(3)*.505 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 3
            [~,~,buttons]=GetMouse();
            if (buttons(1)) == 1
                resp(i) = 3;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl3);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl3,2,2);
                Screen('Flip', Sc.window);
            end
        elseif x > Sc.rect(3)*.661 && x < Sc.rect(3)*.672 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 4
            [~,~,buttons]=GetMouse();
            if (buttons(1)) == 1
                resp(i) = 4;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl4);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
                Screen('Flip', Sc.window);
            end
        elseif x > Sc.rect(3)*.828 && x < Sc.rect(3)*.839 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 5
            [~,~,buttons]=GetMouse();
            if (buttons(1))  == 1
                resp(i) = 5;
                Screen('FillOval', Sc.window, [50 0 0],ansFldOvl5);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl5,2,2);
                Screen('Flip', Sc.window);
            end
        end
        ListenChar(2);
        [~, ~, keyCode] = KbCheck;
        if keyCode(spaceKey) && resp(i) > 0
            exitResponse = true;
            Screen('Flip',Sc.window);
            ListenChar(0);
        end
    end
end
settings.question = [resp];
Screen('Flip',Sc.window);
Screen('CloseAll');

%% Notes:

