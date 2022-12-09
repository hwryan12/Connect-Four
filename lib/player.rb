class Player 

  attr_accessor :name, :pieces, :type 

  def initialize(type, pieces)
    @type = type 
    @pieces = 21
  end 
end