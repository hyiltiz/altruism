
function oneAl_Zili_Trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

if rand < 0.5
    altruismRight = 0; % altruism option on the left
else
    altruismRight = 1; % altruism option on the right
end
option_al_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, options, msg1, altruismRight);
recordEvents(NaN, 63 + altruismRight, NaN, NaN); % NOTE: rand record? [altruism option at right 64, left 63]

jitter_isi(wptr, wrect, getTime('CrossBetweenEvents'));
end
