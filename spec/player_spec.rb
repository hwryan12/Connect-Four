require './lib/board'
require './lib/piece'
require './lib/player'
require 'rspec'

RSpec.describe Piece do 
  let(:humanpieces) {Piece.new(:human)}
  let(:player) {Player.new(:human, humanpieces)}
  let(:computerpieces) {Piece.new(:computer)}
  let(:computer) {Player.new(:computer, computerpieces)}
  it "there is a player" do 
    
    expect(player).to be_an_instance_of(Player)
  end

  it "the human player has a type" do 
    
    expect(player.type).to eq(:human)
  end

  it "the computer player has their own type" do 

    expect(computer.type).to eq(:computer)
  end

  it "each participant starts with 21 pieces" do 
  
    expect(player.pieces).to eq(21)
    expect(computer.pieces).to eq(21)
  end
end 