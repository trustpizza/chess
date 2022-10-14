class Board 

    attr_reader :black_king, :white_king
    attr_accessor :grid

    def initialize(grid = Array.new(8) { Array.new(8) }, args = {})
        @grid = grid
        @black_king = args[:black_king]
        @white_king = args[:white_king]
    end

end