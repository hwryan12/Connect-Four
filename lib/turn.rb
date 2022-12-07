class Turn 
    attr_reader :turn 

    def initialize(board) 
        humanpieces = Piece.new(:human)
        computerpieces = Piece.new(:computer)
        player= Player.new(:human, humanpieces)
        computer= Player.new(:computer, computerpieces)
        @player = player
        @computer = computer
        @board = board
    end 

    def determine_valid_placement

        if @player
             puts "Pick which row you would like to input the next token. Your choices are: 
             A
             B
             C
             D
             E
             F
             G"

            userchoice = gets.chomp 

            if userchoice == "A" 
                require 'pry'; binding.pry
                require 'pry'; binding.pry
        
                require 'pry'; binding.pry
            end 
            if userchoice == "B"
                @playingboard.row6[1] = "X"
            elsif userchoice == "C"
                @playingboard.row6[2] = "X"
            elsif userchoice == "D"
                @playingboard.row6[3] = "X"
            elsif userchoice == "E"
                @playingboard.row6[4] = "X"
            elsif userchoice == "F"
                @playingboard.row6[5] = "X"
            elsif userchoice == "G"
                @playingboard.row6[6] = "X"
            end 
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

        end
        self.place_token
    end
 

    def place_token
        self.check_winner
    end

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
    end
    
#break
end

# turn = Turn.new
# turn

