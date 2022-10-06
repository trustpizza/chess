require_relative "piece.rb"


class Rook < Piece
    attr_accessor :location

    def initialize(location, board)
        super(location, board)
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1]]
    end
end
board = Board.new


rook = Rook.new([3,3], board)
rook.find_possible_moves(board)
x