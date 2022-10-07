require_relative "piece.rb"


class Bishop < Piece
    attr_accessor :location

    def initialize(location, board)
        super(location, board)
    end

    def move_set
        [[1,1],[-1,-1],[-1,1],[1,-1]]
    end
end


