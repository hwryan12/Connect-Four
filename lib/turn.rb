class Turn 
    attr_reader :turn 

    def initialize(a, b, c, d, e, f, g) 
        board = Board.new
        @board = board
        humanpieces = Piece.new(:human)
        computerpieces = Piece.new(:computer)
        player= Player.new(:human, humanpieces)
        computer= Player.new(:computer, computerpieces)
        @player = player
        @computer = computer
        # @all_arrays = all_arrays
        @a = a 
        @b = b
        @c = c 
        @d = d 
        @e = e 
        @f = f 
        @g = g 
        @choice = nil
    end 

    def determine_chosen_location
        
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
            require 'pry'; binding.pry
            if @choice == "A" 
            @moda = []
            @a = @a.drop(1)
            @moda = @a << "W"
            @modb = nil
            @modc = nil 
            @modd = nil 
            require 'pry'; binding.pry
            @board.update_board(@board, @moda, @modb, @modc, @modd)
            require 'pry'; binding.pry
            @self.check_winner
            require 'pry'; binding.pry


        end 
            # if userchoice == "B"
            #     @playingboard.row6[1] = "X"
            # elsif userchoice == "C"
            #     @playingboard.row6[2] = "X"
            # elsif userchoice == "D"
            #     @playingboard.row6[3] = "X"
            # elsif userchoice == "E"
            #     @playingboard.row6[4] = "X"
            # elsif userchoice == "F"
            #     @playingboard.row6[5] = "X"
            # elsif userchoice == "G"
            #     @playingboard.row6[6] = "X"
            # end 
        
    end 

        if @computer
            
            machinechoice = ["A", "B", "C", "D", "E", "F", "G"].sample
   
               if machinechoice == "A"
                @playingboard.row6[0] = "O"
               elsif machinechoice == "B"
   
               elsif machinechoice == "C"
   
               elsif machinechoice == "D"
   
               elsif machinechoice == "E"
   
               elsif machinechoice == "F"
   
               elsif machinechoice == "G"
   
               end 
               self.place_token
        end
        
    # end

    # def place_token
    #     self.check_winner
    # end

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
        require 'pry'; binding.pry
    end
    
end 
end


