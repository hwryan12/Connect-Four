require './lib/board.rb'
require 'RSpec'

RSpec.describe Board do 
  let(:board) { Board.new }
  it "exist" do
    expect(board).to be_a(Board)
  end

  it "has a grid of A-G, 1-6" do
    board.board_grid
    expect(board.board_grid).to eq([["A", 1], ["A", 2], ["A", 3], ["A", 4], ["A", 5], ["A", 6], ["B", 1], ["B", 2], ["B", 3], ["B", 4], ["B", 5],["B", 6], ["C", 1], ["C", 2], ["C", 3], ["C", 4], ["C", 5], ["C", 6], ["D", 1], ["D", 2], ["D", 3], ["D", 4], ["D", 5], ["D", 6], ["E", 1], ["E", 2], ["E", 3], ["E", 4], ["E", 5], ["E", 6], ["F", 1], ["F", 2], ["F", 3], ["F", 4], ["F", 5], ["F", 6], ["G", 1], ["G", 2], ["G", 3], ["G", 4], ["G", 5], ["G", 6]])
  end
end