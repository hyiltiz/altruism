function items = item_liangbiao()
%% item
% 130315
% created by whx, with the help of yuermai

% leixing = 1 altruism
% leixing = 2 zili
% leixing = 3 ziti


%% %%
al_item = cell(9, 2);

al_item(1,1) = {'�����ӵܾ�����Ǯ'};    al_item(1,2) = {'�����ӵܾ�һ����'};
al_item(2,1) = {'�����ӵ����ѧϰ��Ʒ'};    al_item(2,2) = {'�����ӵ�������·�'};
al_item(3,1) = {'����ӵܽ���ɳ�����'};    al_item(3,2) = {'����ӵ��Ƽ��������'};
al_item(4,1) = {'Ϊ���ӵ��ṩ�ɳ��滮'};    al_item(4,2) = {'�����ӵܽ�����������'};
al_item(5,1) = {'����ӵܷ���ѧϰ����'};    al_item(5,2) = {'����ӵ�����̸��'};
al_item(6,1) = {'������ӵ�ȥ����'};    al_item(6,2) = {'�����ӵ�ȥ��԰����'};
al_item(7,1) = {'�����ӵ�����Ӫ־Ը��'};    al_item(7,2) = {'�����ӵܲι۲����'};
al_item(8,1) = {'�����ӵܲι�ͼ���'};    al_item(8,2) = {'�����ӵܲιۿ�ѧ��'};
al_item(9,1) = {'�����ӵܲι���ʤ�ż�'};    al_item(9,2) = {'�����ӵ��������о���'};
al_item = al_item(:);
items.al_item = al_item;

%% %% self-interest
zili_item = cell(9, 2);

zili_item(1,1) = {'ȥ�μ�ʵ����ȡ����'};    zili_item(1,2) = {'Ϊ�Լ�ȥ��һ����'};
zili_item(2,1) = {'Ϊ�Լ�ȥ���ѧϰ��Ʒ'};       zili_item(2,2) = {'Ϊ�Լ�������·�'};
zili_item(3,1) = {'��ע�Լ��ɳ����̵ķ���'};    zili_item(3,2) = {'ȥѧУͼ��ݶ��������'};
zili_item(4,1) = {'��ǰ����ѯ�ɳ��滮����'};    zili_item(4,2) = {'��������ȥ�˽���������'};
zili_item(5,1) = {'Ϊ�Լ��ܽ���ѧϰ����'};    zili_item(5,2) = {'������һ������̸��'};
zili_item(6,1) = {'������һ��ȥ����'};    zili_item(6,2) = {'������һ��ȥ��԰����'};
zili_item(7,1) = {'ȥ�μ�ѧУ������Ӫ'};    zili_item(7,2) = {'�Լ�ȥ�ι۲����'};
zili_item(8,1) = {'�Լ�ȥ�ι�ͼ���'};    zili_item(8,2) = {'�Լ�ȥ�ιۿ�ѧ��'};
zili_item(9,1) = {'�Լ�ȥ�ι���ʤ�ż�'};    zili_item(9,2) = {'�Լ�ȥ�ι۳��о���'};
zili_item = zili_item(:);
items.zili_item = zili_item;
all_item = [al_item; zili_item];
items.all = all_item;

if 0
    %% %% ����
    ziti_item = [al_item; zili_item];



    %% %% judge

    %xuhao = rand(24, 1); %��������� ��¼���
    %item_num = Shuffle(1:24); %������shuffle
    item_num = init_item_num(1);

    if leixing == 1 %�ж���altruism or control 1 / 2 or altruism vs. self-interest
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
