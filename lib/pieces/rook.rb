# frozen_string_literal: true

require_relative 'pieces'

class Rook < Piece
<<<<<<< HEAD
<<<<<<< HEAD
   
    def initialize(location, color)
        super(location, color)
=======
    attr_accessor :location

    def initialize(location, board, color)
        super(location, board, color)
>>>>>>> origin/test
    end

    def move_set
        [[0,1],[1,0],[-1,0],[0,-1]]
    end
end

<<<<<<< HEAD
    def symbol
        return " \u2657" if self.color == 'white'
        return " \u265D" if self.color == 'black'
    end
end

=======
>>>>>>> origin/test
=======
  def initialize(board, args)
    super(board, args)
    @symbol = " \u265C "
  end

  private

  def move_set
    [[0, 1], [0, -1], [-1, 0], [1, 0]]
  end
end
>>>>>>> origin/chess_2
