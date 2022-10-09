require_relative "piece.rb"
require_relative "../board.rb"
require_relative "bishop.rb"


class Rook < Piece
    attr_accessor :location

    def initialize(location, board)
        super(location, board)
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1]]
    end
end


