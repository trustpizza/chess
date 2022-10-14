

class Board
    attr_accessor :grid, :black_king, :white_king

    def initialize(data = Array.new(8) { Array.new(8) }, arr = {})
        @grid = grid
        @black_king = hash[:black_king]
        @white_king = hash[:white_king]
    end
end