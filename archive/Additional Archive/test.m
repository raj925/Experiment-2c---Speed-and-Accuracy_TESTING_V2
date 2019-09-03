% roomIDs: office = 1, Home = 2, BehLab = 3, EEG = 4, BonusRoom = 5
roomID = 2;
whichQuestionList = 1;


if roomID == 1 % office
    Screen('Preference', 'SkipSyncTests', 1);
    Sc = start_psychtb([0 0 1920 1200]);
elseif roomID == 2 % home
    Screen('Preference', 'SkipSyncTests', 1); 
    Sc = start_psychtb([0 0 1366 768]);
elseif roomID >= 3 %3 = BehLab, 4 = EEG, 5 = BonusRoom
    Sc = start_psychtb(0);
end

if whichQuestionList == 1
    load('questionListNFCognition.mat')
elseif whichQuestionList == 2
    load('questionListNFClosure.mat')
elseif whichQuestionList == 3
    load('questionListOriginal.mat')
end

for i = 1:length(questionList)
    
    [nx, ny] = DrawFormattedText(Sc.window, questionList{i},'center', 'center', [255 255 255], 70, 0, 0, 2);
    
    ansFldOvl1 = [Sc.rect(3)*.161 Sc.rect(4)*0.85 Sc.rect(3)*.172 Sc.rect(4)*.867];
    ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
    ansFldOvl3 = [Sc.rect(3)*.495 Sc.rect(4)*0.85 Sc.rect(3)*.505 Sc.rect(4)*.867];
    ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
    ansFldOvl5 = [Sc.rect(3)*.828 Sc.rect(4)*0.85 Sc.rect(3)*.839 Sc.rect(4)*.867];
    
    Screen('TextSize',Sc.window,24);
    % Home Testing Parameters
    DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.142), (Sc.rect(4)*.79), [0 0 0]);
    DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.14), (Sc.rect(4)*.825), [0 0 0]);
    DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.305), (Sc.rect(4)*.825), [0 0 0]);
    DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.475), (Sc.rect(4)*.825), [0 0 0]);
    DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.646), (Sc.rect(4)*.825), [0 0 0]);
    DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.808), (Sc.rect(4)*.79), [0 0 0]);
    DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.814), (Sc.rect(4)*.825), [0 0 0]);
    % End Home Testing Parameters
    
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
    
    Screen('Flip',Sc.window);
    WaitSecs(5);
end

Screen('CloseAll');
