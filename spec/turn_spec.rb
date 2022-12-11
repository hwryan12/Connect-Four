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

      expect(turn.instance_variables).to include(:@humanpieces, :@computerpieces, :@player, :@computer, :@a_count, :@b_count, :@c_count, :@d_count, :@e_count, :@f_count, :@g_count, :@board)
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

    it "a token placed in A will increase the count of A by 1" do 
      board = Board.new
      turn = Turn.new(board)

      turn.choice = "A"
      turn.place_token(:computer)

      expect(turn.a_count).to eq(1)

    end 

    it "a token placed in D will increase the count of A by 1" do 
      board = Board.new
      turn = Turn.new(board)

      turn.choice = "D"
      turn.place_token(:computer)

      expect(turn.d_count).to eq(1)

    end 

    it "after each turn the board changes" do
      board = Board.new
      turn = Turn.new(board)

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

    it "a computer token will be an O and be placed at the end of the array " do
# Note the reverse function on the turn.rb method place_token(type)- this was a creation of the way the board prints. 
      board = Board.new
      turn = Turn.new(board)

      turn.choice = "D"
      turn.place_token(:computer)
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
  # Note the reverse function on the turn.rb method place_token(type)- this was a creation of the way the board prints. 
      board = Board.new
      turn = Turn.new(board)
     
      turn.choice = "A"
      turn.place_token(:human)
      transformed_board = {"A": [".", ".", ".", ".", ".", "X"], 
      "B": [".", ".", ".", ".", ".", "."],  
      "C": [".", ".", ".", ".", ".", "."],
      "D": [".", ".", ".", ".", ".", "."], 
      "E": [".", ".", ".", ".", ".", "."], 
      "F": [".", ".", ".", ".", ".", "."],
      "G": [".", ".", ".", ".", ".", "."]}
            
       expect(board.board).to eq(transformed_board)
            
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

    it "if neither player has any pieces, the victor will be a draw " do 
      board = Board.new
      turn = Turn.new(board)
      turn.player.pieces = 0
      turn.computer.pieces = 0
      turn.check_winner

      expect(turn.victor).to eq("draw")
    end


        # EVERYTHING BELOW HERE WE STILL NEED TO GET TO RUN 

        # VERTICAL WIN

    it "if four XXXXs are connected vertically, the player is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.vertical_win.vert_array = "..XXXX."
      turn.check_winner

      expect(turn.victor).to eq(@player)
    end

    it "if four OOOOs are connected vertically, the computer is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.vertical_win.vert_array = "..OOOO."
      turn.check_winner

      expect(turn.victor).to eq(@computer)
      
    end

    it "Round 2 with different placement of XXXXs: if four XXXXs are connected vertically, the player is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.vertical_win.vert_array = "XXXX..."
      turn.check_winner

      expect(turn.victor).to eq(@player)
    end

    it "Round 2 with different placement of OOOOs: if four OOOOs are connected vertically, the computer is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.vertical_win.vert_array = "OOOO..."
      turn.check_winner

      expect(turn.victor).to eq(@computer)
      
    end

    # HORIZONTAL WINS

    it "if four OOOOs are connected horizontally, the computer is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.horizontal_win.horiz_array_to_check = "OOOO..."
      turn.check_winner

      expect(turn.victor).to eq(@computer)

    end

    it "if four XXXXs are connected horizontally, the player is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.horizontal_win.horiz_array_to_check = "XXXX..."
      turn.check_winner

      expect(turn.victor).to eq(@computer)

    end

    it "Round 2 with different placement of OOOOs: if four OOOOs are connected horizontally, the computer is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.horizontal_win.horiz_array_to_check = "..OOOO."
      turn.check_winner

      expect(turn.victor).to eq(@computer)

    end

    it "Round 2 with different placement of XXXXs:if four XXXXs are connected horizontally, the player is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.horizontal_win.horiz_array_to_check = "...XXXX"
      turn.check_winner

      expect(turn.victor).to eq(@player)

    end

    it "if four XXXXs are connected diagonally, the player is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.horizontal_win.horiz_array_to_check = "...XXXX"
      turn.check_winner

      expect(turn.victor).to eq(@player)

    end

    it "if four OOOOs are connected diagonally, the computer is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.diagonal_win.diag_array = "...XXXX"
      turn.check_winner

      expect(turn.victor).to eq(@computer)
    end

    it "Round 2 with different placement of XXXXs: if four XXXXs are connected diagonally, the player is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.horizontal_win.horiz_array_to_check = "..XXXX."
      turn.check_winner

      expect(turn.victor).to eq(@player)

    end

    it "Round 2 with different placement of OOOOs: if four OOOOs are connected diagonally, the computer is declared the victor" do 

      board = Board.new
      turn = Turn.new(board)
      turn.diagonal_win.diag_array = "..OOOO."
      turn.check_winner

      expect(turn.victor).to eq(@computer)
    end

end