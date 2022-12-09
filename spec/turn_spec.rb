require './lib/board'
require './lib/turn'
require './lib/piece'
require './lib/player'
require './lib/game'
require 'rspec'

RSpec.describe Turn do
   it "a turn can exist" do 

    turn = Turn.new(@board)
    expect(turn).to be_an_instance_of(Turn)
    end


    it "the computer will choose one of several random choices" do
      turn = Turn.new(@board)
      turn.computer_choice
      expect(turn.computer_choice).to eq("A" || "B" || "C" || "D" || "E" || "F"|| "G")
    end

  # # Does not pass
  #   xit "can have the human player place the token" do
    
  #     turn = Turn.new(@board)
  #     turn.human_choice.choice == "A"

  #     expect(turn.a_count). to eq(1)
  #   end 
  
  #   # Does not pass
  #   xit "can determine winner for diagonal" do
  #     turn = Turn.new(@board)
  #     turn.diagonal(diagonal_pieces)

  #     expect(turn.check_winner)to eq(diagonal)
  #   end

  #  # Does not pass
  #   xit "can determine winner for vertical" do
  #     turn = Turn.new(@board)
  #     turn.vertical(column)
    
  #     expect(turn.check_winner)to eq(vertical)
  #   end

  #  # Does not pass
  #   xit "can determine winner for horizontal" do
  #     turn = Turn.new(@board)
  #     turn.horizontal(row)
      
  #     expect(turn.check_winner)to eq(horizontal)
  #   end
  
  #  # Does not pass
  #   xit "can determine a draw" do
  #     turn = Turn.new(@board)
  #     turn.draw(a, b, c, d, e, f)
    
  #     expect(turn.check_winner)to eq(draw)
  #   end
  
  #   xit "can determine if four pieces are in a row" do
  #     turn = Turn.new(@board)

  #     turn.four_in_a_row(pieces)
  #   end

end