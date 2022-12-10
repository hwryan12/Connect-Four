require './lib/board'
require './lib/turn'
require './lib/piece'
require './lib/player'
require './lib/game'
require 'rspec'

RSpec.describe Turn do
   it "a turn can exist" do 

    turn = Turn.new(@board)
    expect(turn).to be_an_instance_of(Turn)
    end


    it "each player starts out with 21 pieces" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)
      
      expect(player.pieces).to eq(21)
      expect(computer.pieces).to eq(21)
    end

    it "after each turn the participants' tokens diminsh by one" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.choose_column(:human)
      turn.place_token(:human)
      turn.place_token(:computer)

      expect(player.pieces).to eq(20)
      expect(computer.pieces).to eq(20)
    end

    it "each player can place a token" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.place_token(:human)
      turn.place_token(:computer)
      
      # What are we expecting here
    end

    it "can display the board with placed token" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.choose_column(:human)
      turn.place_token(:human)
      turn.place_token(:computer)

      expect(turn.@board.board_grid).to
      # What are we expecting here
    end

    it "can check if the player won vertically" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.play_turn
      expect(turn.check_winner.vertical).to be false
    end
  
    it "can check if the player won horizontally" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.play_turn
      expect(turn.check_winner.horizontal).to be false
    end
  
    it "can check if the player won diagonally" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.play_turn
      expect(turn.check_winner.diagonally).to be false
    end

    it "can check if the game draws" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      @player.pieces == 0
      @computer.pieces == 0
      expect(turn.check_winner.draw).to be true
    end
  end
end