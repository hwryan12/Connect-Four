class Board
  attr_accessor :board

  def initialize 
    @board = {"A": [".", ".", ".", ".", ".", "."], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "."], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]
    }
  end

  def board_grid
    rows =[]
    rows2 =[]
    i = 0

    puts "A B C D E F G "
    6.times do 
      @board.each do |key, value|
        rows << value[i]
      end
      i += 1
      rows2 << rows
      rows = []
    end 
      rows2.each do |element|
      puts element.join(" ")
    end
  end  

end 