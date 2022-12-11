require './lib/board'
require './lib/piece'
require './lib/player'
require 'rspec'

RSpec.describe Piece do 
  it "there is a player" do

    humanpieces = Piece.new(:human)
    player= Player.new(:human, humanpieces)
    
    expect(player).to be_an_instance_of(Player)
    
  end

  it "the human player has a type" do 
    humanpieces = Piece.new(:human)
    player= Player.new(:human, humanpieces)

    expect(player.type).to eq(:human)
  end

  it "the computer player has their own type" do 
    computerpieces = Piece.new(:computer)
    computer= Player.new(:computer, computerpieces)

    expect(computer.type).to eq(:computer)
  end

  it "each participant starts with 21 pieces" do 
    humanpieces = Piece.new(:human)
    player= Player.new(:human, humanpieces)
    computerpieces = Piece.new(:computer)
    computer= Player.new(:computer, computerpieces)

    expect(player.pieces).to eq(21)
    expect(computer.pieces).to eq(21)
  end

end 