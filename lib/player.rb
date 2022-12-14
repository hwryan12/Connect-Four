class Player 

  attr_accessor :name, 
                :pieces, 
                :type 

  def initialize(type, pieces)
    @type = type 
    @pieces = 21
  end 

  def remove_token_from_list
    @pieces -= 1
  end
end