class Turn 
    attr_reader :turn,  
                :board, 
                :computer, 
                :player
    attr_accessor :hash_counter

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

    def new_game 
        new_game = Game.new
        new_game.start_game
    end
end 