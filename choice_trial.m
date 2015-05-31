function  choice_trial(wptr, ziti_size, xcenter, ycenter, wrect, options)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_al_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, options)

% NOTE: jitter time [1,3] could be wrong!
jitter_isi(wptr, wrect, myRand(1,3));

end
