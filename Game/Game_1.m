
clc
close all
clear

% CREDIT FOR CPRINTF NEEDED IN DOC
sprite_directory = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
sprite_directory_grid = ones(32,32);
player_inventory = simpleGameEngine('retro_pack.png',16,16,1,[0,0,0]);
player_inventory_grid = ones(8,12);
for i = 1:32
    for j = 1:32
       sprite_directory_grid(j,i) = j+32*(i-1);

    end
end

%Initialztions
%skills
Strenght = 0;
Dexerity = 0;
Intelligence = 0;
Constitution = 0;
%stats
health = 10;
Attack = 1;
Defense = 1; 
%Items
left_hand_item = 'default';
right_hand_item = 'default';
head_clothing = 'default';
chest_clothing = 'default';
arms_clothing ='default';
feet_clothing ='default';
neck_clothing = 'default';
%Damage States
head_state = 100;
chest_state = 100;
arms_state = 100;
feet_state = 100;
%Inventory
Inventory = [];


progression = 0; 
switch progression
    case 0
        splitter('progression_1.txt',sprite_directory)
        cprintf('text', 'Test statement\n\n')
        cprintf('text', '[A]\n[B]\n[C]\n[D]\n');
        getKeyboardInput(player_inventory)

end
