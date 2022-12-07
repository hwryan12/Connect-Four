class Player 

  attr_reader :name, :pieces

  def initialize(type, pieces)
    @type = type 
    @pieces = 21
    @has_won = false
  end 
end