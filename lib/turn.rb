class Turn 
    attr_reader :turn,  
                :board, 
                :computer, 
                :player,
                :victor,
                :choice
    attr_accessor :hash_counter, :choice

    def initialize(board)
        @board = board
        @humanpieces = Piece.new(:human)
        @computerpieces = Piece.new(:computer)
        @player = Player.new(:human, @humanpieces)
        @computer = Player.new(:computer, @computerpieces)
        @choice = nil
        @victor == nil 
        @hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    end 

    def play_turn #Big Helper Method- runs the game 
       
        choose_column(:human)
        choice = @choice

        if column_valid(choice) == true 
            place_token(choice, :human)
            puts "HUMAN TURN Below"
            @board.board_grid

        else puts "Not Valid. Pick another column."
            choose_column(:human)
        end

        self.check_winner
        
        if @victor != nil 
            self.new_game
        end

        
        choose_column(:computer)
        choice = @choice

        if column_valid(choice) == true 
            place_token(choice, :computer)
            puts "COMPUTER TURN Below"
            @board.board_grid

        else choose_column(:computer)
        end

        self.check_winner
        if @victor != nil 
            self.new_game
    
        end

        self.play_turn
    end 

    def choose_column(type)
        if type == :human
            puts "Pick which row you would like to input the next token. Your choices are: 
                A
                B
                C
                D
                E
                F
                G"
                @choice = gets.chomp
        elsif type == :computer
                @choice = ["A", "B", "C", "D", "E", "F", "G"].sample
        end
    end 

    def column_valid(choice)
        i = choice 
        if @hash_counter[i] < 6 
            true
        else false 
        end 
    end

    def place_token(choice, human_or_computer)
        i = choice.to_sym
        @board.board[i].reverse.find do |letter|
            if letter == (".") && human_or_computer == :human
                letter.replace("X")
            elsif letter == (".") && human_or_computer == :computer
                letter.replace("O")
            end 
        end
        @hash_counter[choice] += 1
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

    def draw  
        if @player.pieces == 0 && @computer.pieces == 0
            puts "Draw! There's no more pieces."
            puts "You can try again!"
            @victor = "draw"
        end
    end

    def print_winner(victor)
        if victor == "draw"
            puts "This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something." 
            "This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something."
        elsif victor == @computer
            puts "The Computer Connected 4-- don't worry, you could one day design a program where you always win!" 
            "The Computer Connected 4-- don't worry, you could one day design a program where you always win!"
        elsif victor == @player
            puts "You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back." 
            "You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back."
        end 
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
        # require 'matrix'
        # all_array = [@board.board[:A], @board.board[:B], @board.board[:C], @board.board[:D], 
        # @board.board[:E], @board.board[:F], @board.board[:G]]
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
        # diag_array = Matrix[all_array]
        # require "pry"; binding.pry
        # diag_array.to_a.map(&:inspect)
            diag_array.each do |array|
            diag_array_to_check = array.join("")
        # require "pry"; binding.pry
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