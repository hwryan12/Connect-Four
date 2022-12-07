class Turn 
    attr_reader :turn 

    def initialize 
        humanpieces = Piece.new(:human)
        computerpieces = Piece.new(:computer)
        player= Player.new(:human, humanpieces)
        computer= Player.new(:computer, computerpieces)
        @player = player
        @computer = computer
        playingboard = Board.new
        @playingboard = playingboard
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

achoices = [@playingboard.row6[0], @playingboard.row5[0], @playingboard.row4[0], @playingboard.row3[0], @playingboard.row2[0], @playingboard.row1[0]]
bchoices= [@playingboard.row6[1], @playingboard.row5[1], @playingboard.row4[1], @playingboard.row3[1], @playingboard.row2[1], @playingboard.row1[1]]
cchoices= [@playingboard.row6[2], @playingboard.row5[2], @playingboard.row4[2], @playingboard.row3[2], @playingboard.row2[2], @playingboard.row1[2]]
dchoices= [@playingboard.row6[3], @playingboard.row5[3], @playingboard.row4[3], @playingboard.row3[3], @playingboard.row2[3], @playingboard.row1[3]]
echoices= [@playingboard.row6[4], @playingboard.row5[4], @playingboard.row4[4], @playingboard.row3[4], @playingboard.row2[4], @playingboard.row1[4]]
fchoices= [@playingboard.row6[5], @playingboard.row5[5], @playingboard.row4[5], @playingboard.row3[5], @playingboard.row2[5], @playingboard.row1[5]]
choices= [@playingboard.row6[6], @playingboard.row5[6], @playingboard.row4[6], @playingboard.row3[6], @playingboard.row2[6], @playingboard.row1[6]]

            if userchoice == "A" 
                achoices[0] = "X"
                require 'pry'; binding.pry
                achoices = achoices.shift 
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

