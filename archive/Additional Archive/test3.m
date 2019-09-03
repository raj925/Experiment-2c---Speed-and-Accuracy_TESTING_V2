% refine 5-item answer set
Screen('Preference', 'SkipSyncTests', 1);
Sc = start_psychtb([0 0 1366 768]);
load('questionListOriginal.mat')

i = 1;

[nx, ny] = DrawFormattedText(Sc.window, questionList{i},'center', 'center', [255 255 255], 70, 0, 0, 2);

    ansFldOvl1 = [Sc.rect(3)*.161 Sc.rect(4)*0.85 Sc.rect(3)*.172 Sc.rect(4)*.867];
    ansFldOvl2 = [Sc.rect(3)*.328 Sc.rect(4)*0.85 Sc.rect(3)*.339 Sc.rect(4)*.867];
    ansFldOvl3 = [Sc.rect(3)*.495 Sc.rect(4)*0.85 Sc.rect(3)*.505 Sc.rect(4)*.867];
    ansFldOvl4 = [Sc.rect(3)*.661 Sc.rect(4)*0.85 Sc.rect(3)*.672 Sc.rect(4)*.867];
    ansFldOvl5 = [Sc.rect(3)*.828 Sc.rect(4)*0.85 Sc.rect(3)*.839 Sc.rect(4)*.867];
    
    Screen('TextSize',Sc.window,24);
    % Home Testing Parameters
    DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.132), (Sc.rect(4)*.789), [0 0 0]);
    DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.130), (Sc.rect(4)*.825), [0 0 0]);
    
    DrawFormattedText(Sc.window, 'Disagree',(Sc.rect(3)*.296), (Sc.rect(4)*.825), [0 0 0]);
    
    DrawFormattedText(Sc.window, 'Neutral',(Sc.rect(3)*.464), (Sc.rect(4)*.825), [0 0 0]);
    
    DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.636), (Sc.rect(4)*.825), [0 0 0]);
    
    DrawFormattedText(Sc.window, 'Strongly',(Sc.rect(3)*.796), (Sc.rect(4)*.789), [0 0 0]);
    DrawFormattedText(Sc.window, 'Agree',(Sc.rect(3)*.804), (Sc.rect(4)*.825), [0 0 0]);
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
    WaitSecs(10);


Screen('CloseAll');
