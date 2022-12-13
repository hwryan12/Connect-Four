class Game
    attr_accessor :victor, :computer, :player, :board
    def initialize
        @board = Board.new
        @humanpieces = Piece.new(:human)
        @computerpieces = Piece.new(:computer)
        @player = Player.new(:human, @humanpieces)
        @computer = Player.new(:computer, @computerpieces)
        @victor = nil
    end 
    
    def start_game 
        welcome_message
        user_input_start_of_game = gets.chomp 
        if user_input_start_of_game == "p"
            @board.board_grid
            self.begin_play
        elsif user_input_start_of_game == "q"
            puts "Looks like you're all Connect 4'd out for today. See you later!"
            abort 
        else 
            invalid_response
            self.start_game
        end
    end 
    
    def welcome_message
        puts "#{"=" * 77}" 
        puts "Hello, welcome to Hady and Harrison's game of Connect 4. I hope you enjoy it! 
        Enter p to play. Enter q to quit"
        puts "#{"=" * 77}" 
    end 
    
    def invalid_response
        puts "Please provide a valid response. We won't make you play! Just tell us you don't want to!"
    end 
    
    def begin_play
        @new_turn = Turn.new(@board, @player, @computer)
        play_turn 
    end 
    
    def play_turn
        @new_turn.human_turn 
        check_winner_helper
        @new_turn.computer_turn 
        check_winner_helper
        play_turn
    end
    
    def check_winner_helper
        check_winner
        if @victor != nil 
            new_game
        end
    end
    
    def check_winner
        draw
        vertical_win
        horizontal_win
        diagonal_win
        if @victor != nil
            print_winner(@victor)
        end
    end 
    
    def print_winner(victor)
        if victor == "draw"
            draw_message
        elsif victor == @computer
            computer_victor_message
        elsif victor == @player
            human_victor_message
        end 
    end
    
    def human_victor_message
        puts "You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back." 
        "You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back." 
    end 
    
    def computer_victor_message
        puts "The Computer Connected 4-- don't worry, you could one day design a program where you always win!" 
        "The Computer Connected 4-- don't worry, you could one day design a program where you always win!"
        
    end 
    
    def draw_message 
        puts "This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something."
        "This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something."
    end 
    
    def vertical_win
        @all_arrays = [@board.board[:A], @board.board[:B], @board.board[:C], @board.board[:D], 
                        @board.board[:E], @board.board[:F], @board.board[:G]]
            @all_arrays.each do |array|
                vert_array = array.join("")
                if vert_array.include?("XXXX")
                    puts "Connected 4 Vertically!"
                    puts "Player Wins!"
                    @victor = @player
                elsif vert_array.include?("OOOO")
                    puts "Connected 4 Vertically!"
                    puts "The Computer Wins!"
                    @victor = @computer
            end
        end
    end
    
    def horizontal_win
        horizontal_arrays = [@board.board[:A], @board.board[:B], @board.board[:C], @board.board[:D], 
                            @board.board[:E], @board.board[:F], @board.board[:G]]
        horizontal_arrays.transpose.each do |array|
            horiz_array_to_check = array.join("")
            if horiz_array_to_check.include?("XXXX")
                puts "Connected 4 Horizontally!"
                puts "Player Wins!"
                @victor = @player
            elsif horiz_array_to_check.include?("OOOO")
                puts "Connected 4 Horizontally!"
                puts "The Computer Wins!"
                @victor = @computer
            end
        end
    end
    
    def diagonal_win
        diag_array = []
        diag_array << [@board.board[:A][2], @board.board[:B][3], @board.board[:C][4], @board.board[:D][5]]
        diag_array << [@board.board[:A][1], @board.board[:B][2], @board.board[:C][3], @board.board[:D][4]]
        diag_array << [@board.board[:B][2], @board.board[:C][3], @board.board[:D][4], @board.board[:E][5]]
        diag_array << [@board.board[:A][0], @board.board[:B][1], @board.board[:C][2], @board.board[:D][3]]
        diag_array << [@board.board[:B][1], @board.board[:C][2], @board.board[:D][3], @board.board[:E][4]]
        diag_array << [@board.board[:C][2], @board.board[:D][3], @board.board[:E][4], @board.board[:F][5]]
        diag_array << [@board.board[:B][0], @board.board[:C][1], @board.board[:D][2], @board.board[:E][3]]
        diag_array << [@board.board[:C][1], @board.board[:D][2], @board.board[:E][3], @board.board[:F][4]]
        diag_array << [@board.board[:D][2], @board.board[:E][3], @board.board[:F][4], @board.board[:G][5]]
        diag_array << [@board.board[:C][0], @board.board[:D][1], @board.board[:E][2], @board.board[:F][3]]
        diag_array << [@board.board[:D][1], @board.board[:E][2], @board.board[:F][3], @board.board[:G][4]]
        diag_array << [@board.board[:D][0], @board.board[:E][1], @board.board[:F][2], @board.board[:G][3]]
        diag_array << [@board.board[:G][2], @board.board[:F][3], @board.board[:E][4], @board.board[:D][5]]
        diag_array << [@board.board[:G][1], @board.board[:F][2], @board.board[:E][3], @board.board[:D][4]]
        diag_array << [@board.board[:F][2], @board.board[:E][3], @board.board[:D][4], @board.board[:C][5]]
        diag_array << [@board.board[:G][0], @board.board[:F][1], @board.board[:E][2], @board.board[:D][3]]
        diag_array << [@board.board[:F][1], @board.board[:E][2], @board.board[:D][3], @board.board[:C][4]]
        diag_array << [@board.board[:E][2], @board.board[:D][0], @board.board[:C][4], @board.board[:B][5]]
        diag_array << [@board.board[:F][0], @board.board[:E][1], @board.board[:D][2], @board.board[:C][3]]
        diag_array << [@board.board[:E][1], @board.board[:D][2], @board.board[:C][3], @board.board[:B][4]]
        diag_array << [@board.board[:D][2], @board.board[:C][3], @board.board[:B][4], @board.board[:A][5]]
        diag_array << [@board.board[:E][1], @board.board[:D][1], @board.board[:C][2], @board.board[:B][3]]
        diag_array << [@board.board[:D][1], @board.board[:C][2], @board.board[:B][3], @board.board[:A][4]]
        diag_array << [@board.board[:D][0], @board.board[:C][1], @board.board[:B][2], @board.board[:A][3]]
        diag_array.each do |array|
            diag_array_to_check = array.join("")
            if diag_array_to_check.include?("XXXX")
                puts "Connected 4 Diagonally!"
                puts "Player Wins!"
                @victor = @player
            elsif diag_array_to_check.include?("OOOO")
                puts "Connected 4 Diagonally!"
                puts "The Computer Wins!"
                @victor = @computer
            end
        end
    end 
    
    def draw  
        if @player.pieces == 0 && @computer.pieces == 0
            puts "Draw! There's no more pieces."
            puts "You can try again!"
            @victor = "draw"
        end
    end
    
    def new_game 
        new_game = Game.new
        new_game.start_game
    end
end
