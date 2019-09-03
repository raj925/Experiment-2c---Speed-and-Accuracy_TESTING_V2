function [ output_args ] = Untitled( input_args )

%% questionnaireNFCognitionScale created by Aaron Celaya, 26 Feb 2019
% Need For Cognition Scale quesitons, some based on Cacioppo, Petty, & Kao,1984

%% Start Questionnaire
% Sc = start_psychtb([0 0 1920 1200]);
spaceKey  = KbName('space');
settings.instr.instr = {'Left click with the mouse' ...
    'Press spacebar to confirm response'};
for i = 1:12
    exitResponse = 0;
    buttons=[];
    resp(i) = 0;
    ansFldOvl1 = [Sc.rect(3)*.161 Sc.rect(4)*0.85 Sc.rect(3)*.172 Sc.rect(4)*.867];
    ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
    ansFldOvl3 = [Sc.rect(3)*.495 Sc.rect(4)*0.85 Sc.rect(3)*.505 Sc.rect(4)*.867];
    ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
    ansFldOvl5 = [Sc.rect(3)*.828 Sc.rect(4)*0.85 Sc.rect(3)*.839 Sc.rect(4)*.867];
    
    %     Screen('TextSize',Sc.window, [48]);
    %     Screen('TextStyle', Sc.window, [1]);
    %     DrawFormattedText(Sc.window, 'Thank You For Completing Our Study!','center', [Sc.rect(4)*.208], [255 175 100]);
    Screen('TextSize',Sc.window, [36]);
    Screen('TextStyle', Sc.window, [0]);
    DrawFormattedText(Sc.window, 'Please take a few moments to','center', [Sc.rect(4)*.292], [0 0 0]);
    DrawFormattedText(Sc.window, 'answer some additional questions','center', [Sc.rect(4)*.333], [0 0 0]);
    
    Screen('TextSize',Sc.window, [24]);
    % Behavioural Testing Room Parameters
    DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.142], [Sc.rect(4)*.8], [0 0 0]);
    DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.14], [Sc.rect(4)*.825], [0 0 0]);
    DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.305], [Sc.rect(4)*.825], [0 0 0]);
    DrawFormattedText(Sc.window, 'Neutral',[Sc.rect(3)*.475], [Sc.rect(4)*.825], [0 0 0]);
    DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.646], [Sc.rect(4)*.825], [0 0 0]);
    DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.808], [Sc.rect(4)*.8], [0 0 0]);
    DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.814], [Sc.rect(4)*.825], [0 0 0]);
    % End Behavioural Testing Room Parameters
    
    %     % EEG Room parameters
    %     DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.142], [Sc.rect(4)*.75], [0 0 0]);
    %     DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.14], [Sc.rect(4)*.775], [0 0 0]);
    %     DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.305], [Sc.rect(4)*.775], [0 0 0]);
    %     DrawFormattedText(Sc.window, 'Neutral',[Sc.rect(3)*.475], [Sc.rect(4)*.775], [0 0 0]);
    %     DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.646], [Sc.rect(4)*.775], [0 0 0]);
    %     DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.808], [Sc.rect(4)*.75], [0 0 0]);
    %     DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.814], [Sc.rect(4)*.775], [0 0 0]);
    %     % End EEG Room parameters
    
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl1);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl1,2,2);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl3);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl3,2,2);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
    Screen('FillOval', Sc.window, [0 0 0],ansFldOvl5);
    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl5,2,2);
    
    Screen('TextSize',Sc.window, [13]);
    DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
    DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
    Screen('TextSize',Sc.window, [24]);
    if i == 1
        DrawFormattedText(Sc.window, 'I would prefer complex to simple problems.','center', 'center', [255 255 255]);
    elseif i == 2
        DrawFormattedText(Sc.window, 'I like to have the responsibility of handling a situation that requires a lot of thinking.','center', 'center', [255 255 255]);
    elseif i == 3
        DrawFormattedText(Sc.window, 'Thinking is not my idea of fun.','center', 'center', [255 255 255]);
    elseif i == 4
        DrawFormattedText(Sc.window, 'I would rather do something that requires little thought than something that is sure to challenge my thinking abilities.','center', 'center', [255 255 255]);
    elseif i == 5
        DrawFormattedText(Sc.window, 'I try to anticipate and avoid situations where there is likely chance I will have to think in depth about something.','center', 'center', [255 255 255]);
    elseif i == 6
        DrawFormattedText(Sc.window, 'I find satisfation in deliberating hard and for long hours.','center', 'center', [255 255 255]);
    elseif i == 7
        DrawFormattedText(Sc.window, 'I only think as hard as I have to.','center', 'center', [255 255 255]);
    elseif i == 8
        DrawFormattedText(Sc.window, 'I prefer to think about small, daily projects to long-term ones.','center', 'center', [255 255 255]);
    elseif i == 9
        DrawFormattedText(Sc.window, 'I like tasks that require little thought once I have learned them.','center', 'center', [255 255 255]);
    elseif i == 10
        DrawFormattedText(Sc.window, 'The idea of relying on thought to make my way to the top appeals to me.','center', 'center', [255 255 255]);
    elseif i == 11
        DrawFormattedText(Sc.window, 'I really enjoy a task that involves coming up with new solutions to problems.','center', 'center', [255 255 255]);
    elseif i == 12
        DrawFormattedText(Sc.window, 'Learning new ways to think does not excite me very much.','center', 'center', [255 255 255]);
    elseif i == 13
        DrawFormattedText(Sc.window, 'I prefer my life to be filled with puzzles that I must solve.','center', 'center', [255 255 255]);
    elseif i == 14
        DrawFormattedText(Sc.window, 'The notion of thinking abstractly is appealing to me.','center', 'center', [255 255 255]);
    elseif i == 15
        DrawFormattedText(Sc.window, 'I would prefer a task that is intellectual, difficult, and important to one that is somewhat important but does not require much thought.','center', 'center', [255 255 255]);
    elseif i == 16
        DrawFormattedText(Sc.window, 'I feel relief rather than satisfaction after completing a task that required a lot of mental effort.','center', 'center', [255 255 255]);
    elseif i == 17
        DrawFormattedText(Sc.window, 'It is enough for me that something gets the job done; I do not care how or why it works.','center', 'center', [255 255 255]);
    elseif i == 18
        DrawFormattedText(Sc.window, 'I usually end up deliberating about issues even when they do not affect me personally.','center', 'center', [255 255 255]);
    end
    
    Screen('Flip',Sc.window);
    ShowCursor('Arrow');
    
    questionList={'I prefer complex to simple problems.'...
        'I like to have the responsibility of handling a situation that requires a lot of thinking.'...
        'Thinking is not my idea of fun.'...
        'I would rather do something that requires little thought than something that is sure to challenge my thinking abilities.'...
        'I try to anticipate and avoid situations where there is a likely chance I will have to think in depth about something.'...
        'I find satisfation in deliberating hard and for long hours.'...
        'I only think as hard as I have to.'...
        'I prefer to think about small daily projects to long term ones.'...
        'I like tasks that require little thought once I''ve learned them.'...
        'The idea of relying on thought to make my way to the top appeals to me.'...
        'I really enjoy a task that involves coming up with new solutions to problems.'...
        'Learning new ways to think doesn''t excite me very much.'...
        'I prefer my life to be filled with puzzles I must solve.'...
        'The notion of thinking abstractly is appealing to me.'...
        'I would prefer a task that is intellectual, difficult, and important to one that is somewhat important but does not require much thought.'...
        'I feel relief rather than satisfaction after completing a task that requires a lot of mental effort.'...
        'It''s enough for me that something gets the job done; I don''t care how or why it works.'...
        'I usually end up deliberating about issues even when they do not affect me personally.'};
    
    while exitResponse==0 %checks for completion
        ListenChar(0);
        buttons=[];
        keyCode(spaceKey) = 0;
        keyCode = [];
        [x,y,buttons]=GetMouse();  %waits for a key-press
        
        %         Screen('TextSize',Sc.window, [48]);
        %         Screen('TextStyle', Sc.window, [1]);
        %         DrawFormattedText(Sc.window, 'Thank You For Completing Our Study!','center', [Sc.rect(4)*.208], [255 175 100]);
        Screen('TextSize',Sc.window, [36]);
        Screen('TextStyle', Sc.window, [0]);
        DrawFormattedText(Sc.window, 'Please take a few moments to','center', [Sc.rect(4)*.292], [0 0 0]);
        DrawFormattedText(Sc.window, 'answer some additional questions','center', [Sc.rect(4)*.333], [0 0 0]);
        Screen('TextSize',Sc.window, [24]);
        
        if i == 1
            DrawFormattedText(Sc.window, 'I am confident in the COMPUTER 1 advisor.','center', 'center', [255 255 255]);
        elseif i == 2
            DrawFormattedText(Sc.window, 'The COMPUTER 1 advisor is dependable.','center', 'center', [255 255 255]);
        elseif i == 3
            DrawFormattedText(Sc.window, 'The COMPUTER 1 advisor is reliable.','center', 'center', [255 255 255]);
        elseif i == 4
            DrawFormattedText(Sc.window, 'I can trust the COMPUTER 1 advisor.','center', 'center', [255 255 255]);
        elseif i == 5
            DrawFormattedText(Sc.window, 'I am confident in the COMPUTER 2 advisor.','center', 'center', [255 255 255]);
        elseif i == 6
            DrawFormattedText(Sc.window, 'The COMPUTER 2 advisor is dependable.','center', 'center', [255 255 255]);
        elseif i == 7
            DrawFormattedText(Sc.window, 'The COMPUTER 2 advisor is reliable.','center', 'center', [255 255 255]);
        elseif i == 8
            DrawFormattedText(Sc.window, 'I can trust the COMPUTER 2 advisor.','center', 'center', [255 255 255]);
        elseif i == 9
            DrawFormattedText(Sc.window, 'I feel that the task was too easy.','center', 'center', [255 255 255]);
        elseif i == 10
            DrawFormattedText(Sc.window, 'This task would be much harder without an advisor.','center', 'center', [255 255 255]);
        elseif i == 11
            DrawFormattedText(Sc.window, 'I believe that the COMPUTER 2 advice was from a real algorithm.','center', 'center', [255 255 255]);
        elseif i == 12
            DrawFormattedText(Sc.window, 'I believe that the COMPUTER 1 advice was from a real algorithm.','center', 'center', [255 255 255]);
        end
        
        Screen('TextSize',Sc.window, [24]);
        % Behavioural Testing Room Parameters
        DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.142], [Sc.rect(4)*.8], [0 0 0]);
        DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.14], [Sc.rect(4)*.825], [0 0 0]);
        DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.305], [Sc.rect(4)*.825], [0 0 0]);
        DrawFormattedText(Sc.window, 'Neutral',[Sc.rect(3)*.475], [Sc.rect(4)*.825], [0 0 0]);
        DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.646], [Sc.rect(4)*.825], [0 0 0]);
        DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.808], [Sc.rect(4)*.8], [0 0 0]);
        DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.814], [Sc.rect(4)*.825], [0 0 0]);
        % End Behavioural Testing Room Parameters
        
        %             % EEG Room Parameters
        %                    DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.142], [Sc.rect(4)*.75], [0 0 0]);
        %         DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.14], [Sc.rect(4)*.775], [0 0 0]);
        %         DrawFormattedText(Sc.window, 'Disagree',[Sc.rect(3)*.305], [Sc.rect(4)*.775], [0 0 0]);
        %         DrawFormattedText(Sc.window, 'Neutral',[Sc.rect(3)*.475], [Sc.rect(4)*.775], [0 0 0]);
        %         DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.646], [Sc.rect(4)*.775], [0 0 0]);
        %         DrawFormattedText(Sc.window, 'Strongly',[Sc.rect(3)*.808], [Sc.rect(4)*.75], [0 0 0]);
        %         DrawFormattedText(Sc.window, 'Agree',[Sc.rect(3)*.814], [Sc.rect(4)*.775], [0 0 0]);
        %         % End EEG Room Parameters
        
        Screen('FillOval', Sc.window, [00 0 0],ansFldOvl1);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl1,2,2);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl2);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl3);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl3,2,2);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl4);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl5);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl5,2,2);
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
% Screen('CloseAll');

%% Notes:



end

