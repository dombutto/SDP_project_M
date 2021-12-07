function inv_array = combat(inv_array,enemy,game_obj,save_file,inv_obj)

%{ 
This function allows the user to fight a number of enemies when called
within the game
%}
game_update = 0;
switch enemy
    %Defines the enemeies and declares their stats for later use. 
    case 'wolf'
        enemy_health = 15;
        enemy_attack = 2;
        enemy_armor = 8;
        enemy_dodge = .30;
        textb = "wolf health: ";
    case 'bandit'
        enemy_health = 30;
        enemy_attack = 4;
        enemy_armor = 15;
        enemy_dodge = .20;
        textb = "bandit health: ";
end
while enemy_health > 0 && inv_array{6} > 0
    %Loops until the either the 'enemy_health' reaches 0 or or the user's
    %health (inv_array{6})
    text = append(textb,num2str(enemy_health));
        %adds the current enemy health to the 'textb' string by turning it
        %into a string and using append
    switch inv_array{13}
        %{ 
        This switch statement allows for attacks of different weapons to
        have different names, and damage calcultion. Using the attackfcn,
        there are different attack types (expect for that the default). One
        attack, the 'Stab', is better for higher armored targets. The other,
        the 'Slash', is better for lower armored targets.(This is explained
        more so within the attackfcn itself). This simply calls the
        attackfcn setting it equal to 'dmg', the names the attack for later
        use
        %}
        case 'default' 
            choice_1 = "\n[1]: Punch";
            choicefnc(text,game_obj,game_update,choice_1);
            attack = 'punch';
            dmg = inv_array{7}+inv_array{1};
        case 'sword'
            choice_1 = "\n[1]: Stab";
            choice_2 = "\n[2]: Slash";
            attack = choicefnc(text,game_obj,game_update,choice_1,choice_2);
            if attack == 1
                dmg = attackfcn(attack,inv_array,enemy_armor);
                attack = 'stab';
            elseif attack == 2
                dmg = attackfcn(attack,inv_array,enemy_armor);
                attack = 'slash';
            end
        case 'spear'
            choice_1 = "\n[1]: Stab";
            choice_2 = "\n[2]: Bash";
            attack = choicefnc(text,game_obj,game_update,choice_1,choice_2);
            if attack == 1
                dmg = attackfcn(attack,inv_array,enemy_armor);
                attack = 'stab';
            elseif attack == 2
                dmg = attackfcn(attack,inv_array,enemy_armor);
                attack = 'bash';
            end
        case 'bow'
            choice_1 = "\n[1]: Fire arrow";
            choice_2 = "\n[2]: Bash";
            attack = choicefnc(text,game_obj,game_update,choice_1,choice_2);
            if attack == 1
                dmg = attackfcn(attack,inv_array,enemy_armor);
                attack = 'shoot';
            elseif attack == 2
                dmg = attackfcn(attack,inv_array,enemy_armor);
                attack = 'bash';
            end
    end
    %{
    Both the of the following 'if' statements calculate the damage done to
    the player in the case of the first and the enemy in the case of the
    second. They both work in the same way. By generating a random number
    they calculate the hit percentage based on the dodge stat of the target 
    then subtract the total health by the damage dealt. Then print the
    attack along with the enemy then finally the damage dealt.
    %}
    player_hit_chance = randi(100);
    if player_hit_chance > 100*enemy_dodge
        fprintf("\nYou %s the %s with your %s for %.1f damage",attack,enemy,inv_array{13},dmg)
        enemy_health = enemy_health - dmg;
        pause(2)
    else
        fprintf("\nThe %s evaded your %s",enemy,attack)
        pause(2)
    end
    if enemy_health > 0
        enemy_hit_chance = randi(100);
        if enemy_hit_chance > 100*inv_array{2}/10
            enemy_dmg = enemy_attack - (inv_array{8}/40)*(enemy_attack);
            fprintf('\nThe %s attacked you for %.1f dmg',enemy,enemy_attack)
            inv_array{6} = inv_array{6} - enemy_dmg;
            inv_array = inventory(inv_array,save_file,game_obj,inv_obj);
            pause(2)
        else
            fprintf("\nYou dodged the %s's attack!",enemy)
            pause(2)
        end
    end
end
%If statement runs after the while loop has ended, determines whether the
%player or enemy died then prints the statement accordingly.
if inv_array{6} <= 0 
    fprintf('\nYou have died from the %s!',enemy)
    inv_array{16} = 0;
else
    fprintf('\nYou killed the %s!',enemy)
    inv_array{15} = 1;
end

