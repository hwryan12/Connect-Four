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
  if diagonal == true|| vertical == true|| horizontal == true 
     true
  elsif draw == true
    false
  else 
    false
end

def diagonal(diagonal_pieces)
  # Return here. Maybe hardcode all potential diagonal placements
end

def vertical(column)
  column.map do |pieces|
    pieces.join("")
    return true if four_in_a_row(pieces) != nil
  end
end

def horizontal(row)
  row.map do |pieces|
    pieces.join("")
    return true if four_in_a_row(pieces) != nil
  end
end

def draw(a, b, c, d, e, f)
  if @a.empty? == false && @b.empty? == false && @c.empty? == false && @d.empty? == false && @e.empty? == false && f.empty? == false
    return true
    puts "Draw!"
  end
end

def four_in_a_row(pieces)
  if pieces.include?("XXXX")
    puts "Player wins!"
    elsif pieces.include?("OOOO")
    puts "The Computer wins!"
  end
end

        # if repeat_turn
        #     self.determine_desired_row
        # end
        @self.determine_chosen_location
        
    end
    

end


