
function oneAl_Zili_Trial(wptr, ziti_size, xcenter, ycenter, wrect, options, msg1)

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

option_al_zili(wptr, ziti_size, xcenter, left_center, right_center, up_center, down_center, options, msg1);

jitter_isi(wptr, wrect, getTime('CrossBetweenEvents'));
end
