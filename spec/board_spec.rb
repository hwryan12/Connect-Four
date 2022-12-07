require './lib/board.rb'
require 'RSpec'

RSpec.describe Board do 
  board = Board.new
  it "exist" do
    expect(board).to be_a(Board)
  end

  it "has a header" do
    board = Board.new
    board.board_grid
    expect(board.board_grid).to be(@letters)
  end

  it "can reprint board" do
    boar = Board.new
    
    expect(board.update_board).to eq(@a, @b, @c, @d)
  end
end