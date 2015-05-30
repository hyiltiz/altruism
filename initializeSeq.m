
function initializeSeq()

seq = genSequence;
block_num = 27; % seq(:,1)

% altruism : zhidaoyu + kongping + 4 altruism + kongping + 4 shocks +
% kongping
for i = 1:size(seq(:,1))
   
   if seq(i, 1) == 1 % block
       if seq(i, 2) == 1 % altruism
           zhidaoyu();
           zhu_shi_dian();
           %four_altruism_trials()
           zhu_shi_dian();
           %four_shocks();
           if seq(i, 5) == 1
               yi_fen_shock()
           elseif seq(i, 5) == 4
               si_fen_shock()
           elseif seq(i, 5) == 6
               liu_fen_shock()
           end
           zhu_shi_dian();
       end
       if seq(i, 2) == 2 % zili
           zhidaoyu();
           zhu_shi_dian();
           four_zili_trials()
           zhu_shi_dian();
           four_shocks();
           zhu_shi_dian();
       end
       if seq(i, 2) == 3 % ziti
           zhidaoyu();
           zhu_shi_dian();
           four_ziti_trials()
           zhu_shi_dian();
           four_shocks();
           zhu_shi_dian();
       end
   end
       
end
end