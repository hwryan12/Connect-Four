require './lib/board'
require './lib/turn'
require './lib/piece'
require './lib/player'
require './lib/game'
require 'rspec'

RSpec.describe Turn do
  let(:board) {board = Board.new}
  let(:humanpieces) {Piece.new(:human)}
  let(:computerpieces) {Piece.new(:computer)}
  let(:player) {Player.new(:human, humanpieces)}
  let(:computer) {Player.new(:computer, computerpieces)}
  let(:new_turn) {Turn.new(board, player, computer)}
  it "a turn can exist" do 
    
    expect(new_turn).to be_an_instance_of(Turn)
  end

  it "each player starts out with 21 pieces" do
      
      expect(player.pieces).to eq(21)
      expect(computer.pieces).to eq(21)
  end

  it "each turn creates the pieces and the players" do 

    expect(new_turn.instance_variables).to include(:@board, :@player, :@computer, :@choice, :@hash_counter)
  end


  it "the board by default is empty before anyone plays on a turn" do
    empty_board = {"A": [".", ".", ".", ".", ".", "."], 
        "B": [".", ".", ".", ".", ".", "."],  
        "C": [".", ".", ".", ".", ".", "."],
        "D": [".", ".", ".", ".", ".", "."], 
        "E": [".", ".", ".", ".", ".", "."], 
        "F": [".", ".", ".", ".", ".", "."],
        "G": [".", ".", ".", ".", ".", "."]}

    expect(board.board).to eq(empty_board)
  end


  it "after each turn the board changes" do
    new_turn.place_token("A", :computer)
    
    empty_board = {"A": [".", ".", ".", ".", ".", "."], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "."], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]}
      
    expect(board.board).not_to eq(empty_board)
  end

  it "a computer token will be an O and be placed at the end of the array " do
    new_turn.place_token("D", :computer)
    transformed_board = {"A": [".", ".", ".", ".", ".", "."], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "O"], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]}
      
    expect(board.board).to eq(transformed_board)
  end

  it "a human token will be an X and be placed at the end of the array " do
    new_turn.place_token("A", :human)
    transformed_board = {"A": [".", ".", ".", ".", ".", "X"], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "."], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]}
            
      expect(board.board).to eq(transformed_board)
  end

  it "the hash counter can check if a column is a valid placement" do
    new_turn.hash_counter = {"A"=>1,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}

    expect(new_turn.column_valid("A")).to be(true)
  end 

  it "the column is filled up, it will not not be true that a token can be placed there" do 
    new_turn.hash_counter = {"A"=>6,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}

    expect(new_turn.column_valid("A")).to be(false)

  end

  it "can place a token if the column is valid" do 
    new_turn.hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    new_turn.column_valid("A")
    new_turn.place_token("A", :human)

    expect(new_turn.board.board).to eq({"A": [".", ".", ".", ".", ".", "X"], 
          "B": [".", ".", ".", ".", ".", "."],  
          "C": [".", ".", ".", ".", ".", "."],
          "D": [".", ".", ".", ".", ".", "."], 
          "E": [".", ".", ".", ".", ".", "."], 
          "F": [".", ".", ".", ".", ".", "."],
          "G": [".", ".", ".", ".", ".", "."]}) 
  end

  it "can repeat this for both players" do 
    new_turn.hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    new_turn.column_valid("A")
    new_turn.place_token("A", :human)
    new_turn.column_valid("A")
    new_turn.place_token("A", :computer)
    new_turn.column_valid("B")
    new_turn.place_token("B", :human)

    expect(new_turn.board.board).to eq({"A": [".", ".", ".", ".", "O", "X"], 
          "B": [".", ".", ".", ".", ".", "X"],  
          "C": [".", ".", ".", ".", ".", "."],
          "D": [".", ".", ".", ".", ".", "."], 
          "E": [".", ".", ".", ".", ".", "."], 
          "F": [".", ".", ".", ".", ".", "."],
          "G": [".", ".", ".", ".", ".", "."]}
          ) 
  end

  it "after each successful choice, the hash_counter will go up" do 
    new_turn.hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    new_turn.column_valid("A")
    new_turn.place_token("A", :human)
    
    expect(new_turn.hash_counter).to eq({"A"=>1,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0})
  end
end
  