function [settings] = questionnaireFunction(settings, Sc)
%% Questionnaire Function created by Aaron Celaya, 27 Feb 2019

%% For debugging
% settings.roomIDs: office = 1, Home = 2, BehLab = 3, EEG = 4, BonusRoom = 5
% settings.roomID = 2;
% settings.whichQuestionList = 3;

% Set parameters based on which machine is being used
% if settings.roomID == 1 % office
%     Screen('Preference', 'SkipSyncTests', 1);
%     Sc = start_psychtb([0 0 1920 1200]);
% elseif settings.roomID == 2 % home
%     Screen('Preference', 'SkipSyncTests', 1);
%     Sc = start_psychtb([0 0 1366 768]);
% elseif settings.roomID >= 3 %3 = BehLab, 4 = EEG, 5 = BonusRoom
%     Sc = start_psychtb(0);
% end

% End debugging

%% Regular function continues

% Load appropriate questionnaire, 1= NFCognition, 2 = NFClosure, 3 = Original
if settings.whichQuestionList == 1
    questionnaire = load('questionListNFCognition.mat');
elseif settings.whichQuestionList == 2
    questionnaire = load('questionListNFClosure.mat');
elseif settings.whichQuestionList == 3
    questionnaire = load('questionListOriginal.mat');
end

% Bring spaceKey and instruction settings
spaceKey  = KbName('space');
settings.instr.instr = {'Left click with the mouse' ...
    'Press spacebar to confirm response'};

