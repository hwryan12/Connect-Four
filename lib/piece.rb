class Piece 
    attr_reader :owner,
                :location

def initialize(owner) 
@owner = owner
end

def output
    if @owner == :human
    puts "X"
    elsif @owner == :computer
    puts "O"
    end 
    require 'pry'; binding.pry
end

end 

piece =Piece.new(:human)
piece.output

# if owner is human --> X
# if owner is computer --> Y 