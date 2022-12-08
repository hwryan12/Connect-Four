class Turn 
    attr_reader :turn 

    def initialize(board)
        # Mr. Ruby creates a local variable called @board that imports all of the data from game.rb 
        @board = board
        humanpieces = Piece.new(:human)
        computerpieces = Piece.new(:computer)
        player= Player.new(:human, humanpieces)
        computer= Player.new(:computer, computerpieces)
        @player = player
        @computer = computer
        @choice = nil
    end 

    def play_turn 
        require 'pry'; binding.pry
        self.determine_chosen_location
    end 

    def determine_chosen_location
        require 'pry'; binding.pry
        if @player
            puts "Pick which row you would like to input the next token. Your choices are: 
            A
            B
            C
            D
            E
            F
            G"
           choice = gets.chomp

        elsif @computer
            choice = ["A", "B", "C", "D", "E", "F", "G"].sample
    end
    @choice = choice 
    self.determine_valid_placement
    end 

    def determine_valid_placement

        if @player
            if @choice == "A"
                @board.a.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                    require 'pry'; binding.pry
                 else puts "Invalid placement- you cannot place your chip here. Please choose again."
                      self.determine_chosen_location
                 end
                end 

            elsif @choice == "B"
                @board.b.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                 end
                end 
            
            elsif @choice == "C"
                @board.c.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                 end
                end 

            elsif @choice == "D"
                @board.d.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                 end
                end 

            elsif @choice == "E"
                @board.e.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                 end
                end 

            elsif @choice == "F"
                @board.f.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                 end
                end 

            elsif @choice == "G"
                @board.g.find do |letter|
                 if letter.include?(".")
                    letter.replace("X")
                 end
                end 
            end #end for @choice = A

        elsif @computer 
            if @choice == "A"
                @board.a.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 

            elsif @choice == "B"
                @board.b.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 
            
            elsif @choice == "C"
                @board.c.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 

            elsif @choice == "D"
                @board.d.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 

            elsif @choice == "E"
                @board.e.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 

            elsif @choice == "F"
                @board.f.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 

            elsif @choice == "G"
                @board.g.find do |letter|
                 if letter.include?(".")
                    letter.replace("O")
                 end
                end 
            end #end for computer choice 
            require 'pry'; binding.pry
            self.determine_chosen_location
    end 
end #end for method
                

# at the end of this term self.check_winner

    def check_winner
        # if vert

        # end
    
        # if horz
    
        # end
    
        # if diag
          
        # end
    
        # if draw 
    
        # end

        # if repeat_turn
        #     self.determine_desired_row
        # end
        @self.determine_chosen_location
        
    end
    

end


