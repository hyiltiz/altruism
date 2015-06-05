function oneTrial(wptr, trialType, ziti_size, xcenter, ycenter, wrect, options, msg1)

which_font = trialType(1, 5);
trialType = trialType(1, 2);

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;

put_option(wptr, which_font, ziti_size,  xcenter, left_center, right_center, up_center, down_center, options, msg1, trialType); % NaN means default
jitter_isi(wptr, wrect,getTime('CrossBetweenEvents'));

trialTypeCode = 2 + 10*trialType;
recordEvents(NaN, trialTypeCode, NaN, NaN);
end
