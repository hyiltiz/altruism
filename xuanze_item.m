
% 选择利他或是利己
% 150323

function [item_con, item_num] = xuanze_item()
xuanze_item = cell(48, 2);

xuanze_item(1,1) = {'我给打工子弟捐赠点钱'};    xuanze_item(25,1) = {'我给打工子弟捐一本书'};
xuanze_item(2,1) = {'我给打工子弟买点学习用品'};    xuanze_item(26,1) = {'我给打工子弟买件新衣服'};
xuanze_item(3,1) = {'我给打工子弟搬运牛奶'};    xuanze_item(27,1) = {'我帮打工子弟检查数学作业'};
xuanze_item(4,1) = {'我帮打工子弟检查语文作业'};    xuanze_item(28,1) = {'我帮打工子弟检查英语作业'};
xuanze_item(5,1) = {'我帮打工子弟做课外辅导'};    xuanze_item(29,1) = {'我帮打工子弟解决成长烦恼'};
xuanze_item(6,1) = {'我帮打工子弟推荐课外读物'};    xuanze_item(30,1) = {'我帮打工子弟辅导英语'};
xuanze_item(7,1) = {'我帮打工子弟辅导数学'};    xuanze_item(31,1) = {'我帮打工子弟辅导作文'};
xuanze_item(8,1) = {'我为打工子弟提供心理辅导'};    xuanze_item(32,1) = {'我为打工子弟提供成长规划'};
xuanze_item(9,1) = {'我为打工子弟组织集体活动'};    xuanze_item(33,1) = {'我教打工子弟学打篮球'};
xuanze_item(10,1) = {'我教打工子弟学踢足球'};    xuanze_item(34,1) = {'我教打工子弟学打网球'};

xuanze_item(11,1) = {'我陪打工子弟跑步锻炼'};    xuanze_item(35,1) = {'我教打工子弟打乒乓球'};
xuanze_item(12,1) = {'我教打工子弟打羽毛球'};    xuanze_item(36,1) = {'我倾听打工子弟的心声'};
xuanze_item(13,1) = {'我给打工子弟介绍新鲜事物'};    xuanze_item(37,1) = {'我与打工子弟分享学习经验'};
xuanze_item(14,1) = {'我与打工子弟聊天谈心'};    xuanze_item(38,1) = {'我给打工子弟上体育课'};
xuanze_item(15,1) = {'我给打工子弟学校打扫卫生'};    xuanze_item(39,1) = {'我带领打工子弟春游'};
xuanze_item(16,1) = {'我带领打工子弟去公园游玩'};    xuanze_item(40,1) = {'我做打工子弟夏令营志愿者'};
xuanze_item(17,1) = {'我带打工子弟参观博物馆'};    xuanze_item(41,1) = {'我带打工子弟参观大学校园'};
xuanze_item(18,1) = {'我带打工子弟参观科学馆'};    xuanze_item(42,1) = {'我带打工子弟参观名胜古迹'};
xuanze_item(19,1) = {'我组织打工子弟参加运动会'};    xuanze_item(43,1) = {'我组织打工子弟歌唱比赛'};

xuanze_item(20,1) = {'我组织打工子弟舞蹈比赛'};    xuanze_item(44,1) = {'我组织打工子弟排练舞蹈'};
xuanze_item(21,1) = {'我组织打工子弟羽毛球比赛'};    xuanze_item(45,1) = {'我组织打工子弟乒乓球比赛'};
xuanze_item(22,1) = {'我组织打工子弟篮球比赛'};    xuanze_item(46,1) = {'我带打工子弟游览城市景点'};
xuanze_item(23,1) = {'我帮打工子弟学校做规划'};    xuanze_item(47,1) = {'我为打工子弟准备顿早餐'};
xuanze_item(24,1) = {'我为打工子弟准备顿午餐'};    xuanze_item(48,1) = {'我与打工子弟一起包顿饺子'};

xuanze_item(1,2) = {'我去参加实验挣取报酬'};    xuanze_item(25,2) = {'我去学校书店买一本书'};
xuanze_item(2,2) = {'我去买点学习用品'};       xuanze_item(26,2) = {'我去买件新衣服'};
xuanze_item(3,2) = {'我自己去搬运牛奶'};    xuanze_item(27,2) = {'我检查自己的数学作业'};
xuanze_item(4,2) = {'我检查自己的语文作业'};    xuanze_item(28,2) = {'我检查自己的英语作业'};
xuanze_item(5,2) = {'我去报班参加课外辅导'};    xuanze_item(29,2) = {'我关注自己成长过程的烦恼'};
xuanze_item(6,2) = {'我去学校图书馆读课外读物'};    xuanze_item(30,2) = {'我去报班参加英语辅导'};
xuanze_item(7,2) = {'我去报班参加数学辅导'};    xuanze_item(31,2) = {'我去报班参加作文辅导'};
xuanze_item(8,2) = {'我去咨询中心寻求心理辅导'};    xuanze_item(32,2) = {'我找前辈咨询成长规划建议'};
xuanze_item(9,2) = {'我去教室里参加班集体活动'};    xuanze_item(33,2) = {'我自己去篮球场打篮球'};
xuanze_item(10,2) = {'我自己去足球场踢足球'};    xuanze_item(34,2) = {'我自己去网球场打网球'};

xuanze_item(11,2) = {'我去学校操场跑步锻炼'};    xuanze_item(35,2) = {'我去体育馆里打乒乓球'};
xuanze_item(12,2) = {'我去体育馆里打羽毛球'};    xuanze_item(36,2) = {'我找人诉说自己的生活经历'};
xuanze_item(13,2) = {'我搜索资料去了解新鲜事物'};    xuanze_item(37,2) = {'我归纳总结下学习经验'};
xuanze_item(14,2) = {'我和朋友一起聊天谈心'};    xuanze_item(38,2) = {'我自己去操场上体育课'};
xuanze_item(15,2) = {'我打扫家里房间的卫生'};    xuanze_item(39,2) = {'我和朋友一起去春游'};
xuanze_item(16,2) = {'我和朋友一起去公园游玩'};    xuanze_item(40,2) = {'我去参加学校的夏令营'};
xuanze_item(17,2) = {'我自己去参观博物馆'};    xuanze_item(41,2) = {'我自己去参观大学校园'};
xuanze_item(18,2) = {'我自己去参观科学馆'};    xuanze_item(42,2) = {'我自己去参观名胜古迹'};
xuanze_item(19,2) = {'我自己报名参加学校运动会'};    xuanze_item(43,2) = {'我自己报名参加歌唱比赛'};

xuanze_item(20,2) = {'我自己报名参加舞蹈比赛'};    xuanze_item(44,2) = {'我自己报名参加排练舞蹈'};
xuanze_item(21,2) = {'我自己报名参加羽毛球比赛'};    xuanze_item(45,2) = {'我自己报名参加乒乓球比赛'};
xuanze_item(22,2) = {'我自己报名参加篮球比赛'};    xuanze_item(46,2) = {'我自己去游览城市景点'};
xuanze_item(23,2) = {'我自己准备上课讲的报告'};    xuanze_item(47,2) = {'我给自己准备做一顿早餐'};
xuanze_item(24,2) = {'我给自己准备做一顿午餐'};    xuanze_item(48,2) = {'我给自己包一顿饺子'};

%xuhao = rand(48, 1);
i_num = Shuffle(1:48);
item_num = i_num(1);
item_con = [xuanze_item(item_num, 1), xuanze_item(item_num, 1)];

return;
