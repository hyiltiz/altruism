function items = item_liangbiao()
%% item
% 130315
% created by whx, with the help of yuermai

% leixing = 1 altruism
% leixing = 2 zili
% leixing = 3 ziti


%% %%
al_item = cell(9, 2);

al_item(1,1) = {'给打工子弟捐赠点钱'};    al_item(1,2) = {'给打工子弟捐一本书'};
al_item(2,1) = {'给打工子弟买点学习用品'};    al_item(2,2) = {'给打工子弟买件新衣服'};
al_item(3,1) = {'帮打工子弟解决成长烦恼'};    al_item(3,2) = {'帮打工子弟推荐课外读物'};
al_item(4,1) = {'为打工子弟提供成长规划'};    al_item(4,2) = {'给打工子弟介绍新鲜事物'};
al_item(5,1) = {'与打工子弟分享学习经验'};    al_item(5,2) = {'与打工子弟聊天谈心'};
al_item(6,1) = {'带领打工子弟去春游'};    al_item(6,2) = {'带打工子弟去公园游玩'};
al_item(7,1) = {'做打工子弟夏令营志愿者'};    al_item(7,2) = {'带打工子弟参观博物馆'};
al_item(8,1) = {'带打工子弟参观图书馆'};    al_item(8,2) = {'带打工子弟参观科学馆'};
al_item(9,1) = {'带打工子弟参观名胜古迹'};    al_item(9,2) = {'带打工子弟游览城市景点'};
al_item = al_item(:);
items.al_item = al_item;

%% %% self-interest
zili_item = cell(9, 2);

zili_item(1,1) = {'去参加实验挣取报酬'};    zili_item(1,2) = {'为自己去买一本书'};
zili_item(2,1) = {'为自己去买点学习用品'};       zili_item(2,2) = {'为自己买件新衣服'};
zili_item(3,1) = {'关注自己成长过程的烦恼'};    zili_item(3,2) = {'去学校图书馆读课外读物'};
zili_item(4,1) = {'找前辈咨询成长规划建议'};    zili_item(4,2) = {'搜索资料去了解新鲜事物'};
zili_item(5,1) = {'为自己总结下学习经验'};    zili_item(5,2) = {'和朋友一起聊天谈心'};
zili_item(6,1) = {'和朋友一起去春游'};    zili_item(6,2) = {'和朋友一起去公园游玩'};
zili_item(7,1) = {'去参加学校的夏令营'};    zili_item(7,2) = {'自己去参观博物馆'};
zili_item(8,1) = {'自己去参观图书馆'};    zili_item(8,2) = {'自己去参观科学馆'};
zili_item(9,1) = {'自己去参观名胜古迹'};    zili_item(9,2) = {'自己去参观城市景点'};
zili_item = zili_item(:);
items.zili_item = zili_item;
all_item = [al_item; zili_item];
items.all = all_item;

if 0
    %% %% 字体
    ziti_item = [al_item; zili_item];



    %% %% judge

    %xuhao = rand(24, 1); %在外面随机 记录序号
    %item_num = Shuffle(1:24); %在外面shuffle
    item_num = init_item_num(1);

    if leixing == 1 %判断是altruism or control 1 / 2 or altruism vs. self-interest
        if xuhao(item_num) < 0.5
            %if rand < 0.5
            item_con = [ al_item(item_num, 1)  al_item(item_num, 2)];
        else
            item_con = [ al_item(item_num, 2)  al_item(item_num, 1)];
        end
    elseif leixing == 2
        if xuhao(item_num) < 0.5
            %if rand < 0.5
            item_con = [ zili_item(item_num, 1)  zili_item(item_num, 2)];
        else
            item_con = [ zili_item(item_num, 2)  zili_item(item_num, 1)];
        end
    elseif leixing == 3
        if xuhao(item_num) < 0.5
            %if rand < 0.5
            item_con = [ ziti_item(item_num, 1)  ziti_item(item_num, 2)];
        else
            item_con = [ ziti_item(item_num, 2)  ziti_item(item_num, 1)];
        end
    end
end
end
