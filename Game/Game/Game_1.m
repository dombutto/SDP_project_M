
clc
close all
clear
%Initallizing variables
    %Using simpleGameEngine to create objects for each board
sprite_directory_game = simpleGameEngine('retro_pack_redux.png',16,16,8,[0,0,0]);
sprite_directory_inv = simpleGameEngine('retro_pack_redux.png',16,16,5,[0,0,0]);
    %Note: Create 'retro_pack_redux' to add custom sprites.
sprite_directory_grid = ones(32,32);
for i = 1:32
    for j = 1:32
       sprite_directory_grid(j,i) = j+32*(i-1);
    end
end
    %Creates a 32x32 array which is numbered from 1 to 1024, this is used
    %to refrence the retro_pack_redux when drawing a scene.
died = 1;
    %This is set 1 for the if statement on line 26 to insure that whenever
    % a new game is started or the player dies the stats are reset. In
    % cases throughout the game died will be set to 1, these are where,
    % story wise, the player has died and resets the game
game_state = 1;
    %runs the while loop below
while game_state ~= 0
    %main while loop that allows the game to repeat.
if died == 1
    %As mentioned above if the game is reset or the player dies this
    %statement runs true, resulting in all character stats being reset.
%Initialztion of Inventory
close all 
    %Closes all figures currently open
inventory_array = {};
    %This array is vital to the function of the game. It allows passing
    %skills,stats,armor,weapons,and states, through to various functions.
    %inventory_array{n}; sets the index of n of the array to the value.
%skills
Strength = 1;
inventory_array{1} = Strength;
Dexerity = 1;
inventory_array{2} = Dexerity;
Intelligence = 1;
inventory_array{3} = Intelligence;
Charisma = 1;
inventory_array{4} = Charisma;
Constitution = 1;
inventory_array{5} = Constitution;
%stats
health = 50;
inventory_array{6} = health + 5*inventory_array{5};
attack = 1;
inventory_array{7} = attack;
defense = 1; 
inventory_array{8} = defense;
%Items
head_clothing = 'default';
inventory_array{9} = head_clothing;
chest_clothing = 'default';
inventory_array{10} = chest_clothing ;
arms_clothing ='default';
inventory_array{11} = arms_clothing;
legs_clothing ='default';
inventory_array{12} = legs_clothing;
right_hand_item = 'default';
inventory_array{13} = right_hand_item;
left_hand_item = 'default';
inventory_array{14} = left_hand_item;
%states
lvl_up_state = 0;
inventory_array{15} = lvl_up_state;
player_state = 1;
inventory_array{16} = player_state; 
%Misc Variables that need to be reset on every game restart
berry_chance = 50;
drank = 0;
progress = 0; 
bandit_leader = 1;
opened_small_chest = 0;
end
died = 0;
    %died is set to zero to insure stats are not reset on each iteration.
