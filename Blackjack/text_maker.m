close all
clear
clc
text_raw = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
text_output = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
text_raw_grid = ones(13,4);
text_output_grid = ones(10,10);
for i = 1:3
    for j = 1:13
        text_raw_grid(j,i) = (j+19)+32*((i+29)-1);
    end
end

drawScene(text_raw,text_raw_grid)
drawScene(text_output,text_output_grid)
z = 0;
while ~(isempty(z))
    for i = 1:10
        for j = 1:10
            [x,y,z] = getMouseInput(text_raw)
            k = find(text_raw_grid,2)
            text_output_grid(i,j) = text_raw_grid(x,y);
            drawScene(text_output,text_output_grid)
            

        end
    end    
end
letter = 1; 
% switch letter
%     case 1 
% 
% end