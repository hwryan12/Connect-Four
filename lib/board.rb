class Board
  attr_accessor :f, 
                :e, 
                :d, 
                :c, 
                :b, 
                :a, 
                :g

  def initialize 
    # all_arrays 
    garray = [".", ".", ".", ".", ".", "."]
    farray = [".", ".", ".", ".", ".", "."]
    earray = [".", ".", ".", ".", ".", "."]
    darray = [".", ".", ".", ".", ".", "."]
    carray = [".", ".", ".", ".", ".", "."]
    barray = [".", ".", ".", ".", ".", "."]
    aarray = [".", ".", ".", ".", ".", "."]

    @g = garray
    @f = farray 
    @e = earray
    @d = darray 
    @c = carray 
    @b = barray
    @a = aarray 

  end

  def board_grid #printed version

    letters = ["A", "B", "C", "D", "E", "F", "G"]
    puts letters.join(' ')
    puts [a[5], b[5], c[5], d[5], e[5], f[5], g[5]].join(' ') 
    puts [a[4], b[4], c[4], d[4], e[4], f[4], g[4]].join(' ') 
    puts [a[3], b[3], c[3], d[3], e[3], f[3], g[3]].join(' ') 
    puts [a[2], b[2], c[2], d[2], e[2], f[2], g[2]].join(' ') 
    puts [a[1], b[1], c[1], d[1], e[1], f[1], g[1]].join(' ') 
    puts [a[0], b[0], c[0], d[0], e[0], f[0], g[0]].join(' ') 
    

  end


end 



# board = Board.new 
# require 'pry'; binding.pry
# board.board_grid
# # board.build_grid
# # require 'pry'; binding.pry
