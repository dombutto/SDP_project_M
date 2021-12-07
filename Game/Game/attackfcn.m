function damage = attackfcn(attack,inv_array,enemy_armor)
%{
This function is only to simplifiy the combat function as the damage
calculation is rather long and complex. It uses a switch statement
depending on the attack type input

The damage is calculated by taking the base attack of the held weapon
(inv_array{7}) and adding that to the Strength skill(inv_array{1}). That 
combined value is subtraced by the following: the enemy_armor divided by 40 
(to get the ratio of the enemy armor to max armor value) multiplied by the 
base attack of the held weapon plus the strength skill. Effectivly
factoring in the armor of the enemy to calculated the total damage. In
addition to that, in order to make the attack distinct, different quadratic
equations are used to negate the effect of the armor penelty. The equation
used within the 'Stabbing attack is higher as the armor increases. Where as
the equation used within the 'Slashing' attack is more effective with lower
armors.

%}
switch attack
    case 1 %Stabbing
        damage = inv_array{7} + inv_array{1} - (enemy_armor/40)*(inv_array{7} + inv_array{1})+(((1/160)*enemy_armor^2));
    case 2 %Slashing
        damage = inv_array{7} + inv_array{1} - (enemy_armor/40)*(inv_array{7} + inv_array{1})+(((1/320)*(enemy_armor-40)^2));
end