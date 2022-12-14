require './lib/board.rb'
require 'rspec'

RSpec.describe Board do 
  
  it "exist" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it "the connectfour grid is made up of one hash named board that prints like a Connect 4 grid" do 
    board = Board.new 
    expect(board.board).to eq({"A": [".", ".", ".", ".", ".", "."], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "."], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]
    })

  end 
end