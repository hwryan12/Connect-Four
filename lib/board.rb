class Board
  attr_reader :row1, :row2, :row3, :row4, :row5, :row6

def initialize
  @letters = ["A", "B", "C", "D", "E", "F", "G"]
  @row1 = [".", ".", ".", ".", ".", ".", "."]
  @row2 = [".", ".", ".", ".", ".", ".", "."]
  @row3 = [".", ".", ".", ".", ".", ".", "."]
  @row4 = [".", ".", ".", ".", ".", ".", "."]
  @row5 = [".", ".", ".", ".", ".", ".", "."]
  @row6 = [".", ".", ".", ".", ".", ".", "."]

end





# MODIFICATIONS 






def board_grid
puts @letters.join(" ")
puts @row1.join(" ")
puts @row2.join(" ")
puts @row3.join(" ")
puts @row4.join(" ")
puts @row5.join(" ")
puts @row6.join(" ")
 
end

end 


# board.board_grid
# board.build_grid
# require 'pry'; binding.pry
