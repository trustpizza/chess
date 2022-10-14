require_relative "../board.rb"

class Queen < Piece
   
    def initialize(location, color)
        super(location, color)
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1], [1,1], [-1,1], [1,-1], [-1, -1]]
    end

    def symbol
        return " \u2655" if self.color == 'white'
        return " \u265B" if self.color == 'black'
    end
end