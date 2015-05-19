

%% test Bits#
screens=Screen('Screens');
screenNumber=max(screens);
[wptr, wrect] = Screen('OpenWindow', screenNumber,0,  [300,50, 1300, 600]);
[win, winRect] = BitsPlusPlus('OpenWindowBits++', screenNumber);
%WaitSecs(2);
WaitSecs(2);

sca;