require './lib/board.rb'
require 'RSpec'

RSpec.describe Board do 
  it "exist" do
   board = Board.new
    expect(board).to be_a(Board)
  end
end