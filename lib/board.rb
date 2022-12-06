
class Board
  def initialize
    @letters = ["A", "B", "C", "D", "E", "F", "G"]
    @numbers = [1, 2, 3, 4, 5, 6]
  end

  def board_grid
    @letters.product(@numbers)
  end
end
