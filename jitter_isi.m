
%% jitter or iti
% 150315

function jitter_isi(wptr, wrect)

%recordEvents(sub_response, pingmu, dianji, painRating)
recordEvents(NaN, 7, NaN, NaN);
jitter = 1 + (3 - 1)*rand();
fix=fixation(wptr, '+ ', 255, 0);
showFix(wptr,wrect,fix,jitter);
Screen('Flip', wptr);
recordEvents(NaN, 7, NaN, NaN);

end