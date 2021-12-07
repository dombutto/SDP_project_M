function splitter(save_file,game_obj)

%This function takes an ascii file then draws a scene based on an input 
%'game_obj' object. This function should only be used to draw a scene when
%the inventory screne is not wanted. 



save_file = load(save_file);
[rows,~] = size(save_file);
    %finds the how many rows are in the file
rows = rows/9;
    %diveides that number by 9 as that is the number of layers used in the
    %game. 
for i = 1:rows
    layer1(i,:) = save_file(i,:);
    layer2(i,:) = save_file(i+rows,:);
    layer3(i,:) = save_file(i+2*rows,:);
    layer4(i,:) = save_file(i+3*rows,:);
    layer5(i,:) = save_file(i+4*rows,:);
    layer6(i,:) = save_file(i+5*rows,:);
    layer7(i,:) = save_file(i+6*rows,:);
    layer8(i,:) = save_file(i+7*rows,:);
    layer9(i,:) = save_file(i+8*rows,:);
end


[~,fig] = drawScene1(game_obj,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9);
%EXPLAIN EDITIING SIMPLE GAME ENGINE
set(fig, 'MenuBar', 'none');
set(fig, 'ToolBar', 'none');
movegui(fig, 'west')

end
