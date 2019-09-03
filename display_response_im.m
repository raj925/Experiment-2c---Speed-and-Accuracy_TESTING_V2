function [] = display_response_im(Sc,settings,temp,varargin)
if nargin < 4
    show_cj1    = false;
else
    show_cj1    = true;
    cj1         = varargin{1};
    int1        = sign(cj1);
end
[haschanged,cj] = deal(temp(1),temp(2));
%% display response
% draw static elements
add_fixation
draw_static(Sc,settings)
% display previous confidence
if show_cj1
    switch int1
        case -1 % 1
            positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
        case 1
            positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
    end
    cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
    Screen('FillRect', Sc.window, [0 0 255], cj1rect );
    
    if settings.whichAdvisor == 1
        switch settings.algorithm1Answer
            case 1
                advisorPositions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            case 2
                advisorPositions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
        end
    elseif settings.whichAdvisor == 2
        switch settings.algorithm2Answer
            case 1
                advisorPositions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            case 2
                advisorPositions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
        end
    end
end

switch sign(cj) % define response cursor position
    case -1
        positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
    case 1
        positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
end

if haschanged % draw cursor only after first click
    cursorrect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight], positions(abs(cj)), Sc.rect(4) .* settings.bar.positiony);
    Screen('FillRect', Sc.window, [.8 .8 .8]',cursorrect');
end

Screen('TextFont', Sc.window, 'Myriad Pro');

