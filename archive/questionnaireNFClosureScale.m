function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% Questionnaire created by Aaron Celaya, 28 Feb 2018
% Basic survey quesitons, some based off of Jian's work

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
    
    Screen('Flip',Sc.window);
    ShowCursor('Arrow');
    
    questionList={'I think that having clear rules and order at work is essential for success.'...
        'Even after I''ve made up my mind about something, I am always eager to consider a different opinion.'...
        'I don''t like situations that are uncertain.'...
        'I dislike questions which could be answered in many different ways.'...
        'I like to have friends who are unpredictable.'...
        'I find that a well ordered life with regular hours suits my temperament.'...
        'I enjoy the uncertainty of going into a new situation without knowing what might happen.'...
        'When dining out, I like to go to places where I have been before so that I know what to expect.'...
        'I feel uncomfortable when I don''t understand the reason why an event occurred in my life.'...
        'I feel irritated when one person disagrees with what everyone else in a group believes.'...
        'I hate to change my plans at the last minute.'...
        'I would describe myself as indecisive.'...
        'When I go shopping, I have difficulty deciding exactly what it is I want.'...
        'When faced with a problem I usually see the one best solution very quickly.'...
        'When I am confused about an important issue, I feel very upset.'...
        'I tend to put off making important decisions until the last possible moment.'...
        'I usually make important decisions quickly and confidently.'...
        'I have never been late for an appointment or work.'...
        'I think it is fun to change my plans at the last moment.'...
        'My personal space is usually messy and disorganized.'...
        'In most social conflicts, I can easily see which side is right and which is wrong.'...        
        'I have never known someone I did not like.'...
        'I tend to struggle with most decisions.'...
        'I believe orderliness and organization are among the most important characteristics of a good student.'...
        'When considering most conflict situations, I can usually see how both sides could be right.'...
        'I don''t like to be with people who are capable of unexpected actions.'...
        'I prefer to socialize with familiar friends because I know what to expect from them.'...
        'I think that I would learn best in a class that lacks clearly stated objectives and requirements.'...
        'When thinking about a problem, I consider as many different opinions on the issue as possible.'...
        'I don''t like to go into a situation without knowing what I can expect from it.'...
        'I like to know what people are thinking all the time.'...        
        'I dislike it when a person''s statement could mean many different things.'...
        'It''s annoying to listen to someone who cannot seem to make up his or her mind.'...
        'I find that establishing a consistent routine enables me to enjoy life more.'...
        'I enjoy having a clear and structured mode of life.'...
        'I prefer interacting with people whose opinions are very different from my own.'...
        'I like to have a plan for everything and a place for everything.'...
        'I feel uncomfortable when someone''s meaning or intention is unclear to me.'...
        'I believe that one should never engage in leisure activities.'...
        'When trying to solve a problem I often see so many possible options that it''s confusing.'...
        'I always see many possible solutions to problems I face.'...        
        'I''d rather know bad news than stay in a state of uncertainty.'...
        'I feel that there is no such thing as an honest mistake.'...
        'I do not usually consult many different options before forming my own view.'...
        'I dislike unpredictable situations.'...
        'I have never hurt another person''s feelings.'...
        'I dislike the routine aspects of my work (studies).'};
    
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

