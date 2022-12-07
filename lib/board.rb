class Board
  attr_reader :board

def initialize
  board = { #A   B .   C   D .   E .  F .  G
    "G" => [".", "X", "X", ".", "X", ".", "."],
    "F" => ["O", ".", ".", ".", ".", ".", "."], 
    "E" => [".", "X", ".", ".", ".", ".", "."],
    "D" => [".", ".", ".", ".", ".", ".", "."],
    "C" => [".", ".", ".", ".", ".", ".", "."],
    "B" => [".", ".", ".", ".", ".", ".", "."],
    "A" => [".", ".", ".", ".", ".", ".", "."]
  }
@board = board
end





# MODIFICATIONS 






def board_grid
  letters = ["A", "B", "C", "D", "E", "F", "G"]
acolumn = [@board["G"][0], @board["F"][0], @board["E"][0], @board["D"][0], @board["C"][0], @board["B"][0], @board["A"][0]]
bcolumn =[@board["G"][1], @board["F"][1], @board["E"][1], @board["D"][1], @board["C"][1], @board["B"][1], @board["A"][1]]
column = [@board["G"][2], @board["F"][2], @board["E"][2], @board["D"][2], @board["C"][2], @board["B"][2], @board["A"][2]]
dcolumn = [@board["G"][3], @board["F"][3], @board["E"][3], @board["D"][3], @board["C"][3], @board["B"][3], @board["A"][3]]
ecolumn = [@board["G"][4], @board["F"][4], @board["E"][4], @board["D"][4], @board["C"][4], @board["B"][4], @board["A"][4]]
fcolumn = [@board["G"][5], @board["F"][5], @board["E"][5], @board["D"][5], @board["C"][5], @board["B"][5], @board["A"][5]]
gcolumn = [@board["G"][6], @board["F"][6], @board["E"][6], @board["D"][6], @board["C"][6], @board["B"][6], @board["A"][6]]

puts letters.join(" ")
puts acolumn.join(" ")
puts bcolumn.join(" ")
puts column.join(" ")
puts dcolumn.join(" ")
puts ecolumn.join(" ")
puts fcolumn.join(" ")
puts gcolumn.join(" ")

end

def begin_play

  Turn.new(@board).determine_valid_placement
  end 

end 

# board = Board.new 
# require 'pry'; binding.pry
# board.board_grid
# # board.build_grid
# # require 'pry'; binding.pry
