require './lib/board.rb'
require 'rspec'

RSpec.describe Board do 
  
  it "exist" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it "the connectfour grid is made up of several arrays" do 
    board = Board.new 

    expect(board.a).to eq([".", ".", ".", ".", ".", "."])
    expect(board.b).to eq([".", ".", ".", ".", ".", "."])
    expect(board.c).to eq([".", ".", ".", ".", ".", "."])
    expect(board.d).to eq([".", ".", ".", ".", ".", "."])
    expect(board.e).to eq([".", ".", ".", ".", ".", "."])
    expect(board.f).to eq([".", ".", ".", ".", ".", "."])
    expect(board.g).to eq([".", ".", ".", ".", ".", "."])
  end 

end