class Piece 
    attr_reader :owner, 
                :quantity 

def initialize(owner) 
quantity = 21
@quantity = quantity 
@owner = owner

end

piece = Piece.new(:human)
# piece.quantity returns = 21 
# require 'pry'; binding.pry







end 