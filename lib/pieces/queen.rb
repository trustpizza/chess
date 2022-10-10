require_relative "../board.rb"

class Queen < Piece
    attr_accessor :location

    def initialize(location, board, color)
        super(location, board, color)
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1], [1,1], [-1,1], [1,-1], [-1, -1]]
    end
end