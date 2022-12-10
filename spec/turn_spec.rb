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


    it "the board by default is empty before anyone plays on a turn" do
      board = Board.new
      turn = Turn.new(board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)
      empty_board = {"A": [".", ".", ".", ".", ".", "."], 
        "B": [".", ".", ".", ".", ".", "."],  
        "C": [".", ".", ".", ".", ".", "."],
        "D": [".", ".", ".", ".", ".", "."], 
        "E": [".", ".", ".", ".", ".", "."], 
        "F": [".", ".", ".", ".", ".", "."],
        "G": [".", ".", ".", ".", ".", "."]}

      expect(board.board).to eq(empty_board)
      
    end

    it "each player can place a token" do
      board = Board.new
      turn = Turn.new(board)
      
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
      turn.choose_column(:computer)
      turn.place_token(:computer)
      empty_board = {"A": [".", ".", ".", ".", ".", "."], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "."], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]}
      
      expect(board.board).not_to eq(empty_board)
      
    end


    it "a token placed in A will increase the count of A by 1" do 
      board = Board.new
      turn = Turn.new(board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player = Player.new(:human, humanpieces)
      computer = Player.new(:computer, computerpieces)
      turn.choice = "A"
      turn.place_token(:computer)

      expect(turn.a_count).to eq(1)

    end 
    
    # it "after each turn the participants' tokens diminsh by one" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)

    #   turn.choose_column(:human)
    #   turn.place_token(:human)
    #   turn.choose_column(:computer)
    #   turn.place_token(:computer)

    #   expect(player.pieces).to eq(20)
    #   expect(computer.pieces).to eq(20)
    # end

    # it "a game participant will not be able to place a token in a full column" do 
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)
    #   @a_count = 6
    #   @choice = "A"
    #   require 'pry'; binding.pry

    #   expect(turn.place_token(:human).choice).to eq("This row is filled up. Try another!")


    # end 


    #     # Needs work
    # it "can check if the player won vertically" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)

    #   turn.play_turn
    #   expect(turn.vertical_win?).to be false

    #   four_in_a_row(@vert_arrays) == true
    #   expect(turn.vertical_win?).to be true
    # end
  
    #   it "can check if the player won horizontally" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)

    #   turn.play_turn
    #   expect(turn.horizontal_win?).to be false


    #   four_in_a_row(@horiz_arrays) == true
    #   expect(turn.horizontal_win?).to be true
    # end
  
    # it "can check if the player won diagonally" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)


    #   turn.play_turn
    #   expect(turn.diagonal_win?).to be false

    #   four_in_a_row(@diag_arrays) == true
    #   expect(turn.diagonal_win?).to be true
    # end

    # it "can check if the game draws" do
    #   turn = Turn.new(@board)
    #   humanpieces = Piece.new(:human)
    #   computerpieces = Piece.new(:computer)
    #   player = Player.new(:human, humanpieces)
    #   computer = Player.new(:computer, computerpieces)

    #   @player.pieces == 0
    #   @computer.pieces == 0
    #   expect(turn.check_winner.draw).to be true
    # end


end