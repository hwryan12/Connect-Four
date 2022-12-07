class Game 
    attr_reader :board, :game

def initialize
board = Board.new
@board = board 
end 

def start_game 

    # Instructions: When a user runs the command to start the game, they will see a welcome message, followed by an empty board. The board itself will represent empty spaces with periods and column names with a letter A-G.

    puts "Hello, welcome to Hady and Harrison's game of Connect 4. I hope you enjoy it!"
    puts "Welcome to CONNECT FOUR
    Enter p to play. Enter q to quit"

    user_input_start_of_game = gets.chomp 
    
    if user_input_start_of_game == "p"
        @board.board_grid
        self.begin_play
        
    elsif user_input_start_of_game == "q"
        puts "Looks like you're all Connect 4'd out for today. See you later!"
    else 
        puts "Please provide a valid response. We won't make you play! Just tell us you don't want to!"
        self.start_game
    end

end 

def begin_play

Turn.new.determine_valid_placement
end 














end