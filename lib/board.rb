class Board
  attr_reader :g, :f, :e, :d, :c, :b, :a

def initialize 
    garray = ["x", "X", "X", "x", "X", ".", "."]
    farray = ["O", ".", ".", ".", ".", ".", "."] 
    earray = [".", "X", ".", ".", ".", ".", "."]
    darray = [".", ".", ".", ".", ".", ".", "."]
    carray = [".", ".", ".", ".", ".", ".", "."]
    barray = [".", ".", ".", ".", ".", ".", "."]
    aarray = [".", ".", ".", ".", ".", ".", "."]
  

@g = garray
@f = farray 
@e = earray
@d = darray 
@c = carray 
@b = barray
@a = aarray 

# If have time later towards end, clean this up by putting this all into one array and then separating those arrays. 
end

def board_grid
  letters = ["A", "B", "C", "D", "E", "F", "G"]

acolumn = [@a[0], @b[0], @c[0], @d[0], @e[0], @e[0], @g[0]]

bcolumn =[@a[1], @b[1], @c[1], @d[1], @e[1], @e[1], @g[1]]

column = [@a[2], @b[2], @c[2], @d[2], @e[2], @e[2], @g[2]]

dcolumn = [@a[3], @b[3], @c[3], @d[3], @e[3], @e[3], @g[3]]

ecolumn = [@a[4], @b[4], @c[4], @d[4], @e[4], @e[4], @g[4]]

fcolumn = [@a[5], @b[5], @c[5], @d[5], @e[5], @e[5], @g[5]]

gcolumn = [@a[6], @b[6], @c[6], @d[6], @e[6], @e[6], @g[6]]

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

  Turn.new(@a, @b, @c, @d, @e, @f, @g).determine_chosen_location
  end 

end 

# board = Board.new 
# require 'pry'; binding.pry
# board.board_grid
# # board.build_grid
# # require 'pry'; binding.pry
