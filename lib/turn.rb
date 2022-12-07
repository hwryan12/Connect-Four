class Turn 
    attr_reader :turn 

    def initialize(player1, computer)
        @turn = turn 
        turn = Turn.new(player1,)
    end 

    def determine_desired_row
        #player1 will be input
        #computer will be random
        self.determine_valid_placement
    end
    
    def determine_valid_placement
        
        self.place_token
    end

    def place_token
        
        self.check_winner
    end

    def check_winner
        if vert

        end
    
        if horz
    
        end
    
        if diag
          
        end
    
        if draw 
    
        end

        if repeat_turn
            self.determine_desired_row
        end
    end
    
#break


end