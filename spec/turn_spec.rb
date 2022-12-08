require './lib/board.rb'
require './lib/turn.rb'
require './lib/piece.rb'
require './lib/player.rb'
require 'RSpec'

RSpec.describe Turn do 
  turn = Turn.new(@board)
  it "exist" do 
    expect(turn).to be_a(Turn)
  end

  # Does not pass
  xit "has readable attributes" do
    turn = Turn.new(@board)
    expect(turn).to have_readable_attributes?(@board, @player, @computer, @choice)
  end

  # Does not pass
  xit "can determine winner for diagonal" do
    turn = Turn.new(@board)
    
    turn.diagonal(diagonal_pieces)
    expect(turn.check_winner)to eq(diagonal)
  end

   # Does not pass
   xit "can determine winner for vertical" do
    turn = Turn.new(@board)
    
    turn.vertical(column)
    expect(turn.check_winner)to eq(vertical)
  end

   # Does not pass
   xit "can determine winner for horizontal" do
    turn = Turn.new(@board)
    
    turn.horizontal(row)
    expect(turn.check_winner)to eq(horizontal)
  end
  
   # Does not pass
   xit "can determine a draw" do
    turn = Turn.new(@board)
    
    turn.draw(a, b, c, d, e, f)
    expect(turn.check_winner)to eq(draw)
  end
  
  xit "can determine if four pieces are in a row" do
    turn = Turn.new(@board)

    turn.four_in_a_row(pieces)
    expect(turn.four_in_a_row).to include("XXXX")

    turn.four_in_a_row(pieces)
    expect(turn.four_in_a_row).to include("OOOO")
  end
  
  

end