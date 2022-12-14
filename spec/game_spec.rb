require './lib/board'
require './lib/turn'
require './lib/piece'
require './lib/player'
require './lib/game'
require 'rspec'

RSpec.describe Game do
  let(:game) {Game.new}
  let(:new_turn) {Turn.new(game.board, game.player, game.computer)}
  it "a game can exist" do 
    # game = Game.new

    expect(game).to be_an_instance_of(Game)
  end
 
  it "it will print a message for the computer winner" do 
    @victor = new_turn.computer
    victor = @victor
    
    expect(game.print_winner(victor)).to eq("The Computer Connected 4-- don't worry, you could one day design a program where you always win!")
  end
  
  it "it will print a message for the human winner" do 
    @victor = new_turn.player
    victor = @victor
    expect(game.print_winner(victor)).to eq("You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back.")
  end
  
  it "it will print a draw" do 
    @victor = "draw"
    victor = @victor
    expect(game.print_winner("draw")).to eq("This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something.")
  end
  
  it "if neither player has any pieces, the victor will be a draw " do 
    new_turn.player.pieces = 0
    new_turn.computer.pieces = 0
    game.check_winner
  
    expect(game.victor).to eq("draw")
  end
  
  it "if four XXXXs are connected vertically, the player is declared the victor" do 
    new_turn.board.board[:A] = [".", "X", "X", "X", "X", "."]
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
  
  it "if four OOOOs are connected vertically, the computer is declared the victor" do 
    new_turn.board.board[:A] = [".", "O", "O", "O", "O", "."]
    game.check_winner
      
    expect(game.victor).to eq(game.computer)
  end
  
  it "Round 2 with different placement of XXXXs: if four XXXXs are connected vertically, the player is declared the victor" do 
    new_turn.board.board[:B] = ["X", "X", "X", "X", ".", "."]
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
  
  it "Round 2 with different placement of OOOOs: if four OOOOs are connected vertically, the computer is declared the victor" do 
    new_turn.board.board[:B] = ["O", "O", "O", "O", ".", "."]
    game.check_winner
  
    expect(game.victor).to eq(game.computer)
  end
  
  it "if four OOOOs are connected horizontally, the computer is declared the victor" do     
    game.board.board[:A][5] = "O"
    game.board.board[:B][5] = "O"
    game.board.board[:C][5] = "O"
    game.board.board[:D][5] = "O"
    game.check_winner
  
    expect(game.victor).to eq(game.computer)
  end
  
  it "if four XXXXs are connected horizontally, the player is declared the victor" do 
    game.board.board[:A][5] = "X"
    game.board.board[:B][5] = "X"
    game.board.board[:C][5] = "X"
    game.board.board[:D][5] = "X"
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
  
  it "Round 2 with different placement of OOOOs: if four OOOOs are connected horizontally, the computer is declared the victor" do     
    game.board.board[:D][2] = "O"
    game.board.board[:E][2] = "O"
    game.board.board[:F][2] = "O"
    game.board.board[:G][2] = "O"
    game.check_winner
  
    expect(game.victor).to eq(game.computer)
  end
  
  it "Round 2 with different placement of XXXXs:if four XXXXs are connected horizontally, the player is declared the victor" do 
    game.board.board[:D][2] = "X"
    game.board.board[:E][2] = "X"
    game.board.board[:F][2] = "X"
    game.board.board[:G][2] = "X"
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
  
  it "if four XXXXs are connected diagonally, the player is declared the victor" do 
    game.board.board[:A][2] = "X"
    game.board.board[:B][3] = "X"
    game.board.board[:C][4] = "X"
    game.board.board[:D][5] = "X"
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
  
  it "if four OOOOs are connected diagonally, the computer is declared the victor" do 
    game.board.board[:A][2] = "O"
    game.board.board[:B][3] = "O"
    game.board.board[:C][4] = "O"
    game.board.board[:D][5] = "O"
    game.check_winner
  
    expect(game.victor).to eq(game.computer)
  end
  
  it "Round 2 with different placement of XXXXs: if four XXXXs are connected diagonally, the player is declared the victor" do       
    game.board.board[:G][0] = "X"
    game.board.board[:F][1] = "X" 
    game.board.board[:E][2] = "X" 
    game.board.board[:D][3] = "X"
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
  
  it "Round 2 with different placement of OOOOs: if four OOOOs are connected diagonally, the computer is declared the victor" do      
    game.board.board[:G][0] = "O"
    game.board.board[:F][1] = "O" 
    game.board.board[:E][2] = "O" 
    game.board.board[:D][3] = "O"
    game.check_winner
  
    expect(game.victor).to eq(game.computer)
  end
  
  it "Can play a game of Connect Four" do   
    new_turn.place_token("A", :human)
    game.check_winner
    new_turn.place_token("B", :computer)
    game.check_winner
    new_turn.place_token("A", :human)
    game.check_winner
    new_turn.place_token("E",:computer)
    game.check_winner
    new_turn.place_token("A", :human)
    game.check_winner
    new_turn.place_token("F", :computer)
    game.check_winner
    new_turn.place_token("A", :human)
    game.check_winner
  
    expect(game.victor).to eq(game.player)
  end
end