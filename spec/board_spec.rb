require './lib/board.rb'
require 'rspec'

RSpec.describe Board do 
  
  it "exist" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it "the connectfour grid is made up of one hash named board that prints like a Connect 4 grid" do 
    board = Board.new 
    expect(board.board_grid).to eq("A": ["A", "A1", "A", "A", "A", "A"], 
      "B": ["B", "B1", "B", "B", "B", "B"],  
      "C": ["C", "C1", "C", "C", "C", "C"],
      "D": ["D", "D1", "D", "D", "D", "D"], 
      "E": ["E", "E1", "E", "e", "E", "E"], 
      "F": ["F", "F1", "F", "F", "F", "F"],
      "G": ["G", "G1", "G", "G", "G", "G"])

  end 

end