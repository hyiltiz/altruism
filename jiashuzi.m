
[wptr wrect]=Screen('OpenWindow',0,0);

%function 
%pingjia = {'1234567', '不痛', '最痛'};
%mlw = {};
mlw.rankitems = '0 1 2 3 4 5 6 7 8 9 10';
mlw.rankleftlabel = '不痛';
mlw.rankrightlabel = '最痛';

r1=[0 0 wrect(3)/2 30];
r1=CenterRect(r1,wrect);
r1=OffsetRect(r1,0,50);
rs=ArrangeRects(length(mlw.rankitems),[0 0 5 30],r1);
Screen('FillRect',wptr,[169 169 169],UnionRect(rs(1,:),rs(end,:)));
Screen('FrameRect',wptr,0,rs');
%drawStim2(wptr,10,0,[0,0,0],x1,y);
%DrawFormattedText(wptr,mlw.ranktitle,'center','center',255);
tb=Screen('TextBounds',wptr,mlw.rankleftlabel);
lr=rs(1,:);
rr=rs(end,:);
DrawFormattedText(wptr,mlw.rankrightlabel,rr(3)+5,rr(2),[255 0 0]);
DrawFormattedText(wptr,mlw.rankleftlabel,lr(1)-tb(3)-5,lr(2),[0 255 0]);
for i=1:size(rs,1)
    drawText(wptr,mlw.rankitems(i),[0 0 255],rs(i,:));
end
Screen('Flip',wptr,0,1);