function [game_update] = choicefnc(text,game_obj,game_update,varargin)

%This function allows the use of a variable number of choices, this is
%mainly due to the use of 'varagin' or 'variable argument input' which 
% takes all input arguments from that point and stores them in an array.


%Initiallizing variable
player_input = 0;
while ~(player_input >= 1 && player_input <= (nargin-3))
    %Loops until the player input(defined later) is equal to the nargin or 
    %number (of) argument inputs minus 3, basically from 1 to number of
    %choices. 
clc
fprintf('\n')
txtrapper2(text)


switch (nargin-3)
    %Swtich statement prints the number of choice based on how many input
    %arguments(again basically from 1 to the number choices input)
    case 1
        txtrapper2(string(varargin(1)))
        fprintf('\nPress choice as: 1\n\n')
        player_input = str2double(getKeyboardInput(game_obj));
            %[True for all following case statements] getKeyboardInput
            %gives a string of the keypressed that converted into double
            %for the output of this function.
    case 2
        txtrapper2(string(varargin(1)))
        txtrapper2(string(varargin(2)))
        fprintf('\nPress choice as: 1 or 2\n\n')
        player_input = str2double(getKeyboardInput(game_obj));
    case 3
        txtrapper2(string(varargin(1)))
        txtrapper2(string(varargin(2)))
        txtrapper2(string(varargin(3)))
        fprintf('\nPress choice as: 1, 2, or 3\n\n')
        player_input = str2double(getKeyboardInput(game_obj));
    case 4
        txtrapper2(string(varargin(1)))
        txtrapper2(string(varargin(2)))
        txtrapper2(string(varargin(3)))
        txtrapper2(string(varargin(4)))
        fprintf('\nPress choice as: 1, 2, 3, or 4\n\n')
        player_input = str2double(getKeyboardInput(game_obj));
    case 5
        txtrapper2(string(varargin(1)))
        txtrapper2(string(varargin(2)))
        txtrapper2(string(varargin(3)))
        txtrapper2(string(varargin(4)))
        txtrapper2(string(varargin(5)))
        fprintf('\nPress choice as: 1, 2, 3, 4, or 5\n\n')
        player_input = str2double(getKeyboardInput(game_obj));
end
end
%Output
game_update = player_input;
    %outputs the choice made by the user.
    


