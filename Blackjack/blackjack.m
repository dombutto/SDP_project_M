close all
clear
clc

sprites = simpleGameEngine('retro_pack.png',16,16,5,[100,100,100]);
cards = simpleGameEngine('retro_pack.png',16,16,5,[100,100,100]);
board = simpleGameEngine('retro_pack.png',16,16,5,[0,100,0]);
text_raw = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
sprites_grid = ones(2,10);
cards_grid = ones(13,4);
board_layer1 = ones(10,10);
board_layer2 = ones(10,10);
text_raw_grid = ones(13,4);
for i = 1:3
    for j = 1:13
        text_raw_grid(j,i) = (j+19)+32*((i+29)-1);
    end
end

for i = 1:4
    for j = 1:13
        cards_grid(j,i) = (j+20)+13*(i-1);
    end
end

for i = 1:10
    for j = 1:10
        sprites_grid(i,j) = j+10*(i-1);
    end
end

while ~(i==30)
    drawScene(text_raw,text_raw_grid)
    [x,y,z] = getMouseInput(text_raw)
    i = i + 1;
end

drawScene(board,board_layer1)
[m,n,o] = getMouseInput(board)

board_layer1(m,n) = text_raw_grid(x,y)
drawScene(board,board_layer1)
