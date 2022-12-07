class Player 

  attr_reader :name, :pieces

  def initialize(name, pieces)
    @name = name 
    @pieces = 21
    @has_won = false
  end 
end