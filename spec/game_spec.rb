require './lib/board'
require './lib/turn'
require './lib/piece'
require './lib/player'
require './lib/game'
require 'rspec'

RSpec.describe Game do
  it "a game can exist" do 
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

 # COME BACK TO HERE 
  xit "it will print a message for the computer winner" do 
    game = Game.new
    board = Board.new
    humanpieces = Piece.new(:human)
    computerpieces = Piece.new(:computer)
    player = Player.new(:human, humanpieces)
    computer = Player.new(:computer, computerpieces)
    new_turn = Turn.new(board, player, computer)
    
    
    require "pry"; binding.pry
    expect(game.print_winner(@computer)).to eq("The Computer Connected 4-- don't worry, you could one day design a program where you always win!")
  end
  
  xit "it will print a message for the human winner" do 
    board = Board.new
    new_turn = Turn.new(board)
    
    expect(new_turn.print_winner(new_turn.player)).to eq("You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back.")
  end
  
  xit "it will print a draw" do 
    board = Board.new
    new_turn = Turn.new(board)
  
    expect(new_turn.print_winner("draw")).to eq("This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something.")
  end
  
  it "if neither player has any pieces, the victor will be a draw " do 
    game = Game.new
    board = Board.new
    humanpieces = Piece.new(:human)
    computerpieces = Piece.new(:computer)
    player = Player.new(:human, humanpieces)
    computer = Player.new(:computer, computerpieces)
    new_turn = Turn.new(board, player, computer)
    
    new_turn.player.pieces = 0
    new_turn.computer.pieces = 0
    game.check_winner
  
    expect(game.victor).to eq("draw")
  end
  
  xit "if four XXXXs are connected vertically, the player is declared the victor" do 
    board = Board.new
    new_turn = Turn.new(board)
      
    new_turn.board.board[:A] = [".", "X", "X", "X", "X", "."]
    new_turn.check_winner
  
    expect(new_turn.victor).to eq(new_turn.player)
  end
  
  xit "if four OOOOs are connected vertically, the computer is declared the victor" do 
    board = Board.new
    new_turn = Turn.new(board)
     
    new_turn.board.board[:A] = [".", "O", "O", "O", "O", "."]
    new_turn.check_winner
      
    expect(new_turn.victor).to eq(new_turn.computer)
  end
  
  xit "Round 2 with different placement of XXXXs: if four XXXXs are connected vertically, the player is declared the victor" do 
    board = Board.new
    new_turn = Turn.new(board)
      
    new_turn.board.board[:B] = ["X", "X", "X", "X", ".", "."]
    new_turn.check_winner
  
    expect(new_turn.victor).to eq(new_turn.player)
  end
  
  xit "Round 2 with different placement of OOOOs: if four OOOOs are connected vertically, the computer is declared the victor" do 
    board = Board.new
    new_turn = Turn.new(board)
      
    new_turn.board.board[:B] = ["O", "O", "O", "O", ".", "."]
    new_turn.check_winner
  
    expect(new_turn.victor).to eq(new_turn.computer)
  end
  
  xit "if four OOOOs are connected horizontally, the computer is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:A][5] = "O"
    turn.board.board[:B][5] = "O"
    turn.board.board[:C][5] = "O"
    turn.board.board[:D][5] = "O"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.computer)
  end
  
  xit "if four XXXXs are connected horizontally, the player is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:A][5] = "X"
    turn.board.board[:B][5] = "X"
    turn.board.board[:C][5] = "X"
    turn.board.board[:D][5] = "X"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.player)
  end
  
  xit "Round 2 with different placement of OOOOs: if four OOOOs are connected horizontally, the computer is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:D][2] = "O"
    turn.board.board[:E][2] = "O"
    turn.board.board[:F][2] = "O"
    turn.board.board[:G][2] = "O"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.computer)
  end
  
  xit "Round 2 with different placement of XXXXs:if four XXXXs are connected horizontally, the player is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:D][2] = "X"
    turn.board.board[:E][2] = "X"
    turn.board.board[:F][2] = "X"
    turn.board.board[:G][2] = "X"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.player)
  end
  
  xit "if four XXXXs are connected diagonally, the player is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:A][2] = "X"
    turn.board.board[:B][3] = "X"
    turn.board.board[:C][4] = "X"
    turn.board.board[:D][5] = "X"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.player)
  end
  
  xit "if four OOOOs are connected diagonally, the computer is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:A][2] = "O"
    turn.board.board[:B][3] = "O"
    turn.board.board[:C][4] = "O"
    turn.board.board[:D][5] = "O"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.computer)
  end
  
  xit "Round 2 with different placement of XXXXs: if four XXXXs are connected diagonally, the player is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:G][0] = "X"
    turn.board.board[:F][1] = "X" 
    turn.board.board[:E][2] = "X" 
    turn.board.board[:D][3] = "X"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.player)
  end
  
  xit "Round 2 with different placement of OOOOs: if four OOOOs are connected diagonally, the computer is declared the victor" do 
    board = Board.new
    turn = Turn.new(board)
      
    turn.board.board[:G][0] = "O"
    turn.board.board[:F][1] = "O" 
    turn.board.board[:E][2] = "O" 
    turn.board.board[:D][3] = "O"
    turn.check_winner
  
    expect(turn.victor).to eq(turn.computer)
  end
  
  xit "Can play a game of Connect Four" do
    board = Board.new
    turn = Turn.new(board)
    
    turn.place_token("A", :human)
    turn.check_winner
    turn.place_token("B", :computer)
    turn.check_winner
    turn.place_token("A", :human)
    turn.check_winner
    turn.place_token("E",:computer)
    turn.check_winner
    turn.place_token("A", :human)
    turn.check_winner
    turn.place_token("F", :computer)
    turn.check_winner
    turn.place_token("A", :human)
    turn.check_winner
  
    expect(turn.victor).to eq(turn.player)
  end
end