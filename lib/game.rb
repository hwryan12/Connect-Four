class Game 
    
def initialize
board = Board.new
end 

def start_game 

    # Instructions: When a user runs the command to start the game, they will see a welcome message, followed by an empty board. The board itself will represent empty spaces with periods and column names with a letter A-G.

    puts "Hello, welcome to Hady and Harrison's game of Connect 4. I hope you enjoy it!"
    puts "Welcome to CONNECT FOUR
    Enter p to play. Enter q to quit"

    user_input_start_of_game = gets.chomp 
    require 'pry'; binding.pry
    if user_input_start_of_game == "p"
        game.begin_play
    elsif user_input_start_of_game == "q"
        puts "Looks like you're all Connect 4'd out for today. See you later!"
    else 
        puts "Please provide a valid response. We won't make you play! Just tell us you don't want to!"
        game.start_game
    end

    # Where to insert the board appearing 


end 
















end