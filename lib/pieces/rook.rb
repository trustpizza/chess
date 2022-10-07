require_relative "piece.rb"
require_relative "../board.rb"


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
rook = Rook.new([5,5], board)
moves = rook.possible_moves(board)

rook.invalid_moves(moves, board)