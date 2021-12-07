function  inv_array = inventory(inv_array,save_file,game_obj,inv_obj)

%{
This function is the main way of displaying the game object, the only way
of displaying the inventory object, and the way values are stored for the
different armor pieces that can be found throughout the game. 
%}












save_file = load(save_file);
[rows,~] = size(save_file);
rows = rows/9;
for i = 1:rows
    layer1(i,:) = save_file(i,:); %main game layer 1
    layer2(i,:) = save_file(i+rows,:); %main game layer 2
    layer3(i,:) = save_file(i+2*rows,:); %right hand item
    layer4(i,:) = save_file(i+3*rows,:); %left hand item
    layer5(i,:) = save_file(i+4*rows,:); %head clothing item
    layer6(i,:) = save_file(i+5*rows,:); %chest clothing item
    layer7(i,:) = save_file(i+6*rows,:); %arms clothing item
    layer8(i,:) = save_file(i+7*rows,:); %legs clothing item
    layer9(i,:) = save_file(i+8*rows,:); 
end
    %This, same way of loading each layer as the splitter function and is
    %explained there.
if find(layer1==471) > 0 
    [player_row,player_col] = find(layer1==471);
elseif find(layer2==471) > 0 
    [player_row,player_col] = find(layer2==471);
elseif find(layer1==472) > 0 
    [player_row,player_col] = find(layer1==472);
elseif find(layer2==472) > 0 
    [player_row,player_col] = find(layer2==472);
end
    %This serves to locate the player sprite on screen for later use when
    %apply armor to the character
sprite_directory_grid = ones(32,32);
for i = 1:32
    for j = 1:32
       sprite_directory_grid(j,i) = j+32*(i-1);
    end
end
    %Creates the same 32x32 grid as used in Game_1
inv_layer1= ones(8,12);
inv_layer2 = ones(8,12);
nums_grid = ones(13,1);
    %Creates three arrays. inv_layer1 and inv_layer2 are used in displaying
    %the inventory object,'nums_grid' creates an array for use in
    %displaying numbers
for j = 1:13
    nums_grid(j,1) = (j+19)+32*29;
end
    %Calculates the indicies of the number sprites on 'retro_pack_redux',
    %this is used for ease of use when displaying numbers
for i = 2:5
    inv_layer1(i,7) = nums_grid(11);
    inv_layer1(i,6) = sprite_directory_grid(i+25,13);
    inv_layer1(i,1) = sprite_directory_grid(i+25,12);
end
    %By refrencing the sprite_directory_grid, the sprites used on the
    %inventory screen are positioned to allow a for loop to interated and
    %display each icon sequentially.
for i = 2:6
    inv_layer1(i,10) = sprite_directory_grid(i+25,11);
    inv_layer1(i,11) = nums_grid(11);
    inv_layer1(i,12) = nums_grid(inv_array{i-1}+1);
end
    %Works the same as the for loop above but displays different sprites
for i = 2:3
    inv_layer1(i,2) = nums_grid(11);
end
hit_points = num2str(round(inv_array{6}));
for i = 1:length(hit_points)
    inv_layer1(8,(12-length(hit_points)+i)) = nums_grid(str2double(hit_points(i))+1);
end
inv_layer1(8,12-length(hit_points)-1) = sprite_directory_grid(31,12);
inv_layer1(8,12-length(hit_points)) = nums_grid(11);
    %This block is used to display the health points on the lower left
    %corner of the inventory screen. Using the nums_grid allows for numbers
    %to be displayed easier. 

