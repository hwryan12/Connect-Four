class Turn 
    attr_reader :turn,  
                :board, 
                :computer, 
                :player,
                :choice
    attr_accessor :hash_counter, :victor

    def initialize(board, player, computer)
        @board = board
        @player = player
        @computer = computer
        @choice = nil
        @victor == nil 
        @hash_counter = {"A"=>0,"B"=>0,"C"=>0,"D"=>0,"E"=>0,"F"=>0,"G"=>0}
    end 


    def human_turn 

        choose_column_human
            choice = @choice

        if column_valid(choice) == true 
                place_token(choice, :human)
                puts "HUMAN TURN Below"
                @board.board_grid
                player.remove_token_from_list

        else puts "Not Valid. Pick another column."
            choose_column_human
        end
       
    end 

    def computer_turn 

        choose_column_computer
            choice = @choice
        while column_valid(choice) == false
            choice = choose_column_computer
        end
            place_token(choice, :computer)
            puts "COMPUTER TURN Below"
            @board.board_grid
            computer.remove_token_from_list
        
    end 

    def choose_column_human
            puts "NEW TURN: Pick which row you would like to input the next token. Your choices are: 
                A
                B
                C
                D
                E
                F
                G"
        @choice = gets.chomp

        if @choice == "EXIT"
            abort 
        elsif @choice != "A" && @choice != "B" && @choice != "C" && @choice != "D" && @choice != "E" && @choice != "F" && @choice != "G"
            puts "Invalid choice. Please pick one of the designated options (type EXIT to leave the game)"
            choose_column_human
        end
    end 

    def choose_column_computer
                @choice = ["A", "B", "C", "D", "E", "F", "G"].sample
    end
    

    def column_valid(choice)
        i = choice 
        if @hash_counter[i] < 6 
             true
        else false 
        end 
    end

    def place_token(choice, human_or_computer)
        i = choice.to_sym
        @board.board[i].reverse.find do |letter|
            if letter == (".") && human_or_computer == :human
                letter.replace("X")
            elsif letter == (".") && human_or_computer == :computer
                letter.replace("O")
            end 
        end
        @hash_counter[choice] += 1
    end 

    
end 