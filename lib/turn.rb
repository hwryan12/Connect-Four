class Turn 
    attr_reader :turn 

    def initialize(board)
        # Mr. Ruby creates a local variable called @board that imports all of the data from game.rb when I played it in @turn.play_turn(initialized it as turn = Turn.new(board))
        @board = board
        humanpieces = Piece.new(:human)
        computerpieces = Piece.new(:computer)
        player= Player.new(:human, humanpieces)
        computer= Player.new(:computer, computerpieces)
        @player = player
        @computer = computer
        @choice = nil
        @a_count = 0
        @b_count = 0
        @c_count = 0
        @d_count = 0
        @e_count = 0
        @f_count = 0
        @g_count = 0
    end 

    def play_turn 
        self.human_choice
        self.check_winner
        self.computer_choice
        self.check_winner
        self.play_turn
    end 

    def human_choice
            puts "Pick which row you would like to input the next token. Your choices are: 
            A
            B
            C
            D
            E
            F
            G"
            
           choice = gets.chomp

        if choice == "A"
                 if @a_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.a.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @a_count += 1 
                end     
                end
                end 
            
        elsif choice == "B"
                if @b_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.b.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @b_count += 1 
                end     
                end
                end 
        
        elsif choice == "C"
            if @c_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.c.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @c_count += 1 
                end     
                end
                end 

        elsif choice == "D"
            if @d_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.d.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @d_count += 1 
                end     
                end
                end 

        elsif choice == "E"
            if @e_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.e.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @e_count += 1 
                end     
                end
                end 

        elsif choice == "F"
            if @f_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.f.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @f_count += 1 
                end     
                end
                end 

        elsif choice == "G"
            if @g_count >= 6 
                puts "This row is filled up. Try another!"

                    self.human_choice
                else @board.g.find do |letter|
                    if letter == (".")
                    letter.replace("X")
                    @g_count += 1 
                end     
                end
                end 
        elsif choice == "Exit"
            game.start_game
        else puts "Your choice is not valid. Please pick again. If you want to exit the game please type Exit" 
            self.human_choice
        end #end for @choice = A

    @player.pieces -= 1 
    @board.board_grid
    end 

    def computer_choice       
            choice = ["A", "B", "C", "D", "E", "F", "G"].sample

        if choice == "A"
            if @a_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.a.find do |letter|
               if letter == (".")
               letter.replace("O")
               @a_count += 1 
           end     
           end
           end 
       
   elsif choice == "B"
           if @b_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.b.find do |letter|
               if letter == (".")
               letter.replace("O")
               @b_count += 1 
           end     
           end
           end 
   
   elsif choice == "C"
       if @c_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.c.find do |letter|
               if letter == (".")
               letter.replace("O")
               @c_count += 1 
           end     
           end
           end 

   elsif choice == "D"
       if @d_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.d.find do |letter|
               if letter == (".")
               letter.replace("O")
               @d_count += 1 
           end     
           end
           end 

   elsif choice == "E"
       if @e_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.e.find do |letter|
               if letter == (".")
               letter.replace("O")
               @e_count += 1 
           end     
           end
           end 

   elsif choice == "F"
       if @f_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.f.find do |letter|
               if letter == (".")
               letter.replace("O")
               @f_count += 1 
           end     
           end
           end 

   elsif choice == "G"
       if @g_count >= 6 
           puts "This row is filled up. Try another!"
               self.computer_choice
           else @board.g.find do |letter|
               if letter == (".")
               letter.replace("O")
               @g_count += 1 
           end     
           end
           end 
   elsif choice == "Exit"
       game.start_game
   else puts "Your choice is not valid. Please pick again. If you want to exit the game please type Exit" 
       self.computer_choice
   end #end for @choice = A

@computer.pieces -= 1 
@board.board_grid
end 
 #end for method

def check_winner 
    puts "winner checked"
end

end 
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
  if player.pieces == 0 && computer.pieces == 0
    puts "Draw!"
    break
  end
end

def four_in_a_row(pieces)
  if pieces.include?("XXXX")
    puts "Player wins!"
    elsif pieces.include?("OOOO")
    puts "The Computer wins!"
  end
end
    end
    




