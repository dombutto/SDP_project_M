function splitter(save_file,game_obj)
%game_obj = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
%save_file = load("savefile.txt");
save_file = load(save_file);
[rows,columns] = size(save_file);
rows = rows/2;
for i = 1:rows
    layer1(i,:) = save_file(i,:);
    layer2(i,:) = save_file(i+rows,:);
end
drawScene(game_obj,layer1,layer2)

end