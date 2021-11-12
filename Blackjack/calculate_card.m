function [calculated_card] = calculate_card (sprite_list,drawn_card)
for i = 1:4
    for j = 1:12
        grid(j,i) = (j)*((i));
    end
end
grid;
[j,i] = find(sprite_list == sprite_list(drawn_card));
calculated_card = 0; 
j = j - 20;
i = i - 16;
val = grid(j,i);
val = val/i;
switch val
    case 1
        calculated_card = 11;
    case {2,3,4,5,6,7,8,9}
        calculated_card = val;
    case {10,11,12}
        calculated_card = 10;    
end