%{
The follow defines all possible armor peices that can be used in the game.
When called they display on the player dynamically(based on player
location, meaning it uses the coordinates found earlier to layer on each
armor peice. 

%}



chest = inv_array{10};
switch chest
    case 'default'
        chest_armor = 0;
    case 'steel chestpiece'
        inv_layer1(3,6) = sprite_directory_grid(32,12);
        inv_layer2(3,6) = sprite_directory_grid(1,24);
        layer3(player_row,player_col) = sprite_directory_grid(27,14);
        inv_layer1(3,8) = nums_grid(7);
        chest_armor = 8;
    case 'chainmail chestpiece'
        inv_layer1(3,6) = sprite_directory_grid(32,12);
        inv_layer2(3,6) = sprite_directory_grid(2,24);
        layer3(player_row,player_col) = sprite_directory_grid(27,15);
        inv_layer1(3,8) = nums_grid(4);
        chest_armor = 5;
    case 'tunic'
        inv_layer1(3,6) = sprite_directory_grid(32,12);
        inv_layer2(3,6) = sprite_directory_grid(3,24);
        layer5(player_row,player_col) = sprite_directory_grid(27,16);
        inv_layer1(3,8) = nums_grid(2);
        chest_armor = 1;
    case 'ebony chestpiece'
        inv_layer1(3,6) = sprite_directory_grid(32,12);
        inv_layer2(3,6) = sprite_directory_grid(4,24);
        layer3(player_row,player_col) = sprite_directory_grid(28,14);
        inv_layer1(3,8) = nums_grid(9);
        chest_armor = 10;
    case 'iron chestpiece'
        inv_layer1(3,6) = sprite_directory_grid(32,12);
        inv_layer2(3,6) = sprite_directory_grid(5,24);
        layer3(player_row,player_col) = sprite_directory_grid(28,15);
        inv_layer1(3,8) = nums_grid(5);
        chest_armor = 6;
    case 'cloak'
        inv_layer1(3,6) = sprite_directory_grid(32,12);
        inv_layer2(3,6) = sprite_directory_grid(6,24);
        layer3(player_row,player_col) = sprite_directory_grid(28,16);
        inv_layer1(3,8) = nums_grid(2);
        chest_armor = 2;
end
head = inv_array{9};
switch head
    case 'default'
        head_armor = 0;
    case 'steel helmet'
        inv_layer1(2,6) = sprite_directory_grid(32,12);
        inv_layer2(2,6) = sprite_directory_grid(1,23);
        layer4(player_row,player_col) = sprite_directory_grid(25,14);
        inv_layer1(2,8) = nums_grid(7);
        head_armor = 4;
    case 'horned helmet'
        inv_layer1(2,6) = sprite_directory_grid(32,12);
        inv_layer2(2,6) = sprite_directory_grid(2,23);
        layer4(player_row,player_col) = sprite_directory_grid(25,15);
        inv_layer1(2,8) = nums_grid(4);
        head_armor = 2;
    case 'leather bandana'
        inv_layer1(2,6) = sprite_directory_grid(32,12);
        inv_layer2(2,6) = sprite_directory_grid(3,23);
        layer4(player_row,player_col) = sprite_directory_grid(25,16);
        inv_layer1(2,8) = nums_grid(2);
        head_armor = 0;
    case 'ebony helmet'
        inv_layer1(2,6) = sprite_directory_grid(32,12);
        inv_layer2(2,6) = sprite_directory_grid(4,23);
        layer4(player_row,player_col) = sprite_directory_grid(26,14);
        inv_layer1(2,8) = nums_grid(9);
        head_armor = 6;
    case 'iron helmet'
        inv_layer1(2,6) = sprite_directory_grid(32,12);
        inv_layer2(2,6) = sprite_directory_grid(5,23);
        layer4(player_row,player_col) = sprite_directory_grid(26,15);
        inv_layer1(2,8) = nums_grid(5);
        head_armor = 3;
    case 'leather hood'
        inv_layer1(2,6) = sprite_directory_grid(32,12);
        inv_layer2(2,6) = sprite_directory_grid(6,23);
        layer4(player_row,player_col) = sprite_directory_grid(26,16);
        inv_layer1(2,8) = nums_grid(2);
        head_armor = 1;
end

legs = inv_array{12};
switch legs
    case 'default'
        legs_armor = 0;
    case 'ebony-steel boots'
        inv_layer1(5,6) = sprite_directory_grid(32,12);
        inv_layer2(5,6) = sprite_directory_grid(1,25);
        layer5(player_row,player_col) = sprite_directory_grid(29,14);
        inv_layer1(5,8) = nums_grid(7);
        legs_armor = 4;
    case 'iron boots'
        inv_layer1(5,6) = sprite_directory_grid(32,12);
        inv_layer2(5,6) = sprite_directory_grid(2,25);
        layer5(player_row,player_col) = sprite_directory_grid(29,15);
        inv_layer1(5,8) = nums_grid(5);
        legs_armor = 2;
    case 'leather boots'
        inv_layer1(5,6) = sprite_directory_grid(32,12);
        inv_layer2(5,6) = sprite_directory_grid(3,25);
        layer5(player_row,player_col) = sprite_directory_grid(29,16);
        inv_layer1(5,8) = nums_grid(2);
        legs_armor = 1;
end

rt_item = inv_array{13};
switch rt_item
    case 'default' 
        wpn_dmg = 1;
    case 'sword'
        inv_layer1(2,1) = sprite_directory_grid(32,12);
        inv_layer2(2,1) = sprite_directory_grid(1,27);
        layer2(player_row,player_col) = sprite_directory_grid(472);
        layer6(player_row,player_col) = sprite_directory_grid(32,14);
        inv_layer1(2,3) = nums_grid(7);
        wpn_dmg = 6;

        
    case 'spear'
        inv_layer1(2,1) = sprite_directory_grid(32,12);
        inv_layer2(2,1) = sprite_directory_grid(2,27);
        layer2(player_row,player_col) = sprite_directory_grid(472);
        layer6(player_row,player_col) = sprite_directory_grid(32,15);
        inv_layer1(2,3) = nums_grid(5);
        wpn_dmg = 4;

    case 'bow'
        inv_layer1(2,1) = sprite_directory_grid(32,12);
        inv_layer2(2,1) = sprite_directory_grid(3,27);
        layer2(player_row,player_col) = sprite_directory_grid(472);
        layer6(player_row,player_col) = sprite_directory_grid(32,16);
        inv_layer1(2,3) = nums_grid(3);
        wpn_dmg = 2;

end
arms = inv_array{11};
switch arms
    case 'default' 
        arms_armor = 0;
    case 'ebony-steel gauntlets'
        inv_layer1(4,6) = sprite_directory_grid(32,12);
        inv_layer2(4,6) = sprite_directory_grid(4,25);
        layer7(player_row,player_col) = sprite_directory_grid(30,14);
        inv_layer1(4,8) = nums_grid(7);
        arms_armor = 4;
    case 'iron gauntlets'
        inv_layer1(4,6) = sprite_directory_grid(32,12);
        inv_layer2(4,6) = sprite_directory_grid(5,25);
        layer7(player_row,player_col) = sprite_directory_grid(30,15);
        inv_layer1(4,8) = nums_grid(5);
        arms_armor = 2;
    case 'leather gloves'
        inv_layer1(4,6) = sprite_directory_grid(32,12);
        inv_layer2(4,6) = sprite_directory_grid(6,25);
        layer7(player_row,player_col) = sprite_directory_grid(30,16);
        inv_layer1(4,8) = nums_grid(2);
        arms_armor = 0;
end
lt_item = inv_array{14};
switch lt_item
    case 'default'
        shld_armor = 0;
    case 'heater'
        inv_layer1(3,1) = sprite_directory_grid(32,12);
        inv_layer2(3,1) = sprite_directory_grid(4,27);
        layer8(player_row,player_col) = sprite_directory_grid(31,14);
        inv_layer1(3,3) = nums_grid(6);
        shld_armor = 6;
    case 'round'
        inv_layer1(3,1) = sprite_directory_grid(32,12);
        inv_layer2(3,1) = sprite_directory_grid(5,27);
        layer8(player_row,player_col) = sprite_directory_grid(31,15);
        inv_layer1(3,3) = nums_grid(3);
        shld_armor = 4;
    case 'quiver'
        inv_layer1(3,1) = sprite_directory_grid(32,12);
        inv_layer2(3,1) = sprite_directory_grid(6,27);
        layer8(player_row,player_col) = sprite_directory_grid(31,16);
        inv_layer1(3,3) = nums_grid(1);
        shld_armor = 0;
end

inv_array{7} = wpn_dmg;
inv_array{8} = inv_array{8} + head_armor + chest_armor + legs_armor + arms_armor + shld_armor;

%{
Below are two blocks, the first displays the game scene while the second
displays the inventory scene. While originally simpleGameEngine

%}

[~,fig] = drawScene1(game_obj,layer1,layer2,layer3,layer4,layer5,layer6,layer7,layer8,layer9);
set(fig, 'MenuBar', 'none');
set(fig, 'ToolBar', 'none');
movegui(fig, 'northwest')


[~,fig] = drawScene1(inv_obj,inv_layer1,inv_layer2);
set(fig, 'MenuBar', 'none');
set(fig, 'ToolBar', 'none');
movegui(fig, 'southeast')


