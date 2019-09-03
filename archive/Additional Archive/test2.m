% creating 6-item answer set

Screen('Preference', 'SkipSyncTests', 1);
Sc = start_psychtb([0 0 1366 768]);
load('questionListOriginal.mat')

i = 1;

[nx, ny] = DrawFormattedText(Sc.window, questionList{i},'center', 'center', [255 255 255], 70, 0, 0, 2);

ansFldOvl1 = [Sc.rect(3)*.15 Sc.rect(4)*0.85 Sc.rect(3)*.161 Sc.rect(4)*.867];
ansFldOvl2 = [Sc.rect(3)*.29 Sc.rect(4)*0.85 Sc.rect(3)*.301 Sc.rect(4)*.867];
ansFldOvl3 = [Sc.rect(3)*.43 Sc.rect(4)*0.85 Sc.rect(3)*.441 Sc.rect(4)*.867];
ansFldOvl4 = [Sc.rect(3)*.57 Sc.rect(4)*0.85 Sc.rect(3)*.581 Sc.rect(4)*.867];
ansFldOvl5 = [Sc.rect(3)*.71 Sc.rect(4)*0.85 Sc.rect(3)*.721 Sc.rect(4)*.867];
ansFldOvl6 = [Sc.rect(3)*.85 Sc.rect(4)*0.85 Sc.rect(3)*.861 Sc.rect(4)*.867];

Screen('TextSize',Sc.window,24);

% Home Testing Parameters
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
Screen('FillOval', Sc.window, [0 0 0],ansFldOvl6);
Screen('FrameOval',Sc.window,[255 255 255],ansFldOvl6,2,2);

Screen('Flip',Sc.window);
WaitSecs(10);

Screen('CloseAll');