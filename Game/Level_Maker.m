

clc
close all
clear
sprite_pick = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
sprite_selected = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
sprite_display = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
sprite_pick_grid = ones(32,32);
sprite_selected_grid = ones(1,1);
vec = input('What is the grid size([y,x]): ')
% sprite_layer1_grid = ones(vec(1),vec(2));
% sprite_layer2_grid = ones(vec(1),vec(2));
sprite_layer1_grid = ones(10,10);
sprite_layer2_grid = ones(10,10);
for i = 1:32
    for j = 1:32
        sprite_pick_grid(j,i) = j+32*(i-1);

    end
end
sprite_index = 1;
pick_state = 1;
while sprite_index == 1
    switch pick_state
        case 1 
            o = '1';
            drawScene(sprite_pick,sprite_pick_grid)
            while ~(isempty(o))
                [x,y,z] = getMouseInput(sprite_pick)
                drawScene(sprite_selected,sprite_pick_grid(x,y))
                [n,m,o] = getMouseInput(sprite_pick)
                if isempty(o)
                    pick_state = 2
                elseif o == 27
                    pick_state = 3;
                    break
                end
             end
        case 2
            drawScene(sprite_display,sprite_layer1_grid,sprite_layer2_grid)
            o = 1;
            while o ~= 8
                [n,m,o] = getMouseInput(sprite_display);
                switch o
                    case 1
                        sprite_layer1_grid(n,m) = sprite_pick_grid(x,y);
                        drawScene(sprite_display,sprite_layer1_grid,sprite_layer2_grid)
                    case 2
                        sprite_layer1_grid(n,m) = sprite_pick_grid(x,1);
                        drawScene(sprite_display,sprite_layer1_grid,sprite_layer2_grid)
                    case 3
                        sprite_layer2_grid(n,m) = sprite_pick_grid(x,y);
                        drawScene(sprite_display,sprite_layer1_grid,sprite_layer2_grid)
                    case 8
                end
                pick_state = 1;
            end
        case 3
            sprite_selected_grid = ones(1,3);
            sprite_selected_grid(1,1) = sprite_pick_grid(31,32);
            sprite_selected_grid(1,2) = sprite_pick_grid(17,25);
            sprite_selected_grid(1,3) = sprite_pick_grid(20,32);
            drawScene(sprite_selected,sprite_selected_grid)
            [x,y] = getMouseInput(sprite_selected)
            if [x,y] == [1,1]
                sprite_layer1_grid
                sprite_layer2_grid
                close all
                sprite_index = 0;
                save_name = input('What would you like to name your save file?\n','s');
                save_name = append(save_name,'.txt');
                save(save_name,"sprite_layer1_grid","sprite_layer2_grid",'-ascii')
            elseif [x,y] == [1,3]
                pick_state = 1;
            end

            
    end
end

% drawScene(sprite_pick,sprite_pick_loc)
%     drawScene(sprite_disp,sprite_disp_loc)
%     [x,y] = getMouseInput(sprite_pick);
%     [n,m] = getMouseInput(sprite_disp);
%     sprite_disp_loc(n,m) =  sprite_pick_loc(x,y);
%     drawScene(sprite_disp,sprite_disp_loc)