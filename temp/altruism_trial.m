% altruism_trial
% 150315

function altruism_trial(wptr, ziti_size, xcenter, ycenter, wrect)

KbName('UnifyKeyNames');
global leftKey rightKey;
leftKey = KbName('leftarrow');
rightKey = KbName('rightarrow');

left_center = xcenter - 12*ziti_size;
right_center = xcenter + 1*ziti_size;
up_center = ycenter - 2*ziti_size;
down_center = ycenter + 1*ziti_size;
option_al(wptr, ziti_size,  xcenter, left_center, right_center, up_center, down_center);
jitter_isi(wptr, wrect);

return;

