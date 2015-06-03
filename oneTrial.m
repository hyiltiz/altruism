function oneTrial(wptr, trial_type, ziti_size, xcenter, ycenter, wrect, options, msg1)


switch trial_type
    case 1 % altruism trial
        trialType = 1;
        altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType);

    case 2 % self-interest
        trialType = 2;
        zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType);

    case 3 % xieti
        trialType = 3;
        ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType);

    otherwise
        error('Unknown trial type!');
end
end

function  altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

% option_al(wptr, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1);
put_option(wptr, NaN, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType); % NaN means default
recordEvents(NaN, 12, NaN, NaN);

jitter_isi(wptr, wrect,myRand(1,3));
end

function  zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

% option_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, options, msg1);
put_option(wptr, NaN, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType); % NaN means default
recordEvents(NaN, 22, NaN, NaN);

jitter_isi(wptr, wrect,myRand(1,3));
end


function ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

%which_font = round(rand);
if rand > 0.5
    which_font = 1;
else
    which_font = 0;
end
put_option(wptr, which_font, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType);
recordEvents(NaN, 32, NaN, NaN);

jitter_isi(wptr, wrect,myRand(1,3));
end
