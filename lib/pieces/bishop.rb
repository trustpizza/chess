require_relative "piece.rb"
require_relative "../board.rb"


class Bishop < Piece
 
    def initialize(location, color)
        super(location, color)
    end

    def move_set
        [[1,1],[-1,-1],[-1,1],[1,-1]]
    end

    def symbol
        return " \u2657" if self.color == 'white'
        return " \u265D" if self.color == 'black'
    end
end

