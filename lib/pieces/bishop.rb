require_relative "pieces"

class Bishop < Piece
    def initialize(board, args)
      super(board, args)
      @symbol = " \u265D "
    end
  
    private
  
    def move_set
      [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    end
  end