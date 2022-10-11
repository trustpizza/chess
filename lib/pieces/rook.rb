require_relative "piece.rb"
require_relative "../board.rb"


class Rook < Piece
   
    def initialize(location, board, color)
        super(location, board, color)
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1]]
    end
end

