close all
clear
clc
text_raw_directory = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);

for i = 1:3
    for j = 1:13
        text_grid(j,i) = (j+19)+32*((i+29)-1);

    end

end
drawScene(text_raw_directory,text_grid)

letter = 1; 
switch letter
    case 1 

end