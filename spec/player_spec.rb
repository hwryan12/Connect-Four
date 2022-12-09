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

  it "the player has a type" do 
    humanpieces = Piece.new(:human)
    player= Player.new(:human, humanpieces)

    expect(player.type).to eq(:human)
  end

  it "the player comes with 21 pieces" do 
    humanpieces = Piece.new(:human)
    player= Player.new(:human, humanpieces)

    expect(player.pieces).to eq(21)
  end

end 