%% Loop for questions
for i = 1:length(questionnaire.questionList)
    % ensure exit parameters are set to null values
    exitResponse = 0;
    buttons=[];
    resp(i) = 0;
    
    % Define Answer Fields
    if settings.whichQuestionList == 2
        ansFldOvl1 = [Sc.rect(3)*.15 Sc.rect(4)*0.85 Sc.rect(3)*.161 Sc.rect(4)*.867];
        ansFldOvl2 = [Sc.rect(3)*.29 Sc.rect(4)*0.85 Sc.rect(3)*.301 Sc.rect(4)*.867];
        ansFldOvl3 = [Sc.rect(3)*.43 Sc.rect(4)*0.85 Sc.rect(3)*.441 Sc.rect(4)*.867];
        ansFldOvl4 = [Sc.rect(3)*.57 Sc.rect(4)*0.85 Sc.rect(3)*.581 Sc.rect(4)*.867];
        ansFldOvl5 = [Sc.rect(3)*.71 Sc.rect(4)*0.85 Sc.rect(3)*.721 Sc.rect(4)*.867];
        ansFldOvl6 = [Sc.rect(3)*.85 Sc.rect(4)*0.85 Sc.rect(3)*.861 Sc.rect(4)*.867];
    elseif settings.whichQuestionList == 1 || settings.whichQuestionList == 3
        ansFldOvl1 = [Sc.rect(3)*.161 Sc.rect(4)*0.85 Sc.rect(3)*.172 Sc.rect(4)*.867];
        ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
        ansFldOvl3 = [Sc.rect(3)*.495 Sc.rect(4)*0.85 Sc.rect(3)*.505 Sc.rect(4)*.867];
        ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
        ansFldOvl5 = [Sc.rect(3)*.828 Sc.rect(4)*0.85 Sc.rect(3)*.839 Sc.rect(4)*.867];
    end
    
    % Add additional text for final questionnaire
    if settings.whichQuestionList == 3
        Screen('TextSize',Sc.window,36);
        Screen('TextStyle', Sc.window,0);
        [~, ~] = DrawFormattedText(Sc.window, 'Please take a few moments to answer some additional questions.','center', (Sc.rect(4)*.292), [255 255 255], 40, 0, 0, 1.1);
    end
    
    Screen('TextSize',Sc.window,24); % set text size for answer oval descriptors
    if settings.whichQuestionList == 2 % questionnaire with 6-item answer scale
        if settings.roomID == 1 || settings.roomID == 3 || settings.roomID == 5 % settings.roomIDs: office = 1, BehLab = 3, BonusRoom = 5
            % Behavioural Testing Parameters for 6-item
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.122), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.119), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.246), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.256), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.404), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.397), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.542), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.545), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.662), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.684), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.822), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.83), (Sc.rect(4)*.825), [0 0 0]);
            % Behavioural Testing Parameters for 6-item
        elseif settings.roomID == 2 % settings.roomIDs: Home = 2
            % Home Testing Parameters for 6-item
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.122), (Sc.rect(4)*.79), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.119), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.246), (Sc.rect(4)*.79), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.256), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.404), (Sc.rect(4)*.79), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.397), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.542), (Sc.rect(4)*.79), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.545), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.662), (Sc.rect(4)*.79), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.684), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.822), (Sc.rect(4)*.79), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.83), (Sc.rect(4)*.825), [0 0 0]);
            % Home Testing Parameters for 6-item
        elseif settings.roomID == 4 % settings.roomIDs: EEG = 4
            % EEG Testing Parameters for 6-item
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.122), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.119), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.246), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.256), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.404), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.397), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.542), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.545), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.662), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.684), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.822), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.83), (Sc.rect(4)*.775), [0 0 0]);
            % EEG Testing Parameters for 6-item
        end
    elseif settings.whichQuestionList == 1 || settings.whichQuestionList == 3   % questionnaires with 5-item answer scales
        if settings.roomID == 1 || settings.roomID == 3 || settings.roomID == 5
            % Behavioural Testing Room Parameters
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.13), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.8), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.801), (Sc.rect(4)*.825), [0 0 0]);
            % End Behavioural Testing Room Parameters
        elseif settings.roomID == 2
            % Home Testing Parameters
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.789), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.13), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.825), [0 0 0]);
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.789), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.801), (Sc.rect(4)*.825), [0 0 0]);
            % End Home Testing Parameters
        elseif settings.roomID == 4
            % EEG Room parameters
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.13), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.775), [0 0 0]);
            DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.75), [0 0 0]);
            DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.801), (Sc.rect(4)*.775), [0 0 0]);
            % End EEG Room parameters
        end
    end
    
    % Frame and fill answer ovals
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
    if settings.whichQuestionList == 2
        Screen('FillOval', Sc.window, [0 0 0],ansFldOvl6);
        Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl6,2,2);
    end
    
    % Add Instructions to bottom of screen
    Screen('TextSize',Sc.window,13);
    DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
    DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
    
    % Set text size for and draw questionnaire item
    Screen('TextSize',Sc.window,24);
    [~, ~] = DrawFormattedText(Sc.window, questionnaire.questionList{i},'center', 'center', [255 255 255], 70, 0, 0, 2);
    
    Screen('Flip',Sc.window);
    ShowCursor('Arrow');
    
    while exitResponse==0 %checks for completion
        % Again ensure exit variables are set to null values
        ListenChar(0);
        buttons=[];
        keyCode(spaceKey) = 0;
        keyCode = [];
        [x,y,buttons]=GetMouse();  %waits for a key-press
        
        % Add additional text for final questionnaire
        if settings.whichQuestionList == 3
            Screen('TextSize',Sc.window,36);
            Screen('TextStyle', Sc.window,0);
            [~, ~] = DrawFormattedText(Sc.window, 'Please take a few moments to answer some additional questions.','center', (Sc.rect(4)*.292), [255 255 255], 40, 0, 0, 1.1);
        end
        
        Screen('TextSize',Sc.window,24); % set text size for answer oval descriptors
        if settings.whichQuestionList == 2 % questionnaire with 6-item answer scale
            if settings.roomID == 1 || settings.roomID == 3 || settings.roomID == 5 % settings.roomIDs: office = 1, BehLab = 3, BonusRoom = 5
                % Behavioural Testing Parameters for 6-item
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.122), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.119), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.246), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.256), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.404), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.397), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.542), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.545), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.662), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.684), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.822), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.83), (Sc.rect(4)*.825), [0 0 0]);
                % Behavioural Testing Parameters for 6-item
            elseif settings.roomID == 2 % settings.roomIDs: Home = 2
                % Home Testing Parameters for 6-item
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.122), (Sc.rect(4)*.79), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.119), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.246), (Sc.rect(4)*.79), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.256), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.404), (Sc.rect(4)*.79), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.397), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.542), (Sc.rect(4)*.79), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.545), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.662), (Sc.rect(4)*.79), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.684), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.822), (Sc.rect(4)*.79), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.83), (Sc.rect(4)*.825), [0 0 0]);
                % Home Testing Parameters for 6-item
            elseif settings.roomID == 4 % settings.roomIDs: EEG = 4
                % EEG Testing Parameters for 6-item
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.122), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.119), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.246), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.256), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.404), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.397), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Slightly',(Sc.rect(3)*.542), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.545), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Moderately',(Sc.rect(3)*.662), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.684), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.822), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.83), (Sc.rect(4)*.775), [0 0 0]);
                % EEG Testing Parameters for 6-item
            end
        elseif settings.whichQuestionList == 1 || settings.whichQuestionList == 3   % questionnaires with 5-item answer scales
            if settings.roomID == 1 || settings.roomID == 3 || settings.roomID == 5
                % Behavioural Testing Room Parameters
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.13), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.8), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.801), (Sc.rect(4)*.825), [0 0 0]);
                % End Behavioural Testing Room Parameters
            elseif settings.roomID == 2
                % Home Testing Parameters
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.789), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.13), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.825), [0 0 0]);
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.789), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.801), (Sc.rect(4)*.825), [0 0 0]);
                % End Home Testing Parameters
            elseif settings.roomID == 4
                % EEG Room parameters
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.13), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.775), [0 0 0]);
                DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.75), [0 0 0]);
                DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.801), (Sc.rect(4)*.775), [0 0 0]);
                % End EEG Room parameters
            end
        end
        
        % Frame and fill answer ovals
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
        if settings.whichQuestionList == 2
            Screen('FillOval', Sc.window, [0 0 0],ansFldOvl6);
            Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl6,2,2);
        end
        
        % Add Instructions to bottom of screen
        Screen('TextSize',Sc.window,13);
        DrawFormattedText(Sc.window, settings.instr.instr{1}, 'center', (Sc.rect(4)).*0.93, 0);
        DrawFormattedText(Sc.window, settings.instr.instr{2}, 'center', (Sc.rect(4)).*0.95, 0);
        
        % Set text size for and draw questionnaire item
        Screen('TextSize',Sc.window,24);
        [~, ~] = DrawFormattedText(Sc.window, questionnaire.questionList{i},'center', 'center', [255 255 255], 70, 0, 0, 2);
        
        %% Collect user input (mouse click and which answer) for exit response
        if settings.whichQuestionList == 2 % defines x and y values for GetMouse in 6-item answer scale
            if x>Sc.rect(3)*.15 && x<Sc.rect(3)*.161 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 1
                [~,~,buttons]=GetMouse();
                if (buttons(1)) == 1
                    resp(i) = 1;
                    Screen('FillOval', Sc.window, [50 0 0],ansFldOvl1);
                    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl1,2,2);
                    Screen('Flip', Sc.window);
                end
            elseif x > Sc.rect(3)*.29 && x < Sc.rect(3)*.301 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 2
                [~,~,buttons]=GetMouse();
                if (buttons(1)) == 1
                    resp(i) = 2;
                    Screen('FillOval', Sc.window, [50 0 0],ansFldOvl2);
                    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl2,2,2);
                    Screen('Flip', Sc.window);
                end
            elseif x > Sc.rect(3)*.43 && x < Sc.rect(3)*.441 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 3
                [~,~,buttons]=GetMouse();
                if (buttons(1)) == 1
                    resp(i) = 3;
                    Screen('FillOval', Sc.window, [50 0 0],ansFldOvl3);
                    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl3,2,2);
                    Screen('Flip', Sc.window);
                end
            elseif x > Sc.rect(3)*.57 && x < Sc.rect(3)*.581 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 4
                [~,~,buttons]=GetMouse();
                if (buttons(1)) == 1
                    resp(i) = 4;
                    Screen('FillOval', Sc.window, [50 0 0],ansFldOvl4);
                    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl4,2,2);
                    Screen('Flip', Sc.window);
                end
            elseif x > Sc.rect(3)*.71 && x < Sc.rect(3)*.721 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 5
                [~,~,buttons]=GetMouse();
                if (buttons(1))  == 1
                    resp(i) = 5;
                    Screen('FillOval', Sc.window, [50 0 0],ansFldOvl5);
                    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl5,2,2);
                    Screen('Flip', Sc.window);
                end
            elseif x > Sc.rect(3)*.85 && x < Sc.rect(3)*.861 && y>Sc.rect(4)*0.85 && y<Sc.rect(4)*.867 % oval 6
                [~,~,buttons]=GetMouse();
                if (buttons(1))  == 1
                    resp(i) = 6;
                    Screen('FillOval', Sc.window, [50 0 0],ansFldOvl6);
                    Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl6,2,2);
                    Screen('Flip', Sc.window);
                end
            end
        elseif settings.whichQuestionList == 1 || settings.whichQuestionList == 3  % defines x and y values for GetMouse in 5-item answer scale
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

% Save questionnaire answers, 1= NFCognition, 2 = NFClosure, 3 = Original
if settings.whichQuestionList == 1
    settings.questionAnsNFCognition = resp;
elseif settings.whichQuestionList == 2
    settings.questionAnsNFClosure = resp;
elseif settings.whichQuestionList == 3
    settings.questionAnsOriginal = resp;
end
Screen('Flip',Sc.window);
% Screen('CloseAll');

%% Notes:


end

