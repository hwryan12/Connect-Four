class Board
  attr_accessor :f, 
                :e, 
                :d, 
                :c, 
                :b, 
                :a, 
                :g,
                :letters,
                :acolumn,
                :bcolumn,
                :column,
                :dcolumn,
                :ecolumn,
                :fcolumn

  def initialize 
    
    garray = ["g", "X", "G", "x", "X", "."].reverse
    farray = ["f", "F", ".", ".", ".", "."].reverse
    earray = ["e", "X", ".", "E", ".", "."].reverse
    darray = ["d", ".", ".", "D", ".", "."].reverse
    carray = ["c", "C", "C", "C", "C", "C"].reverse
    barray = ["b", "B", "B", "B", "B", "B"].reverse
    aarray = [".", "A", "A", "A", "A", "A"].reverse
  

    @g = garray
    @f = farray 
    @e = earray
    @d = darray 
    @c = carray 
    @b = barray
    @a = aarray 

# all_arrays = [garray, farray, earray, darray, carray, barray, aarray]
# @all_arrays = all_arrays

# If have time later towards end, clean this up by putting this all into one array and then separating those arrays. 
    # @board = board 
  end

  def board_grid #printed version
    @letters = ["A", "B", "C", "D", "E", "F", "G"]

    @acolumn = [@a[0], @b[0], @c[0], @d[0], @e[0], @f[0], @g[0]]

    @bcolumn =[@a[1], @b[1], @c[1], @d[1], @e[1], @f[1], @g[1]]

    @column = [@a[2], @b[2], @c[2], @d[2], @e[2], @f[2], @g[2]]

    @dcolumn = [@a[3], @b[3], @c[3], @d[3], @e[3], @f[3], @g[3]]

    @ecolumn = [@a[4], @b[4], @c[4], @d[4], @e[4], @f[4], @g[4]]

    @fcolumn = [@a[5], @b[5], @c[5], @d[5], @e[5], @f[5], @g[5]]

    puts letters.join(" ")
    puts acolumn.join(" ")
    puts bcolumn.join(" ")
    puts column.join(" ")
    puts dcolumn.join(" ")
    puts ecolumn.join(" ")
    puts fcolumn.join(" ")

  end



  def update_board(board, moda, modb, modc, modd)
    # moda 
    @a = moda
    @b = modb
    @c = modc
    @d = modd 
    require 'pry'; binding.pry
    
  
  end


end 



# board = Board.new 
# require 'pry'; binding.pry
# board.board_grid
# # board.build_grid
# # require 'pry'; binding.pry
