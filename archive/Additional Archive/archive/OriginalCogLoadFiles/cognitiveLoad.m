%% Cognitive Load Manipulation Script, Study 2b
% Created by Aaron Celaya, February 2019

% Sc = start_psychtb([0 0 1920 1200]); % for debugging
Screen('Preference', 'SkipSyncTests', 1); % for debugging
Sc = start_psychtb([0 0 1366 768]); % for debugging
spaceKey  = KbName('space');
settings.instr.instr = {'Left click with the mouse' ...
    'Press spacebar to confirm response'};
ShowCursor('Arrow');

%% For Debugging
% Create Cognitive Load Table
[cognitiveLoadTable] = createCogLoadTable();

for i = 1:510
    t=i;
    w6=270;
    w7=330;
    w8=390;
    w9=450;
    
    if t == w6+1 || t == w6+11 || t == w6+21 || t == w6+31 || t == w6+41 || t == w6+51 || t == w7+1 || t == w7+11 || t == w7+21 || t == w7+31 || t == w7+41 || t == w7+51 ||...
            t == w8+1 || t == w8+11 || t == w8+21 || t == w8+31 || t == w8+41 || t == w8+51 || t == w9+1 || t == w9+11 || t == w9+21 || t == w9+31 || t == w9+41 || t == w9+51 || t == 510
        
        %% Regular Script Continues
        if t==w6+1;b=1;elseif t==w6+11;b=2;elseif t==w6+21;b=3;elseif t==w6+31;b=4;elseif t==w6+41;b=5;elseif t == w6+51;...
                b=6;elseif t==w7+1;b=7;elseif t==w7+11;b = 8;elseif t==w7+21;b=9;elseif t==w7+31;b=10;elseif t==w7+41;...
                b=11;elseif t==w7+51;b=12;elseif t==w8+1;b=13;elseif t==w8+11;b=14;elseif t==w8+21;b=15;elseif t==w8+31;...
                b=16;elseif t==w8+41;b=17;elseif t==w8+51;b=18;elseif t==w9+1;b=19;elseif t==w9+11;b=20;elseif t==w9+21;...
                b=21;elseif t==w9+31;b=22;elseif t==w9+41;b=23;elseif t==w9+51;b=24;elseif t == 510;b=25;
        end
        cognitiveLoadTable(b).trialNumber=t;
        
        exitResponse = 0;
        buttons=[];
        resp(b) = 0;
        
        if b==1
            partI = true;
            partII = false;
        elseif b==2||b==3||b==4||b==5||b==6||b==7||b==8||b==9||b==10||b==11||...
                b==12||b==13||b==14||b==15||b==16||b==17||b==18||b==19||b==20||b==21||...
                b==22||b==23||b==24
            partII = true;
            partI = true;
        elseif b==25
            partII = true;
            partI = false;
        end
        
        if (partII) %(check last letters, give feedback, time penalty if incorrect)
            Screen('TextSize',Sc.window, [36]);
            Screen('TextStyle', Sc.window, [0]);
            DrawFormattedText(Sc.window, 'Are these the same letters you saw previously?','center', [Sc.rect(4)*.292], [0 0 0]);
            DrawFormattedText(Sc.window, 'Answer YES if they are the same letters','center', [Sc.rect(4)*.333], [0 0 0]);
            DrawFormattedText(Sc.window, 'and appear in the same order.','center', [Sc.rect(4)*.374], [0 0 0]);
            ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
            ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
            Screen('TextSize',Sc.window, [24]);
            DrawFormattedText(Sc.window, 'No',[Sc.rect(3)*.305], [Sc.rect(4)*.825], [0 0 0]);
            DrawFormattedText(Sc.window, 'Yes',[Sc.rect(3)*.646], [Sc.rect(4)*.825], [0 0 0]);
            Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
            Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
            Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
            Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
            
            Screen('TextSize',Sc.window, [13]);
            DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
            DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
            Screen('TextSize',Sc.window, [48]);
            cognitiveLoadTable(b).cogLoadManip = true;
            
            DrawFormattedText(Sc.window, cognitiveLoadTable(b-1).targetLetters,'center', 'center', [255 255 255]);
            Screen('Flip',Sc.window);
            ShowCursor('Arrow');
            
            % Collect Response
            while exitResponse==0 %checks for completion
                ListenChar(0);
                buttons=[];
                keyCode(spaceKey) = 0;
                keyCode = [];
                [x,y,buttons]=GetMouse();  %waits for a key-press
                
                Screen('TextSize',Sc.window, [36]);
                Screen('TextStyle', Sc.window, [0]);
                DrawFormattedText(Sc.window, 'Are these the same letters you saw previously?','center', [Sc.rect(4)*.292], [0 0 0]);
                %                 DrawFormattedText(Sc.window, 'Answer YES if they are the same letters and appear in the same order.','center', [Sc.rect(4)*.333], [0 0 0]);
                DrawFormattedText(Sc.window, 'Answer YES if they are the same letters','center', [Sc.rect(4)*.333], [0 0 0]);
                DrawFormattedText(Sc.window, 'and appear in the same order.','center', [Sc.rect(4)*.374], [0 0 0]);
                ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
                ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
                Screen('TextSize',Sc.window, [24]);
                DrawFormattedText(Sc.window, 'No',[Sc.rect(3)*.305], [Sc.rect(4)*.825], [0 0 0]);
                DrawFormattedText(Sc.window, 'Yes',[Sc.rect(3)*.646], [Sc.rect(4)*.825], [0 0 0]);
                Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
                Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
                Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
                
                Screen('TextSize',Sc.window, [13]);
                DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
                DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
                Screen('TextSize',Sc.window, [48]);
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
            % create time penalty for incorrect answers
            if b>1
                if cognitiveLoadTable(b-1).rightOrWrong == 1 && cognitiveLoadTable(b-1).answer == 2
                    cognitiveLoadTable(b-1).correct = 0;
                    cognitiveLoadTable(b-1).timingPenalty = 1;
                    Screen('TextSize',Sc.window, [36]);
                    Screen('TextStyle', Sc.window, [0]);
                    %                     DrawFormattedText(Sc.window, 'test','center', [Sc.rect(4)*.292], [0 0 0]);
                    %                     DrawFormattedText(Sc.window, 'test','center', [Sc.rect(4)*.333], [0 0 0]);
                    DrawFormattedText(Sc.window, 'TIMING PENALTY FOR INCORRECT ANSWER','center', 'center', [0 0 0]);
                    DrawFormattedText(Sc.window, 'Please wait for the next screen to appear.','center', [Sc.rect(4)*.725], [0 0 0]);
                    DrawFormattedText(Sc.window, 'Do not interact with the keyboard or mouse during this time.','center', [Sc.rect(4)*.825], [0 0 0]);
                    Screen('Flip',Sc.window);
                    WaitSecs(5);
                elseif cognitiveLoadTable(b-1).rightOrWrong == 0 && cognitiveLoadTable(b-1).answer == 4
                    cognitiveLoadTable(b-1).correct = 0;
                    cognitiveLoadTable(b-1).timingPenalty = 1;
                    Screen('TextSize',Sc.window, [36]);
                    Screen('TextStyle', Sc.window, [0]);
                    %                     DrawFormattedText(Sc.window, 'test','center', [Sc.rect(4)*.292], [0 0 0]);
                    %                     DrawFormattedText(Sc.window, 'test','center', [Sc.rect(4)*.333], [0 0 0]);
                    DrawFormattedText(Sc.window, 'TIMING PENALTY FOR INCORRECT ANSWER','center', 'center', [0 0 0]);
                    DrawFormattedText(Sc.window, 'Please wait for the next screen to appear.','center', [Sc.rect(4)*.725], [0 0 0]);
                    DrawFormattedText(Sc.window, 'Do not interact with the keyboard or mouse during this time.','center', [Sc.rect(4)*.825], [0 0 0]);
                    Screen('Flip',Sc.window);
                    WaitSecs(5);
                else
                    cognitiveLoadTable(b-1).correct = 1;
                end
            end
        end
        
        if (partI) %(show new letters)
            exitResponse = 0;
            buttons=[];
            resp(b) = 0;
            
            Screen('TextSize',Sc.window, [36]);
            Screen('TextStyle', Sc.window, [0]);
            DrawFormattedText(Sc.window, 'Please take a few moments to','center', [Sc.rect(4)*.292], [0 0 0]);
            DrawFormattedText(Sc.window, 'memorize the letters below','center', [Sc.rect(4)*.333], [0 0 0]);
            DrawFormattedText(Sc.window, 'Press the Spacebar when ready to continue','center', [Sc.rect(4)*.825], [0 0 0]);
            Screen('TextSize',Sc.window, [48]);
            cognitiveLoadTable(b).cogLoadManip = true;
            DrawFormattedText(Sc.window, cognitiveLoadTable(b).newLetters,'center', 'center', [255 255 255]);Screen('Flip',Sc.window);pause(1);
            while exitResponse==0;ListenChar(0);buttons=[];keyCode(spaceKey) = 0;keyCode = [];[x,y,buttons]=GetMouse();ListenChar(2);resp(b) = 1;[~, ~, keyCode] = KbCheck;
                if keyCode(spaceKey) && resp(b) > 0;exitResponse = true;Screen('Flip',Sc.window);ListenChar(0);end
            end
        end
        keyCode(spaceKey) = 0;
    end %for debugging
end %for debugging
cognitiveLoadTable(25) = [];
Screen('Flip',Sc.window);
Screen('CloseAll'); % for debugging
%% Notes:
