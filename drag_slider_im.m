function [cj,resp_t,interval,hasconfirmed] = drag_slider_im(Sc,settings,resp1,speedManip,speThreshold,whichAdvisor,stmRect1,stmRect2,varargin)
if nargin < 3
    cj1 = [];
    int1 = 0;
    resp1 = [];
    speedManip = 0;
    speThreshold = 0;
    whichAdvisor = 0;
    stmRect1 = 0;
    stmRect2 = 0;
else
    cj1 = varargin{1};
    int1 = sign(cj1);
end

%% Show mouse pointer
ShowCursor('Arrow');
%% initialize variables
resp = 0; 
buttons=[]; 
haschanged=false; 
hasconfirmed=false;
int=0;
flag = 0;
%% display cursor
if isempty(cj1)
    display_response_im(Sc,settings,[haschanged,resp+int]);
else
    display_response_im(Sc,settings,[haschanged,resp+int],cj1);
end

%% collect response - just the left buttons[1]
while ~any(buttons) % wait for click
    [~,~,buttons] = GetMouse;
    if speedManip == 1
        currentTime = GetSecs;
        if (currentTime - resp1) > speThreshold*0.5
            Start='start';
            End='end';
            startbounds = Screen('TextBounds', Sc.window, Start);
            viscursorwidth=1;
            viscursorheight=20;
            prbarrect=CenterRectOnPoint( ...
                [0 0 (sum(settings.ntrialsall)* viscursorwidth) viscursorheight], ...
                Sc.center(1),Sc.rect(4).*.2);
            donerect=[prbarrect(1) prbarrect(2) ...
            (prbarrect(1)+ settings.currentTrial * viscursorwidth) prbarrect(4)];
            Screen('TextSize',Sc.window,13);
            DrawFormattedText(Sc.window, '+','center','center',[1 0 0]);
            Screen('TextColor',Sc.window,[0 0 0]);
            Screen('FrameRect',Sc.window,[.9 .9 .9],prbarrect);
            Screen('FillRect', Sc.window, [.9 .9 .9],donerect);
            DrawFormattedText(Sc.window,Start, prbarrect(1)-startbounds(3)-10,prbarrect(2)-viscursorheight,[0 0 0]);
            DrawFormattedText(Sc.window,End, prbarrect(3)+10,prbarrect(2)-viscursorheight,[0 0 0]);
            draw_scale_(Sc,settings);
            draw_landmarks(Sc,settings);
            add_responseinstr(Sc,settings);
            if whichAdvisor == 1
                Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                 if settings.algorithm1Answer == 1
                    advisorPositions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [1 0 0], responseRect);
                 elseif settings.algorithm1Answer == 2
                    advisorPositions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [1 0 0], responseRect);
                 end
                 if settings.condition == 1
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                 elseif settings.condition == 2
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                 end
            elseif whichAdvisor == 2
                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                if settings.algorithm2Answer == 1
                    Screen('FillRect', Sc.window, [1 0 0], [settings.bar.barrect(1), settings.bar.gaprect(2), settings.bar.gaprect(1), settings.bar.barrect(4)]);
                 elseif settings.algorithm2Answer == 2
                    Screen('FillRect', Sc.window, [1 0 0], [settings.bar.gaprect(3), settings.bar.gaprect(2), settings.bar.barrect(3), settings.bar.barrect(4)]);
                end
                if settings.condition == 1
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                elseif settings.condition == 2
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                end
            end
            switch int1
            case -1 % 1
                positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            case 1
                positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            end
            cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
            Screen('FillRect', Sc.window, [0 0 255], cj1rect);
            Screen('Flip', Sc.window);
        end
        if (currentTime - resp1) > speThreshold
            Screen('TextSize',Sc.window,18);
            DrawFormattedText(Sc.window, 'You ran out of time! Next trial starting...', 'center', 'center', [0 0 0]);
            Screen('Flip', Sc.window);
            pause(2);
            resp_t = [];
            flag = 1;
            hasconfirmed = true;
            break;
        end
    end