% add the advisor recommendation if we have one
if settings.currentBlock >= 4
    if show_cj1
        stmRect1 = settings.stmRect1;
        stmRect2 = settings.stmRect2;
        
        if settings.trialType == 1 % Choice Trial
            if(~isnan(settings.whichAdvisor))
                switch settings.whichAdvisor
                    case 1  % Comp1 Advisor
                        Screen('FrameRect', Sc.window , [255 255 255], settings.stmRect1, 4);
                        [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                        Screen('TextSize',Sc.window, 48);
                        Screen('TextStyle', Sc.window, 1);
                        if settings.condition == 1
                            [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                        elseif settings.condition == 2
                            [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                        end
                        
                        Screen('TextSize', Sc.window, 13);
                        Screen('TextStyle', Sc.window, 0);
                        if settings.algorithm1Answer == 1
                            responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                            Screen('FillRect', Sc.window, [1 0 0], responseRect);
                        elseif settings.algorithm1Answer == 2
                            responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                            Screen('FillRect', Sc.window, [1 0 0], responseRect);
                        end
                        
                        % display previous confidence
                        if show_cj1
                            switch int1
                                case -1 % 1
                                    positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                                case 1
                                    positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                            end
                            cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
                            Screen('FillRect', Sc.window, [0 0 255], cj1rect );
                        end
                        % define response cursor position
                        switch sign(cj)
                            case -1
                                positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                            case 1
                                positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                        end
                        % draw cursor only after first click
                        if haschanged
                            cursorrect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight], positions(abs(cj)), Sc.rect(4) .* settings.bar.positiony);
                            Screen('FillRect', Sc.window, [.8 .8 .8]',cursorrect');
                        end
                        Screen('TextFont', Sc.window, 'Myriad Pro');
                    case 2  % Comp2 Advisor
                        Screen('FrameRect', Sc.window , [255 255 255], settings.stmRect2, 4);
                        Screen('TextSize', Sc.window, 13);
                        Screen('TextStyle', Sc.window, 0);
                        Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                        [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                        Screen('TextSize',Sc.window, 48);
                        Screen('TextStyle', Sc.window, 1);
                        if settings.condition == 1
                            [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                        elseif settings.condition == 2
                            [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                        end
                        
                        Screen('TextSize', Sc.window, 13);
                        Screen('TextStyle', Sc.window, 0);
                        
                        if settings.algorithm2Answer == 1
                            Screen('FillRect', Sc.window, [1 0 0], [settings.bar.barrect(1), settings.bar.gaprect(2), settings.bar.gaprect(1), settings.bar.barrect(4)]); % left side
                        elseif settings.algorithm2Answer == 2
                            Screen('FillRect', Sc.window, [1 0 0], [settings.bar.gaprect(3), settings.bar.gaprect(2), settings.bar.barrect(3), settings.bar.barrect(4)]); % right side
                        end
                        % display previous confidence
                        if show_cj1
                            switch int1
                                case -1 % 1
                                    positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                                case 1
                                    positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                            end
                            
                            cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
                            Screen('FillRect', Sc.window, [0 0 255], cj1rect );
                        end
                        % define response cursor position
                        switch sign(cj)
                            case -1
                                positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                            case 1
                                positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                        end
                        % draw cursor only after first click
                        if haschanged
                            cursorrect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight], positions(abs(cj)), Sc.rect(4) .* settings.bar.positiony);
                            Screen('FillRect', Sc.window, [.8 .8 .8]',cursorrect');
                        end
                        Screen('TextFont', Sc.window, 'Myriad Pro');
                end
            end
        elseif settings.trialType == 2 % Forced Trial
            if settings.forcedAdvisorType == 'comp1Advisor'
                Screen('FrameRect', Sc.window , [255 255 255], settings.stmRect1, 4);
                [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                Screen('TextSize',Sc.window, 48);
                Screen('TextStyle', Sc.window, 1);
                if settings.condition == 1
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                elseif settings.condition == 2
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                end
                
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, 0);
                if settings.algorithm1Answer == 1
                    responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [1 0 0], responseRect );
                elseif settings.algorithm1Answer == 2
                    responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [1 0 0], responseRect );
                end
                % display previous confidence
                if show_cj1
                    switch int1
                        case -1 % 1
                            positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                        case 1
                            positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    end
                    cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [0 0 255], cj1rect );
                end
                % define response cursor position
                switch sign(cj)
                    case -1
                        positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    case 1
                        positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                end
                % draw cursor only after first click
                if haschanged
                    cursorrect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight], positions(abs(cj)), Sc.rect(4) .* settings.bar.positiony);
                    Screen('FillRect', Sc.window, [.8 .8 .8]',cursorrect');
                end
                Screen('TextFont', Sc.window, 'Myriad Pro');
                
            elseif settings.forcedAdvisorType == 'comp2Advisor'
                Screen('FrameRect', Sc.window , [255 255 255], settings.stmRect2, 4);
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, 0);
                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                Screen('TextSize',Sc.window, 48);
                Screen('TextStyle', Sc.window, 1);
                if settings.condition == 1
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                elseif settings.condition == 2
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                end
                
                Screen('TextSize', Sc.window, 13);
                Screen('TextStyle', Sc.window, 0);
                if settings.algorithm2Answer == 1
                    Screen('FillRect', Sc.window, [1 0 0], [settings.bar.barrect(1), settings.bar.gaprect(2), settings.bar.gaprect(1), settings.bar.barrect(4)]); % left side
                elseif settings.algorithm2Answer == 2
                    Screen('FillRect', Sc.window, [1 0 0], [settings.bar.gaprect(3), settings.bar.gaprect(2), settings.bar.barrect(3), settings.bar.barrect(4)]); % right side
                end
                
                % display previous confidence
                if show_cj1
                    switch int1
                        case -1 % 1
                            positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                        case 1
                            positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    end
                    cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [0 0 255], cj1rect );
                end
                
                switch sign(cj) % define response cursor position
                    case -1
                        positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    case 1
                        positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                end
                
                if haschanged % draw cursor only after first click
                    cursorrect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight], positions(abs(cj)), Sc.rect(4) .* settings.bar.positiony);
                    Screen('FillRect', Sc.window, [.8 .8 .8]',cursorrect');
                end
                Screen('TextFont', Sc.window, 'Myriad Pro');
                
            end
        end
    end
end
% Flip on screen
Screen('Flip', Sc.window);
return