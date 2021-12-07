

clc
close all
clear
sprite_pick = simpleGameEngine('retro_pack_redux.png',16,16,8,[0,0,0]);
sprite_selected = simpleGameEngine('retro_pack_redux.png',16,16,5,[0,0,0]);
sprite_display = simpleGameEngine('retro_pack_redux.png',16,16,5,[0,0,0]);
sprite_pick_grid = ones(32,32);
sprite_selected_grid = ones(1,1);
vec = input('What is the grid size([y,x]): ');
layer1 = ones(vec(1),vec(2));
layer2 = ones(vec(1),vec(2));
layer3 = ones(vec(1),vec(2));
layer4 = ones(vec(1),vec(2));
layer5 = ones(vec(1),vec(2));
layer6 = ones(vec(1),vec(2));
layer7 = ones(vec(1),vec(2));
layer8 = ones(vec(1),vec(2));
layer9 = ones(vec(1),vec(2));



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
            drawScene1(sprite_pick,sprite_pick_grid)
            while ~(isempty(o))
                [x,y] = getMouseInput(sprite_pick)
                drawScene1(sprite_selected,sprite_pick_grid(x,y))
                [n,m,o] = getMouseInput(sprite_pick);
                if isempty(o)
                    pick_state = 2;
                elseif o == 27
                    pick_state = 3;
                    break
                end
             end
        case 2
            drawScene1(sprite_display,layer1,layer2,layer3, ...
                layer4,layer5,layer5,layer6, ...
                layer7,layer8,layer9)
            o = 1;
            while o ~= 8
                [n,m,o] = getMouseInput(sprite_display)
                switch o
                    case 1
                        layer1(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 2
                        layer1(n,m) = sprite_pick_grid(1,1);
                        layer2(n,m) = sprite_pick_grid(1,1);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 3
                        layer2(n,m) = sprite_pick_grid(x,y); 
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 8
                        break
                    case 51
                        layer3(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 52
                        layer4(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 53
                        layer5(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 54
                        layer6(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 55
                        layer7(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 56
                        layer8(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)
                    case 57
                        layer9(n,m) = sprite_pick_grid(x,y);
                        drawScene1(sprite_display,layer1,layer2,layer3,layer4,layer5,layer5,layer6,layer7,layer8,layer9)


                end
                pick_state = 1;
            end
        case 3
            sprite_selected_grid = ones(1,3);
            sprite_selected_grid(1,1) = sprite_pick_grid(31,32);
            sprite_selected_grid(1,2) = sprite_pick_grid(17,25);
            sprite_selected_grid(1,3) = sprite_pick_grid(20,32);
            drawScene1(sprite_selected,sprite_selected_grid)
            [x,y] = getMouseInput(sprite_selected);
            if [x,y] == [1,1]
                close all
                sprite_index = 0;
                save_name = input('What would you like to name your save file?\n','s');
                save_name = append(save_name,'.txt');
                save(save_name,"layer1","layer2","layer3","layer4","layer5","layer6","layer7","layer8","layer9",'-ascii')
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