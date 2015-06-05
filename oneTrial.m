function oneTrial(wptr, trialType, ziti_size, xcenter, ycenter, wrect, options, msg1)

  which_font = trialType(1, 5);
  trialType = trialType(1, 2);


switch trialType
    case 1 % altruism trial
        altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType);

    case 2 % self-interest
        zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType);

    case 3 % xieti
        ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType);

    otherwise
        error('Unknown trial type!');
end
end

function  altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType, which_font)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

put_option(wptr, which_font, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType); % NaN means default
recordEvents(NaN, 12, NaN, NaN);

jitter_isi(wptr, wrect,getTime('CrossBetweenEvents'));
end

function  zili_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType, which_font)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

put_option(wptr, which_font, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType); % NaN means default
recordEvents(NaN, 22, NaN, NaN);

jitter_isi(wptr, wrect,getTime('CrossBetweenEvents'));
end


function ziti_trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1, trialType, which_font)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

if rand < 0.5
    which_font = 0; % xieti on the left
else
    which_font = 1; % xieti on the right
end
put_option(wptr, which_font, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType, which_font);

% we do not need to record this though, since we have them in the sequence
recordEvents(NaN, 33 + which_font, NaN, NaN); % NOTE: rand record? [Italic: left 33, right 34]

jitter_isi(wptr, wrect,getTime('CrossBetweenEvents'));
end
