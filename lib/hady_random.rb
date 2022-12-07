class Board
  attr_reader :board

def initialize
board = {
  "A" => [".", ".", ".", ".", ".", ".", "."],
  "B" => [".", ".", ".", ".", ".", ".", "."], 
  "C" => [".", ".", ".", ".", ".", ".", "."],
  "D" => [".", ".", ".", ".", ".", ".", "."],
  "E" => [".", ".", ".", ".", ".", ".", "."],
  "F" => [".", ".", ".", ".", ".", ".", "."],
  "G" => [".", ".", ".", ".", ".", ".", "."]
}
@board = board
end 



# # MODIFICATIONS 






def board_grid

letters = ["A", "B", "C", "D", "E", "F", "G"]
puts letters.join(" ")
puts @board["A"].join(" ")
puts @board["B"].join(" ")
puts @board["C"].join(" ")
puts @board["D"].join(" ")
puts @board["E"].join(" ")
puts @board["F"].join(" ")
puts @board["G"].join(" ")
 
end

end 

board = Board.new

board.board_grid
require 'pry'; binding.pry

