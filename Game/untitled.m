clc
close
clear
sprite_pick = simpleGameEngine('retro_pack.png',16,16,100000,[0,0,0]);
sprite_disp = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
sprite_pick_loc = ones(32,32);
sprite_disp_loc = ones(8,8);
for i = 1:32
    for j = 1:32
        sprite_pick_loc(j,i) = j+32*(i-1);

    end
end
k = 1;
while k < 200

    drawScene(sprite_pick,sprite_pick_loc)
    drawScene(sprite_disp,sprite_disp_loc)
    [x,y] = getMouseInput(sprite_pick);
    [n,m] = getMouseInput(sprite_disp);
    sprite_disp_loc(n,m) =  sprite_pick_loc(x,y)
    drawScene(sprite_disp,sprite_disp_loc)
    k = k + 1;
end

sprite_disp_loc
