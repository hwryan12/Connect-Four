class Turn 
    attr_reader :turn 

    def initialize(board)
        @board = board
        humanpieces = Piece.new(:human)
        computerpieces = Piece.new(:computer)
        player= Player.new(:human, humanpieces)
        computer= Player.new(:computer, computerpieces)
        @player = player
        @computer = computer
        @choice = nil

    end 

    def play_turn 

        choose_column(:human)
        place_token(:human)
        puts "Your [Human Player] turn:"
            @board.board_grid
        sleep(1)
        self.check_winner

        choose_column(:computer)
        place_token(:computer)
        puts "The Computer's turn:"
            @board.board_grid
        sleep(1)
        self.check_winner

    end 

    def choose_column(type)
        if type == :human
            puts "Pick which row you would like to input the next token. Your @choices are: 
                A
                B
                C
                D
                E
                F
                G"
            @choice = gets.chomp
        elsif type == :computer
            @choice = ["A", "B", "C", "D", "E", "F", "G"].sample
        end
    end 

    def place_token(type)
    a_count= 0 
    b_count = 0
    c_count = 0
    d_count = 0 
    e_count = 0
    f_count = 0
    g_count = 0
        if type == :human
            if @choice == "A"
                if a_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.a.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        a_count += 1 
                    end     
                    end
                end 
            elsif @choice == "B"
                if b_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.b.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        b_count += 1 
                    end     
                    end
                end 
            elsif @choice == "C"
                if c_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.c.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        c_count += 1 
                    end     
                    end
                end 
            elsif @choice == "D"
                if d_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.d.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        d_count += 1 
                    end     
                    end
                end 
            elsif @choice == "E"
                if e_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.e.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        e_count += 1 
                    end     
                    end
                end 
            elsif @choice == "F"
                if f_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.f.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        f_count += 1 
                    end     
                    end
                end 
            elsif @choice == "G"
                if g_count >= 6 
                    puts "This row is filled up. Try another!"
                    choose_column(:human)
                else @board.g.find do |letter|
                    if letter == (".")
                        letter.replace("X")
                        g_count += 1 
                    end     
                    end
                end 
            elsif @choice == "Exit"
                self.new_game
            elsif @choice != "A" || @choice != "B" || @choice != "C" || @choice != "D" || @choice != "E" || @choice != "F" || @choice != "G" || @choice != "Exit"
                puts "Your choice is not valid. Please pick again. If you want to exit the game please type Exit" 
                choose_column(:human)
            end     
            
            @player.pieces -= 1 

        elsif type == :computer
            if @choice == "A"
                if a_count >= 6 
                    choose_column(:computer)
                else @board.a.find do |letter|
                    if letter == (".")
                      letter.replace("O")
                      a_count += 1 
                    end     
                    end
                end 
            elsif @choice == "B"
                if b_count >= 6 
                    choose_column(:computer)
                else @board.b.find do |letter|
                    if letter == (".")
                      letter.replace("O")
                      b_count += 1 
                    end     
                    end
                end
            elsif @choice == "C"
                if c_count >= 6 
                    choose_column(:computer)
                else @board.c.find do |letter|
                    if letter == (".")
                      letter.replace("O")
                      c_count += 1 
                    end     
                    end
                end 
            elsif @choice == "D"
                if d_count >= 6 
                    choose_column(:computer)
                else @board.d.find do |letter|
                   if letter == (".")
                      letter.replace("O")
                      d_count += 1 
                    end     
                    end
                end 
            elsif @choice == "E"
                if e_count >= 6 
                    choose_column(:computer)
                else @board.e.find do |letter|
                   if letter == (".")
                      letter.replace("O")
                      e_count += 1 
                    end     
                    end
                end
            elsif @choice == "F"
                if f_count >= 6 
                    choose_column(:computer)
                else @board.f.find do |letter|
                   if letter == (".")
                      letter.replace("O")
                      f_count += 1 
                    end     
                    end
                end
            elsif @choice == "G"
                if g_count >= 6 
                    choose_column(:computer)
               else @board.g.find do |letter|
                   if letter == (".")
                      letter.replace("O")
                      g_count += 1 
                    end     
                    end
                end 
            end 
            @computer.pieces -= 1 
        end 
    end 
    
    def check_winner

        self.vertical
        self.horizontal
        self.diagonal

        self.draw
        require 'pry'; binding.pry


        if @winner == @computer 
            puts "The Computer Connected 4-- don't worry, you could one day design a program where you always win!"
        elsif @winner == @player
            puts "You connected 4 and won-- are you sure you didn't make a program where you always win? Either way, pat yourself on the back."
        elsif @winner == @draw
            puts "This game has ended in a draw. Instead of feeling sad, feel happy! Congrats! You are the equal match of two aspiring programmers at Turing. So that has to mean something."
        else puts "Next Turn"
        end 
       
    end
    
    # def four_in_a_row(array)
    #     array.each do |element|
    #         new_array = element.join("")
    #         if new_array.include?("XXXX")
    #             @winner == @player
    #         elsif new_array.include?("OOOO")
    #             @winner == @computer
       
    #         end
    #     end

    # end
    
    
    def vertical_win?
        # require 'pry'; binding.pry
        @all_arrays = [@board.a, @board.b, @board.c, @board.d, @board.e, @board.f, @board.g]

        @all_arrays.each do |array|
            vert_array = array.join("")
            if vert_array.include?("XXXX")
                # puts "Connected 4 Vertically!"
                # puts "Player Wins!"
                # new_game = Game.new
                # new_game.start_game
            elsif vert_array.include?("OOOO")
                # puts "Connected 4 Vertically!"
                # puts "The Computer Wins!"
                # new_game = Game.new
                # new_game.start_game
            end
            end
        end
    end
    def horizontal_win?

        all_arrays2 = []
        all_arrays2 << [@board.a[5], @board.b[5], @board.c[5], @board.d[5], @board.e[5], @board.f[5], @board.g[5]] 
        all_arrays2 << [@board.a[4], @board.b[4], @board.c[4], @board.d[4], @board.e[4], @board.f[4], @board.g[4]] 
        all_arrays2 << [@board.a[3], @board.b[3], @board.c[3], @board.d[3], @board.e[3], @board.f[3], @board.g[3]] 
        all_arrays2 << [@board.a[2], @board.b[2], @board.c[2], @board.d[2], @board.e[2], @board.f[2], @board.g[2]] 
        all_arrays2 << [@board.a[1], @board.b[1], @board.c[1], @board.d[1], @board.e[1], @board.f[1], @board.g[1]] 
        all_arrays2 << [@board.a[0], @board.b[0], @board.c[0], @board.d[0], @board.e[0], @board.f[0], @board.g[0]] 
        
        all_arrays2.each do |array|
            horiz_array = array.join("")
            if horiz_array.include?("XXXX")
                # puts "Connected 4 Horizontally!"
                # puts "Player Wins!"
                # new_game = Game.new
                # new_game.start_game
            elsif horiz_array.include?("OOOO")
                # puts "Connected 4 Horizontally!"
                # puts "The Computer Wins!"
                # new_game = Game.new
                # new_game.start_game
            end
        end
    end

    def diagonal_win?
        diag_array = []
        diag_array << [@board.a[2], @board.b[3], @board.c[4], @board.d[5]]
        diag_array << [@board.a[1], @board.b[2], @board.c[3], @board.d[4]]
        diag_array << [@board.b[2], @board.c[3], @board.d[4], @board.e[5]]
        diag_array << [@board.a[0], @board.b[1], @board.c[2], @board.d[3]]
        diag_array << [@board.b[1], @board.c[2], @board.d[3], @board.e[4]]
        diag_array << [@board.c[2], @board.d[3], @board.e[4], @board.f[5]]
        diag_array << [@board.b[0], @board.c[1], @board.d[2], @board.e[3]]
        diag_array << [@board.c[1], @board.d[2], @board.e[3], @board.f[4]]
        diag_array << [@board.d[2], @board.e[3], @board.f[4], @board.g[5]]
        diag_array << [@board.c[0], @board.d[1], @board.e[2], @board.f[3]]
        diag_array << [@board.d[1], @board.e[2], @board.f[3], @board.g[4]]
        diag_array << [@board.d[0], @board.e[1], @board.f[2], @board.g[3]]
        diag_array << [@board.g[2], @board.f[3], @board.e[4], @board.d[5]]
        diag_array << [@board.g[1], @board.f[2], @board.e[3], @board.d[4]]
        diag_array << [@board.f[2], @board.e[3], @board.d[4], @board.c[5]]
        diag_array << [@board.g[0], @board.f[1], @board.e[2], @board.d[3]]
        diag_array << [@board.f[1], @board.e[2], @board.d[3], @board.c[4]]
        diag_array << [@board.e[2], @board.d[0], @board.c[4], @board.b[5]]
        diag_array << [@board.f[0], @board.e[1], @board.d[2], @board.c[3]]
        diag_array << [@board.e[1], @board.d[2], @board.c[3], @board.b[4]]
        diag_array << [@board.d[2], @board.c[3], @board.b[4], @board.a[5]]
        diag_array << [@board.e[1], @board.d[1], @board.c[2], @board.b[3]]
        diag_array << [@board.d[1], @board.c[2], @board.b[3], @board.a[4]]
        diag_array << [@board.d[0], @board.c[1], @board.b[2], @board.a[3]]

        diag_array.each do |array|
            diag_array2 = array.join("")
            if diag_array2.include?("XXXX")
                # puts "Connected 4 Diagonally!"
                # puts "Player Wins!"
                # new_game = Game.new
                # new_game.start_game
            elsif diag_array2.include?("OOOO")
                # puts "Connected 4 Diagonally!"
                # puts "The Computer Wins!"
                # new_game = Game.new
                # new_game.start_game
            end
        end
    end

    def draw  
        if @player.pieces == 0 && @computer.pieces == 0
            # puts "Draw! There's no more pieces."
            # puts "You can try again!"
            # new_game = Game.new
            # new_game.start_game
        end
    end

    def new_game 
        new_game = Game.new
        new_game.start_game
    end
    
end