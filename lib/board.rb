
# class Board
#   def initialize
#     @letters = ["A", "B", "C", "D", "E", "F", "G"]
#     @numbers = [1..6]
#   end

#   def set_board
#     @board_grid = {}
#     @letters.each do |let|
#       @numbers.each do|num|
#         require "pry"; binding.pry
#         @board_grid["#{let}#{num}"].to_s = "."
#       end
#     end
#   end
# end


class Board
  def initialize
    @letters = ["A", "B", "C", "D", "E", "F", "G"]
    @numbers = [1..6]
  end

  def set_board
    @board_grid = {}
    @letters.each do |let|
      @numbers.each do|num|
       @board_grid << let
       @board_grid << num
require "pry"; binding.pry
       @board_grid.flatten!
      end
    end
  end
end