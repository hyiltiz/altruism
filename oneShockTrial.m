function oneShockTrial(wptr, intensity, ziti_size, xcenter, ycenter, wrect)

left_center = xcenter - 6*ziti_size;
right_center = xcenter + 6*ziti_size;
up_center = ycenter - 2*ziti_size;

put_shock(wptr, intensity); % intensity : 1 4 6

pain_rating(wptr,right_center, left_center, ycenter, up_center);

jitter_isi(wptr, wrect, getTime('CrossBetweenShockTrials'));

end
