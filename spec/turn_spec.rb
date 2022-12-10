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

    # it "each player can place a token" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)

    #   turn.place_token(:human)
    #   turn.place_token(:computer)
      
    #   expect(board.board_grid).not_to eq()
      # Come back here to add board rendered
    # end
    
    xit "after each turn the participants' tokens diminsh by one" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.choose_column(:human)
      turn.place_token(:human)
      turn.choose_column(:computer)
      turn.place_token(:computer)

      expect(player.pieces).to eq(20)
      expect(computer.pieces).to eq(20)
    end

    # it "can display the board with placed token" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)

    #   turn.choose_column(:human)
    #   turn.place_token(:human)
    #   turn.place_token(:computer)

    #   expect(turn.@board.board_grid).to
    #   # What are we expecting here
    # end

        # Needs work
    it "can check if the player won vertically" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.play_turn
      expect(turn.vertical_win?).to be false

      @vert_arrays.four_in_a_row == true
      expect(turn.vertical_win?).to be true
    end
  
      xit "can check if the player won horizontally" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.play_turn
      expect(turn.horizontal_win?).to be false

      @horiz_arrays.four_in_a_row == true
      expect(turn.horizontal_win?).to be true
    end
  
    xit "can check if the player won diagonally" do
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)

      turn.play_turn
      expect(turn.diagonal_win?).to be false

      @diag_arrays.four_in_a_row == true
      expect(turn.diagonal_win?).to be true
    end

    xit "can check if the game draws" do
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