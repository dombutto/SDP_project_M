
close all
clear
clc

sprites = simpleGameEngine('retro_pack.png',16,16,5,[0,0,0]);
board = simpleGameEngine('retro_pack.png',16,16,5,[0,100,0]);
sprites_grid = ones(32,32);
deck_grid = ones(12,4);
board_layer1 = ones(10,11);
board_layer2 = ones(10,11);
text_raw_grid = ones(13,3);

for i = 1:32
    for j = 1:32
        sprites_grid(j,i) = (j)+32*(i-1);
    end
end

for i = 1:3
    for j = 1:13
        text_raw_grid(j,i) = (j+19)+32*((i+29)-1);
    end
end
text_raw_grid(13) = 1;
for i = 1:4
    for j = 1:12
        deck_grid(j,i) = (j+20)+32*((i+16)-1);
    end
end

drawn_card = 0;
x = 0;
y = 0;
stage = 1;
money = 50;
s = 0;
p = 0;
dealer_hand = 0;
player_hand = 0;
while money > 0
switch stage
    case 1
        while ~(y > 4 && y < 8 && x == 7)
            board_layer1(2,2) = text_raw_grid(2,2);
            board_layer1(2,3) =  text_raw_grid(12,2);
            board_layer1(2,4) =  text_raw_grid(1,2);
            board_layer1(2,5) =  text_raw_grid(3,2);
            board_layer1(2,6) =  text_raw_grid(11,2);
            board_layer1(2,7) =  text_raw_grid(10,2);
            board_layer1(2,8) =  text_raw_grid(1,2);
            board_layer1(2,9) =  text_raw_grid(3,2);
            board_layer1(2,10) =  text_raw_grid(11,2);
            board_layer1(7,4) =  text_raw_grid(6,3);
            board_layer1(7,5) =  text_raw_grid(7,3);
            board_layer1(7,6) =  text_raw_grid(1,2);
            board_layer1(7,7) =  text_raw_grid(5,3);
            board_layer1(7,8) =  text_raw_grid(7,3);
            drawScene(board,board_layer1)
            [x,y] = getMouseInput(board);
            if y > 4 && y < 8 && x == 7
                stage = 2;
                i = i + 1;
            end
        end
    case 2
        board_layer1 = ones(10,11);
        x = 0;
        y = 0;
        board_layer1(7,4) = text_raw_grid(4,2);
        board_layer1(7,5) = text_raw_grid(5,2);
        board_layer1(7,6) = text_raw_grid(1,2);
        board_layer1(7,7) = text_raw_grid(12,2);
        board_layer1(7,8) = sprites_grid(22,26);
        drawScene(board,board_layer1)
        while ~(y > 4 && y < 8 && x == 7) 
            [x,y] = getMouseInput(board);
        end
        stage = stage + 1;
    case 3
        clc
        dealer_hand = 0;
        player_hand = 0;
        board_layer1 = ones(10,11);
        board_layer1(3,5) = sprites_grid(20,18);
        board_layer1(4,4) = sprites_grid(20,17);
        board_layer1(4,6) = sprites_grid(20,17);
        board_layer1(7,3) = sprites_grid(20,17); 
        drawScene(board,board_layer1)

        n = 0;
        for n = 1:4
            [deck_grid,drawn_card] = draw_card(deck_grid,drawn_card);
            switch n 
                case 1 
                    pause(.25)
                    board_layer1(7,3) = sprites_grid(drawn_card);   
                case 2
                    board_layer1(4,4) = sprites_grid(20,18);
                    hidden_card = drawn_card;
                case 3
                    board_layer1(7,4) = sprites_grid(drawn_card);
                case 4
                    board_layer1(4,6) = sprites_grid(drawn_card);
    
    
            end
            drawScene(board,board_layer1)
            pause(.5)
            card_value = calculate_card(sprites_grid,drawn_card);
            drawn_card;
            n;
            if  player_hand == 11 && card_value == 11
                card_value = 1;
            elseif dealer_hand == 11 && card_value == 11
                card_value = 1;
            end
            if n == 1||n == 3
                player_hand = player_hand + card_value
            else
                dealer_hand = dealer_hand + card_value
            end
            

        end
    stage = stage + 1;


        












    case 4
        board_layer1(7,8) = text_raw_grid(8,2);
        board_layer1(7,9) = text_raw_grid(9,2);
        board_layer1(7,10) = text_raw_grid(7,3);
        board_layer1(8,8) = text_raw_grid(6,3);
        board_layer1(8,9) = text_raw_grid(7,3);
        board_layer1(8,10) = text_raw_grid(1,2);
        board_layer1(8,11) = text_raw_grid(12,3);
        pause(.5)
        drawScene(board,board_layer1)
        a = 0;
        while (~(y > 8 && y < 10 && x == 7) && ~(y > 8 && y < 11 && x == 8)) || a == 0
                [x,y] = getMouseInput(board);
            
            if y > 8 && y < 10 && x == 7
                [deck_grid,drawn_card] = draw_card(deck_grid,drawn_card);
                board_layer1(7,n+1) = sprites_grid(drawn_card);
                card_value = calculate_card(sprites_grid,drawn_card);
                drawScene(board,board_layer1)
                player_hand = player_hand + card_value
                n = n + 1;
                x = 0;
                y = 0;
                if player_hand > 21
                    money = money - 10
                    break
                end
            elseif y > 8 && y < 11 && x == 8
                board_layer1(4,4) = sprites_grid(hidden_card);
                a = 1;
            end

        end
    b = 1
    %stopped here, doesn't recongnise if player hand is greater than dealer
    %hand
    if (player_hand <= 21) > (dealer_hand <= 21) 
        money = money + 10
    end
end

end


