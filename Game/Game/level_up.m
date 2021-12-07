function inv_array = level_up(inv_array,save_file,game_obj,inv_obj)

%{
This function may be called at various points in a game. It allows the
user to input a number of 1 through 5 to increase a skill. This works by
passing the cell array called 'inv_array' then increasing them based on a
user input using 'choicefcn' then displaying the changes using the
'inventory' function. The passing of 'save_file','game_obj','inv_obj' are
for the used of the 'inventory' function and 'choicefcn'
%}

%Initiallizing Variables 
progress = 0;

for i = 1:5
    %for loop that allows the user to increase 1 skill each iteration 
    text = "You've level up! You have %i points to add to your skills.";
    choice_1 = "\n[1]: Strenght";
    choice_2 = "\n[2]: Dexerity";
    choice_3 = "\n[3]: Intelligence";
    choice_4 = "\n[4]: Charisma";
    choice_5 = "\n[5]: Constitution";
    
    subprogress = choicefnc(text,game_obj,progress,choice_1,choice_2,choice_3,choice_4,choice_5);
    switch subprogress
        case 1 
            inv_array{1} = inv_array{1} + 1;
        case 2
            inv_array{2} = inv_array{2} + 1;
        case 3
            inv_array{3} = inv_array{3} + 1;
        case 4
            inv_array{4} = inv_array{4} + 1;
        case 5
            inv_array{5} = inv_array{5} + 1;
            inv_array{6} = 50 + 5*inv_array{5};
                %recalculating health
    end
    inventory(inv_array,save_file,game_obj,inv_obj)
end
inv_array{15} = 0;

