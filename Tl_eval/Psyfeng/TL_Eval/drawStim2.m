function drawStim2(wptr,r1,r2,color,cx,cy)
%drawStim2.m
%2011-4-4
%fengchengzhi@suda.edu.cn
Screen('FrameOval',wptr,color,CenterRectOnPoint([0 0 r1*2 r1*2],cx,cy),r1-r2);
end