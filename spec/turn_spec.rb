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

  it "each turn creates the pieces and the players" do 
    board = Board.new
    turn = Turn.new(board)

    expect(turn.instance_variables).to include(:@humanpieces, :@computerpieces, :@player, :@computer, :@board, :@hash_counter)

  end


  it "the board by default is empty before anyone plays on a turn" do
    board = Board.new
    turn = Turn.new(board)

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
    board = Board.new
    turn = Turn.new(board)
    turn.place_token("A", :computer)
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
    board = Board.new
    turn = Turn.new(board)

    turn.place_token("D", :computer)
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
    board = Board.new
    turn = Turn.new(board)
     
    turn.place_token("A", :human)
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
    board = Board.new
    turn = Turn.new(board)
    turn.hash_counter = {"A"=>1,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
# require 'pry'; binding.pry
    expect(turn.column_valid("A")).to be(true)
  end 

  it "the column is filled up, it will not not be true that a token can be placed there" do 
    board = Board.new
    turn = Turn.new(board)
    turn.hash_counter = {"A"=>6,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}

    expect(turn.column_valid("A")).to be(false)

  end

  it "can place a token if the column is valid" do 
    board = Board.new
    turn = Turn.new(board)
    turn.hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    turn.column_valid("A")
    turn.place_token("A", :human)

    expect(turn.board.board).to eq({"A": [".", ".", ".", ".", ".", "X"], 
          "B": [".", ".", ".", ".", ".", "."],  
          "C": [".", ".", ".", ".", ".", "."],
          "D": [".", ".", ".", ".", ".", "."], 
          "E": [".", ".", ".", ".", ".", "."], 
          "F": [".", ".", ".", ".", ".", "."],
          "G": [".", ".", ".", ".", ".", "."]}
) 
  end

  it "can repeat this for both players" do 
    board = Board.new
    turn = Turn.new(board)
    turn.hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    turn.column_valid("A")
    turn.place_token("A", :human)
    turn.column_valid("A")
    turn.place_token("A", :computer)
    turn.column_valid("B")
    turn.place_token("B", :human)

    expect(turn.board.board).to eq({"A": [".", ".", ".", ".", "O", "X"], 
          "B": [".", ".", ".", ".", ".", "X"],  
          "C": [".", ".", ".", ".", ".", "."],
          "D": [".", ".", ".", ".", ".", "."], 
          "E": [".", ".", ".", ".", ".", "."], 
          "F": [".", ".", ".", ".", ".", "."],
          "G": [".", ".", ".", ".", ".", "."]}
) 
  end

  it "after each successful choice, the hash_counter will go up" do 
    board = Board.new
    turn = Turn.new(board)
    turn.hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    turn.column_valid("A")
    turn.place_token("A", :human)
    
    expect(turn.hash_counter).to eq({"A"=>1,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0})

  end

  it "it will print a message for the computer winner" do 
    board = Board.new
    turn = Turn.new(board)

    expect(turn.print_winner(turn.computer)).to eq("The Computer Connected 4-- don't worry, you could one day design a program where you always win!")
  end

  it "it will print a message for the human winner" do 
    board = Board.new
    turn = Turn.new(board)
    
    expect(turn.print_winner(turn.player)).to eq("You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back.")
  end

  it "it will print a draw" do 
    board = Board.new
    turn = Turn.new(board)

    expect(turn.print_winner("draw")).to eq("This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something.")
  end

  # it "if neither player has any pieces, the victor will be a draw " do 
  #   board = Board.new
    
  #   turn = Turn.new(board)
  #   turn.player.pieces = 0
  #   turn.computer.pieces = 0
  #   turn.check_winner

  #   expect(turn.victor).to eq("draw")
  # end

  # it "if four XXXXs are connected vertically, the player is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:A] = [".", "X", "X", "X", "X", "."]
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
  # end

  # it "if four OOOOs are connected vertically, the computer is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
     
  #   turn.board.board[:A] = [".", "O", "O", "O", "O", "."]
  #   turn.check_winner
      
  #   expect(turn.victor).to eq(turn.computer)
  # end

  # it "Round 2 with different placement of XXXXs: if four XXXXs are connected vertically, the player is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:B] = ["X", "X", "X", "X", ".", "."]
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
  # end

  # it "Round 2 with different placement of OOOOs: if four OOOOs are connected vertically, the computer is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:B] = ["O", "O", "O", "O", ".", "."]
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.computer)
  # end

  # it "if four OOOOs are connected horizontally, the computer is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:A][5] = "O"
  #   turn.board.board[:B][5] = "O"
  #   turn.board.board[:C][5] = "O"
  #   turn.board.board[:D][5] = "O"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.computer)
  # end

  # it "if four XXXXs are connected horizontally, the player is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:A][5] = "X"
  #   turn.board.board[:B][5] = "X"
  #   turn.board.board[:C][5] = "X"
  #   turn.board.board[:D][5] = "X"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
  # end

  # it "Round 2 with different placement of OOOOs: if four OOOOs are connected horizontally, the computer is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:D][2] = "O"
  #   turn.board.board[:E][2] = "O"
  #   turn.board.board[:F][2] = "O"
  #   turn.board.board[:G][2] = "O"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.computer)
  # end

  # it "Round 2 with different placement of XXXXs:if four XXXXs are connected horizontally, the player is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:D][2] = "X"
  #   turn.board.board[:E][2] = "X"
  #   turn.board.board[:F][2] = "X"
  #   turn.board.board[:G][2] = "X"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
  # end

  # it "if four XXXXs are connected diagonally, the player is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:A][2] = "X"
  #   turn.board.board[:B][3] = "X"
  #   turn.board.board[:C][4] = "X"
  #   turn.board.board[:D][5] = "X"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
  # end

  # it "if four OOOOs are connected diagonally, the computer is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:A][2] = "O"
  #   turn.board.board[:B][3] = "O"
  #   turn.board.board[:C][4] = "O"
  #   turn.board.board[:D][5] = "O"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.computer)
  # end

  # it "Round 2 with different placement of XXXXs: if four XXXXs are connected diagonally, the player is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:G][0] = "X"
  #   turn.board.board[:F][1] = "X" 
  #   turn.board.board[:E][2] = "X" 
  #   turn.board.board[:D][3] = "X"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
  # end

  # it "Round 2 with different placement of OOOOs: if four OOOOs are connected diagonally, the computer is declared the victor" do 
  #   board = Board.new
  #   turn = Turn.new(board)
      
  #   turn.board.board[:G][0] = "O"
  #   turn.board.board[:F][1] = "O" 
  #   turn.board.board[:E][2] = "O" 
  #   turn.board.board[:D][3] = "O"
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.computer)
  # end

  # it "Can play a game of Connect Four" do
  #   board = Board.new
  #   turn = Turn.new(board)
    
  #   turn.choice = "A"
  #   turn.place_token(:human)
  #   turn.check_winner
  #   turn.choice = "B"
  #   turn.place_token(:computer)
  #   turn.check_winner
  #   turn.choice = "A"
  #   turn.place_token(:human)
  #   turn.check_winner
  #   turn.choice = "E"
  #   turn.place_token(:computer)
  #   turn.check_winner
  #   turn.choice = "A"
  #   turn.place_token(:human)
  #   turn.check_winner
  #   turn.choice = "F"
  #   turn.place_token(:computer)
  #   turn.check_winner
  #   turn.choice = "A"
  #   turn.place_token(:human)
  #   turn.check_winner

  #   expect(turn.victor).to eq(turn.player)
#   end

 
end