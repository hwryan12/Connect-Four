require './lib/board'
require './lib/piece'
require 'rspec'

RSpec.describe Piece do 
  it "the pieces exist" do
    humanpieces = Piece.new(:human)
    computerpieces = Piece.new(:computer)
    
    expect(humanpieces).to be_an_instance_of(Piece)
    expect(computerpieces).to be_an_instance_of(Piece)
    
  end

  it "they have an owner" do 

    humanpieces = Piece.new(:human)
    computerpieces = Piece.new(:computer)

    expect(humanpieces.owner).to eq(:human)
    expect(computerpieces.owner).to eq(:computer)

  end 
end