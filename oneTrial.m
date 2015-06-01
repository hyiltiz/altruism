function oneTrial(wptr, trial_type, ziti_size, xcenter, ycenter, wrect, options, msg1)


switch trial_type
    case 1 % altruism trial
        altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1);
        
    case 2 % self-interest
        zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1);
        
    case 3 % xieti
        ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1);
        
    otherwise
        error('Unknown trial type!');
end
end

function  altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_al(wptr, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1);
jitter = 1 + (3 - 1)*rand();
jitter_isi(wptr, wrect,jitter);
end

function  zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, options, msg1);

jitter = 1 + (3 - 1)*rand();
jitter_isi(wptr, wrect, jitter);
end


function ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1)

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
option_ziti(wptr, which_font, ziti_size, xcenter, left_center, right_center, up_center, down_center, options, msg1);

jitter = 1 + (3 - 1)*rand();
jitter_isi(wptr, wrect, jitter);
end


