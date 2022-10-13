require_relative "../board.rb"

class Queen < Piece
   
    def initialize(location, color)
        super(location, color)
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1], [1,1], [-1,1], [1,-1], [-1, -1]]
    end
end