switch progress
    %main switch statement, this is changed when the main scene is changes
    %if a new scene is called that only modifies a current scene that is
    %considered 'subprogress' and thus a new switch statement is nested.

    %{ 
    Just as a rule of thumb; The splitter function is used when the
    inventory screen is not wanted. Both draw scenes in similar ways,
    however the inventory function can only draw the game scene and the
    inventory scene, while the splitter function can only draw the game
    scene.

    Additionally, each 'progress' case statement and subsequent
    'subprogress' case statement are of generally the same sructure, that
    being: [1] calling the scene, [2] text and choice strings, [3] choice
    funtion. Those with multiple choices the user picks from, have 
    sub-switch statements. Some have one choice, with a "\n[1]: Continue",
    this is only for story purposes and to allow the user to continue on to
    the next scene(or next text block). In some cases the 'progress'
    variable is set to a number at the end of a case statement this is just
    for moving around the case statement and progressing the game.

    Each function is explained within the function file 
    
    %}
    case 0
        %Displays
        splitter('progression_0.txt',sprite_directory_game)
        text = "<strong>Oh you're finally awake! Come on now, get up, there are things to do, people to see you know the deal.</strong>";
        choice_1 = "\n[1]: Just like... 5 more mintues.";
        choice_2 = "\n[2]: Nah I'm good.";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
        switch subprogress
            case 1
                text = "<strong>Come on, rise and shine sleepy head, there's a whole world out there, maybe one day you'll actually get to touch some grass.</strong>";
                choice_1 = "\n[1]: What if I don't wanna touch grass?";
                choice_2 = "\n[2]: Fine";
                choice_3 = "\n[3]: *saddness* Fine...";
                subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2,choice_3);
                switch subprogress
                    case 1
                        text = "<strong>Let's GO I want to get this over wit- I mean started, yeah started.</strong>";
                        choice_1 = "\n[1]: Fine, mysterious british man in my head";
                        choicefnc(text,sprite_directory_game,progress,choice_1);
                        text = "";
                        choice_1 = "[1]: Wake up.";
                        choicefnc(text,sprite_directory_game,progress,choice_1);
                        progress = 1;
                    case 2
                        text = "<strong>Let's get on with it then</strong>";
                        choice_1 = "\n[1]: Fine, mysterious british man in my head";
                        choicefnc(text,sprite_directory_game,progress,choice_1);
                        text = "";
                        choice_1 = "[1]: Wake up.";
                        choicefnc(text,sprite_directory_game,progress,choice_1);
                        progress = 1;
                    case 3 
                        text = "<strong>Let's go you'll have fun once you get out there.</strong>";
                        choice_1 = "\n[1]: Okay, mysterious british man in my head";
                        choicefnc(text,sprite_directory_game,progress,choice_1);
                        text = "";
                        choice_1 = "[1]: Wake up.";
                        choicefnc(text,sprite_directory_game,progress,choice_1);
                        progress = 1;
                end
            case 2
                quit
                    %Quits matlab
        end
    case 1 
        splitter('progression_1.txt',sprite_directory_game)
        text = "You wake in lush forrest, the sound of birds chirpping arive from every direction.  ";
        choice_1 = "\n[1]: Sit up";
        choicefnc(text,sprite_directory_game,progress,choice_1);
        text = "As you rise, the sense of unfamiliarity begins to take over you. You dont't where you are; You don't how you got there, but then you realize something... you can remember anything, your name, your family, you entire life, gone ";
        choice_1 = "\n[1]: Continue";
        choicefnc(text,sprite_directory_game,progress,choice_1);
        text = "<strong>Woah, woah, woah, there, don't go spiralling out of control now, you just, took a bit of a fall. You'll be fine, trust me! I know about these things. </strong>";
        choice_1 = "\n[1]: Avoid having an existential crisis.";
        choice_2 = "\n[2]: Think more about how everything is gone.";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
        switch subprogress
            case 1 
                text = "<strong> See? much better. Now lets get down to buisness.   </strong>";
                choice_1 = "\n[1]: Stand Up";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                progress = 2;
            case 2 
                text = "As you curl up into a ball thoughts fly around your mind, your vision begins to darken";
                choice_1 = "\n[1]: Go sleep";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                splitter('progression_0.txt',sprite_directory_game)
                text = "<strong> Aw shit... there goes another one. Jeff! get me another one.    </strong>";
                choice_1 = "\n[1]: JEFF!";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                died = 1;
        end     
    case 2 
        inventory_array = inventory(inventory_array,'progression_1.txt',sprite_directory_game,sprite_directory_inv);
            %Here calling the inventory function begins instead of the 
            %splitter as it is necessary to view the inventory screen. 
        text = "As you look around you, a plan begins to develope in your head.";
        choice_1 = "\n[1]: Explore the near by dirt path";
        choice_2 = "\n[2]: Look for simple resources in the area";
        choice_3 = "\n[3]: Call for help";
        choice_4 = "\n[4]: Medatate to recall your memory";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2,choice_3,choice_4);
        switch subprogress
            case 1
                progress = 4 ;
            case 2
                progress = 5;
            case 3
                text ="As your voice rings out birds fly from the tops of trees and squirrels scurry away.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1)
                text = "<strong>Why are you yelling? I have ears you know</strong>";
                choice_1 = "\n[1]: Continue calling for help";
                choice_2 = "\n[2]: Consider a more reasonable option";
                subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
                switch subprogress
                    case 1
                        text ="Again, your voice rings out, and still nothing returns other than the flutter of birds.";
                        choice_1 = "\n[1]: Continue calling for help";
                        choice_2 = "\n[2]: Consider a more reasonable option";
                        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
                        switch subprogress
                            case 1
                                text ="<strong> Okay, look no one is coming to help, that just how it's set up so like... stop</strong>";
                                choice_1 = "\n[1]: Continue calling for help";
                                choice_2 = "\n[2]: Consider a more reasonable option";
                                subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
                                switch subprogress
                                    case 1
                                        text = "<strong>Okay I'm done</strong>";
                                            choice_1 = "\n[1]: What?";
                                            choicefnc(text,sprite_directory_game,progress,choice_1)
                                            died = 1;
                                    case 2
                                        progress = 3;
                                end
                            case 2
                                progress = 3;
                        end
                    case 2
                        progress = 3;
                end
            case 4
                text = "As sit you and calmly recall any amount of your past life, you open your eyes feeling better about the situation at hand.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                text = "<strong>You done now, finally, okay can we actually do something productive? </strong>";
                choice_1 = "\n[1]: Yes";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                progress = 3;
        end
    case 3
        inventory_array = inventory(inventory_array,'progression_1.txt',sprite_directory_game,sprite_directory_inv);
        text = "You return to developing a more... practical plan";
        choice_1 = "\n[1]: Explore the near by dirt path";
        choice_2 = "\n[2]: Look for simple resources in the area";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
        switch subprogress
            case 1
                progress = 4 ;
            case 2
                progress = 5;
        end
    case 4
        inventory_array = inventory(inventory_array,'progression_4a.txt',sprite_directory_game,sprite_directory_inv);
        text = "You make your way to the path. The bright morning light is blocked out by the tall trees that surround path.";
        choice_1 = "\n[1]: Continue";
        choicefnc(text,sprite_directory_game,progress,choice_1);
        inventory_array = inventory(inventory_array,'progression_4b.txt',sprite_directory_game,sprite_directory_inv);
        text = "As you round the corner of the path a fallen tree blocks the road ahead of you";
        choice_1 = "\n[1]: Push the tree off the road.";
        choice_2 = "\n[2]: Leap over the tree.";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
        switch subprogress
            case 1
                inventory_array = inventory(inventory_array,'progression_4bi.txt',sprite_directory_game,sprite_directory_inv);
                text = "You gather your might and heave the tree off the road. You feel stronger.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                inventory_array{1} = inventory_array{1} + 1;
            case 2
                inventory_array = inventory(inventory_array,'progression_4bii.txt',sprite_directory_game,sprite_directory_inv);
                text = "You leap over the tree easily clearing it. You feel like you can jump higher.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                inventory_array{2} = inventory_array{2} + 1;

        end
        inventory_array = inventory(inventory_array,'progression_4c.txt',sprite_directory_game,sprite_directory_inv);
        text = "While walking down the path you spot an abandoned wagon.";
        choice_1 = "\n[1]: Continue";
        choicefnc(text,sprite_directory_game,progress,choice_1);
        inventory_array = inventory(inventory_array,'progression_4d.txt',sprite_directory_game,sprite_directory_inv);
        text = "You are only able to see the faint glimmer of something shiny. But you wonder, the cart is in perfect condition, who would just leave it here?";
        choice_1 = "\n[1]: Continue down the path";
        choice_2 = "\n[2]: Search the wagon";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
        switch subprogress
            case 1
            case 2 
            splitter('progression_4e.txt',sprite_directory_game);
            text = "You search the cart. Before you are a sword, a spear, and a bow with some arrows. You decide on which one to pick as you may only carry one.\n\n<strong>Carful, you never what your choice may lead to.</strong>";
            choice_1 = "\n[1]: Sword";
            choice_2 = "\n[2]: Spear";
            choice_3 = "\n[3]: Bow and Arrows";
            subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2,choice_3);
            switch subprogress
                case 1
                    inventory_array{13} = 'sword';
                    splitter('progression_4e_sword.txt',sprite_directory_game);
                    bandit_leader = 1;
                case 2
                    inventory_array{13} = 'spear';
                    splitter('progression_4e_spear.txt',sprite_directory_game);
                case 3
                    inventory_array{13} = 'bow';
                    inventory_array{14} = 'quiver';
                    splitter('progression_4e_bow.txt',sprite_directory_game);
            end
        end
        pause(.5)
        inventory_array = inventory(inventory_array,'progression_4f.txt',sprite_directory_game,sprite_directory_inv);
        text = "After, you continue down the path.";
        choice_1 = "\n[1]: Continue";
        choicefnc(text,sprite_directory_game,progress,choice_1)
        progress = 6;
        
    case 5
        text = "As you look around, through the trees you see a field with several berry bushes. You also notice the sound of flowing water coming from the opposite direction.";
        choice_1 = "\n[1]: Go towards the field";
        choice_2 = "\n[2]: Go towards the sound of flowing water";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
        switch subprogress
            case 1
                inventory_array = inventory(inventory_array,'progression_5a.txt',sprite_directory_game,sprite_directory_inv);
                text = "As you arrive in the field you see many bushes full of plump berries.";
                choice_1 = "\n[1]: Eat berries";
                choice_2 = "\n[2]: Return to forrest";
                subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
                switch subprogress
                    case 1
                        berry_poison = randi(100);
                            %'berry_poison' is a random number between 1 
                            %and 100 that is used with previously declared
                            %'berry_chance'
                        pause(1)
                        if berry_poison > berry_chance
                            text = "Minutes after eating the berries a sharp pain erupts from within your stomach. You fall you the ground, no power left in you muscles. Your vision darkens.";
                            choice_1 = "\n[1]: Continue";
                            choicefnc(text,sprite_directory_game,progress,choice_1);
                            text = "<strong>See now thats why you don't just eating random berries you find on a bush. </strong>";
                            choice_1 = "\n[1]: Continue";
                            choicefnc(text,sprite_directory_game,progress,choice_1);
                            died = 1;
                        else
                            text = "You eat the berries, you feel refreshed";
                            choice_1 = "\n[1]: Continue";
                            inventory_array{5} = inventory_array{5} + 1;
                            inventory_array{6} = health + 5*inventory_array{5};
                            inventory_array = inventory(inventory_array,'progression_5a.txt',sprite_directory_game,sprite_directory_inv);
                            choicefnc(text,sprite_directory_game,progress,choice_1);
                            text = "<strong>See that's why... oh huh, that's not what I was expecting. </strong>";
                            choice_1 = "\n[1]: Continue";
                            choicefnc(text,sprite_directory_game,progress,choice_1);
                            text = "You make your way back to the forrest";
                            choice_1 = "\n[1]: Continue";
                            choicefnc(text,sprite_directory_game,progress,choice_1);
                            progress = 3;
                            berry_chance = berry_chance - 10;
                                %'berry_chance' is decreased by 10 each
                                %time the berry is consumed, effectively
                                %increasing the chances the player will die
                        end
                    case 2
                        progress = 3;
                end
            case 2
                        %Only is true drank is set to zero
                    inventory_array = inventory(inventory_array,'progression_5b.txt',sprite_directory_game,sprite_directory_inv);
                    text = "You follow the sound of flowing water. It leads to a small river.";
                    choice_1 = "\n[1]: Go towards the river.";
                    choice_2 = "\n[2]: Return to forrest.";
                    subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
                    switch subprogress
                        case 1
                            inventory_array = inventory(inventory_array,'progression_5bi.txt',sprite_directory_game,sprite_directory_inv);
                            text = "The water is crystal clear, it's likely melt water from a nearby mountain. You also see what looks like a small chest.";
                            choice_1 = "\n[1]: Take a drink";
                            choice_2 = "\n[2]: Open the small chest.";
                            choice_3 = "\n[3]: Return to forrest.";
                            subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2);
                            switch subprogress
                                case 1
                                    if drank == 0
                                    drank = 1;
                                        %Setting 'drank' to one so players
                                        %can only drink once.
                                    inventory_array{2} = inventory_array{2} + 1;
                                    inventory_array = inventory(inventory_array,'progression_5bii.txt',sprite_directory_game,sprite_directory_inv);
                                    text = "The water is refreshing, it makes you feel more energized.";
                                    choice_1 = "\n[1]: Return to forrest.";
                                    choicefnc(text,sprite_directory_game,progress,choice_1);
                                    progress = 3;
                                    else
                                        inventory_array = inventory(inventory_array,'progression_5b.txt',sprite_directory_game,sprite_directory_inv);
                                        text = "You have already dranken water";
                                        choice_1 = "\n[1]: Return to forrest.";
                                        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1);
                                        progress = 3;
                                    end
                                case 2
                                    if opened_small_chest == 0
                                        opened_small_chest = 1;
                                        inventory_array = inventory(inventory_array,'progression_5biii.txt',sprite_directory_game,sprite_directory_inv);
                                        text = "When you open the chest it reveals 3 items inside. You only have enough strenghth to carry one";
                                        choice_1 = "\n[1]: Round Shield";
                                        choice_2 = "\n[2]: Chainmail Chestpiece";
                                        choice_3 = "\n[3]: Iron Helmet";
                                        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2,choice_3);
                                        switch subprogress
                                            case 1
                                                inventory_array{14} = 'round';
                                                splitter('progression_5biii_round.txt',sprite_directory_game);
                                                
                                            case 2
                                                inventory_array{10} = 'chainmail chestpiece';
                                                splitter('progression_5biii_chainmail.txt',sprite_directory_game);
                                            case 3
                                                inventory_array{9} = 'iron helmet';
                                                splitter('progression_5biii_iron.txt',sprite_directory_game);
                                        end
                                        inventory_array = inventory(inventory_array,'progression_1.txt',sprite_directory_game,sprite_directory_inv);
                                        text = "After choosing your item, you return to the forrest";
                                        choice_1 = "\n[1]: Return to forrest.";pause(.5)
                                    else
                                        inventory_array = inventory(inventory_array,'progression_5b.txt',sprite_directory_game,sprite_directory_inv);
                                        text = "You have already opened the small chest";
                                        choice_1 = "\n[1]: Return to forrest.";
                                        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1);
                                        progress = 3;
                                    end
                                case 3
                                    progress = 3;
                             end
                        case 2
                            progress = 3;
                    end

        end
    case 6 
        inventory_array = inventory(inventory_array,'progression_6.txt',sprite_directory_game,sprite_directory_inv);
        text = "After cresting a small hill in the path a wolf jumps from the forrest, he dosesn't notice you.";
        choice_1 = "\n[1]: Scream and charge at the wolf.";
        choice_2 = "\n[2]: Attempt to sneak up on the wolf.";
        choice_3 = "\n[3]: Sneak into the forrest and try to sneak past the wolf.";
        subprogress = choicefnc(text,sprite_directory_game,progress,choice_1,choice_2,choice_3);
        switch subprogress
            case 1
                text = "You let out a ferocious bellow, charging towards the wolf. The wolf is startled.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                if inventory_array{1} > 1
                    inventory_array = inventory(inventory_array,'progression_6a.txt',sprite_directory_game,sprite_directory_inv);
                    text = "The wolf, startled by your intimating aura, flees from you into the forrest.";
                    choice_1 = "\n[1]: Continue";
                    choicefnc(text,sprite_directory_game,progress,choice_1); 
                else
                    inventory_array = inventory(inventory_array,'progression_6ai.txt',sprite_directory_game,sprite_directory_inv);
                    text = "The wolf, while being initally startled, is able to ready itself for battle";
                    choice_1 = "\n[1]: Continue";
                    choicefnc(text,sprite_directory_game,progress,choice_1);
                    inventory_array = combat(inventory_array,'wolf',sprite_directory_game,'progression_6a.txt',sprite_directory_inv);
                end
            case 2 
                inventory_array = inventory(inventory_array,'progression_6b.txt',sprite_directory_game,sprite_directory_inv);
                text = "You crouch on the path, slowly making your way towards the wolf.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                inventory_array = inventory(inventory_array,'progression_6bi.txt',sprite_directory_game,sprite_directory_inv);
                text = "Just before reaching the wolf it hears you and begins you charge at you.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                inventory_array = combat(inventory_array,'wolf',sprite_directory_game,'progression_6bi.txt',sprite_directory_inv);
            case 3 
                inventory_array = inventory(inventory_array,'progression_6c.txt',sprite_directory_game,sprite_directory_inv);
                text = "You sneak through bushes off the path attempting to sneak past the wolf.";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                inventory_array = inventory(inventory_array,'progression_6ci.txt',sprite_directory_game,sprite_directory_inv);
                text = "With each step, the faint crunch of leaves sounds out, you're heart races as you get closer and closer to the wolf ";
                choice_1 = "\n[1]: Continue";
                choicefnc(text,sprite_directory_game,progress,choice_1);
                if inventory_array{2} > 1 
                    inventory_array = inventory(inventory_array,'progression_6cii.txt',sprite_directory_game,sprite_directory_inv);
                    text = "You sucsesfully sneak past the wolf, as it has now turned away, looking down the path.";
                    choice_1 = "\n[1]: Continue";
                    choicefnc(text,sprite_directory_game,progress,choice_1);
                else
                    inventory_array = inventory(inventory_array,'progression_6ai.txt',sprite_directory_game,sprite_directory_inv);
                    text = "As you just make it past the wolf. You step on a branch breaking it, the wolf is alerted. You both prepare for battle. ";
                    choice_1 = "\n[1]: Continue";
                    choicefnc(text,sprite_directory_game,progress,choice_1);
                    inventory_array = combat(inventory_array,'wolf',sprite_directory_game,'progression_6ai.txt',sprite_directory_inv);
                end
                
        end
        if inventory_array{16} == 1
        inventory_array = level_up(inventory_array,'progression_6d.txt',sprite_directory_game,sprite_directory_inv);
        inventory_array = inventory(inventory_array,'progression_6d.txt',sprite_directory_game,sprite_directory_inv);
        text = "After your encounter with the wolf you continue on the path";
        choice_1 = "\n[1]: Continue";
        choicefnc(text,sprite_directory_game,progress,choice_1);
        inventory_array{15} = 1;
        inventory_array = inventory(inventory_array,'progression_1.txt',sprite_directory_game,sprite_directory_inv);
        progress = 7;
        else
            text = "<strong>Welp there goes another one.</strong>";
            choice_1 = "\n[1]: Continue";
            choicefnc(text,sprite_directory_game,progress,choice_1);
            died = 1;
        end
    case 7
        text = "Thank you for playing my game! I hope enjoyed it, if you did please let me know. :)";
        choice_1 = "\n[1]: Continue to Restart";
        choicefnc(text,sprite_directory_game,progress,choice_1);
        died = 1;

end
end