end
while ~hasconfirmed
    while any(buttons) || ~haschanged   % wait for release and change of cj and confirmation
        [resp_x, ~, buttons] = GetMouse();
        if resp_x>=settings.bar.barrect(1) && resp_x<Sc.center(1) % if mouse's on the left rect
            resp = find(resp_x < (settings.bar.xshift+settings.bar.cursorwidth.*.5),1) - settings.bar.maxScale-1;
            haschanged = true;
            int = -1;
            if resp==0, resp=int;end
        elseif resp_x>=Sc.center(1) && resp_x<=settings.bar.barrect(3) % if mouse's on the right rect
            resp = find(resp_x < (settings.bar.xshift+settings.bar.cursorwidth.*.5),1) - settings.bar.maxScale;
            haschanged = true;
            int = 1;
            if isempty(resp), resp=settings.bar.maxScale;end
        end
        %--- display response
        if isempty(cj1)
            display_response_im(Sc,settings,[haschanged,resp]);
        else
            display_response_im(Sc,settings,[haschanged,resp],cj1);
        end
    end
    
    if speedManip == 1
        currentTime = GetSecs;
        if (currentTime - resp1) > speThreshold*0.5
            Start='start';
            End='end';
            startbounds = Screen('TextBounds', Sc.window, Start);
            viscursorwidth=1;
            viscursorheight=20;
            prbarrect=CenterRectOnPoint( ...
                [0 0 (sum(settings.ntrialsall)* viscursorwidth) viscursorheight], ...
                Sc.center(1),Sc.rect(4).*.2);
            donerect=[prbarrect(1) prbarrect(2) ...
            (prbarrect(1)+ settings.currentTrial * viscursorwidth) prbarrect(4)];
            Screen('TextSize',Sc.window,13);
            DrawFormattedText(Sc.window, '+','center','center',[1 0 0]);
            Screen('TextColor',Sc.window,[0 0 0]);
            Screen('FrameRect',Sc.window,[.9 .9 .9],prbarrect);
            Screen('FillRect', Sc.window, [.9 .9 .9],donerect);
            DrawFormattedText(Sc.window,Start, prbarrect(1)-startbounds(3)-10,prbarrect(2)-viscursorheight,[0 0 0]);
            DrawFormattedText(Sc.window,End, prbarrect(3)+10,prbarrect(2)-viscursorheight,[0 0 0]);
            draw_scale_(Sc,settings);
            draw_landmarks(Sc,settings);
            add_responseinstr(Sc,settings);
            if whichAdvisor == 1
                Screen('FrameRect', Sc.window , [255 255 255], stmRect1, 4);
                 if settings.algorithm1Answer == 1
                    advisorPositions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [1 0 0], responseRect);
                 elseif settings.algorithm1Answer == 2
                    advisorPositions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
                    responseRect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],advisorPositions(abs(settings.algorithm1Confidence)), Sc.rect(4).*settings.bar.positiony);
                    Screen('FillRect', Sc.window, [1 0 0], responseRect);
                 end
                 if settings.condition == 1
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                 elseif settings.condition == 2
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect1(4)-(((stmRect1(4)-stmRect1(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect1);
                 end
            elseif whichAdvisor == 2
                Screen('FrameRect', Sc.window , [255 255 255], stmRect2, 4);
                if settings.algorithm2Answer == 1
                    Screen('FillRect', Sc.window, [1 0 0], [settings.bar.barrect(1), settings.bar.gaprect(2), settings.bar.gaprect(1), settings.bar.barrect(4)]);
                 elseif settings.algorithm2Answer == 2
                    Screen('FillRect', Sc.window, [1 0 0], [settings.bar.gaprect(3), settings.bar.gaprect(2), settings.bar.barrect(3), settings.bar.barrect(4)]);
                end
                if settings.condition == 1
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '2','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                elseif settings.condition == 2
                    Screen('TextSize',Sc.window, 48);
                    Screen('TextStyle', Sc.window, 1);
                    [~, ~, ~] = DrawFormattedText(Sc.window, '1','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.2))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                    Screen('TextSize', Sc.window, 13);
                    Screen('TextStyle', Sc.window, 0);
                    [~, ~, ~] = DrawFormattedText(Sc.window, 'COMPUTER','center',(stmRect2(4)-(((stmRect2(4)-stmRect2(2))*.6))),  [0 0 0], 70, 0, 0, 1.5, 0, stmRect2);
                end
            end
            switch int1
            case -1 % 1
                positions = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            case 1
                positions = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            end
            cj1rect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight],positions(abs(cj1)), Sc.rect(4).*settings.bar.positiony);
            Screen('FillRect', Sc.window, [0 0 255], cj1rect);
            temp = [haschanged,resp+int];
            [haschanged,cj] = deal(temp(1),temp(2));
            switch sign(cj) % define response cursor position
            case -1
                positions2 = linspace(settings.bar.gaprect(1)-settings.bar.cursorwidth.*.5, settings.bar.barrect(1)+settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            case 1
                positions2 = linspace(settings.bar.gaprect(3)+settings.bar.cursorwidth.*.5, settings.bar.barrect(3)-settings.bar.cursorwidth.*.5,settings.bar.maxScale);
            end
            cursorrect = CenterRectOnPoint([0,0,settings.bar.cursorwidth,settings.bar.cursorheight], positions2(abs(cj)-1), Sc.rect(4) .* settings.bar.positiony);
            Screen('FillRect', Sc.window, [.8 .8 .8]',cursorrect');
            Screen('Flip', Sc.window);
        end
        if (currentTime - resp1) > speThreshold
            Screen('TextSize',Sc.window,18);
            DrawFormattedText(Sc.window, 'You ran out of time! Next trial starting...', 'center', 'center', [0 0 0]);
            Screen('Flip', Sc.window);
            pause(2);
            resp_t = [];
            flag = 1;
            break;
        end
    end
    % check for confirmation
    if ~hasconfirmed
        switch 'keyboard'
            case 'mouse'
                [~,~,buttons] = GetMouse;
                if buttons(3)==1, hasconfirmed = true;end
                resp_t = GetSecs;
            case 'keyboard'
                [~,~,buttons] = GetMouse;
                [~, resp_t, keycode] = KbCheck; % get timing and key
                % translate key code into key name
                name = KbName(keycode);
                % only take first response if multiple responses
                if ~iscell(name), name = {name}; end
                name = name{1};
                if strcmp('space',name),hasconfirmed = true;end
                if strcmp('ESCAPE',name),sca;end
        end
    end
end
%% compute confidence judgment
if flag == 1
    cj = [];
else
    cj = resp;
end
% change interval to [1 2] range
interval = 2-(int<0);
%% hide back cursor
HideCursor;
return