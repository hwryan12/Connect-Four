class Piece 
    attr_reader :owner,
                :number

def initialize(owner) 
    @owner = owner
end

def output
    if @owner == :human
        puts "X"
    elsif @owner == :computer
        puts "O"
    end 

end

end 
