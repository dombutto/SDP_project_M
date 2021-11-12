function [cards_list,selected_card] = draw_card (cards_list,selected_card)

i = 0;
while i ~= 1
    m = randi(12);
    n = randi(4);
    if ~(cards_list(m,n) == 0)
        selected_card = [cards_list(m,n)];
        i = 1;
    end
end
cards_list(m,n) = 0;

