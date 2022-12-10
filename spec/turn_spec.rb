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
      player= Player.new(:human, humanpieces)
      computer= Player.new(:computer, computerpieces)

      expect(player.pieces).to eq(21)
      expect(computer.pieces).to eq(21)
    end

    it "after each turn the participants' tokens diminish by one" do 
      turn = Turn.new(@board)
      humanpieces = Piece.new(:human)
      computerpieces = Piece.new(:computer)
      player= Player.new(:human, humanpieces)
      computer= Player.new(:computer, computerpieces)
      turn.place_token(:human)
      turn.place_token(:computer)

      expect(player.pieces).to eq(20)
      expect(computer.pieces).to eq(20)

    end 
    # it "each player can place a token" do 
    #   turn = Turn.new(@board)
    #   require 'pry'; binding.pry
    #   turn.choose_column(:human).to eq(@choice)



    # end 


    #   #  Human chooses token- no test here. 
    # it "placing the token will change the board" do
    #   turn = Turn.new(@board)
    #   turn.computer_choice
    #   expect(turn.computer_choice).to eq("A" || "B" || "C" || "D" || "E" || "F"|| "G")
    # end


end