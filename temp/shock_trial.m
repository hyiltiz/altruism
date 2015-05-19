% shock trial
% 150315

function shock_trial(wptr,ziti_size, xcenter, ycenter, shock_type)

try
    left_center = xcenter - 6*ziti_size;
    right_center = xcenter + 6*ziti_size;
    
    get_shock(wptr, shock_type); % intensity : 1 4 6
    jitter_isi(wptr, wrect);
    pain_rating(wptr,right_center, left_center, ycenter);
    jitter_isi(wptr, wrect);
catch
    psychrethrow(psychlasterror);
end
return;
