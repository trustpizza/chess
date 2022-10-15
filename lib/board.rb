# frozen_string_literal: true

class Board
  attr_accessor :grid, :black_king, :white_king

  def initialize(_data = Array.new(8) { Array.new(8) }, _arr = {})
    @grid = grid
    @black_king = hash[:black_king]
    @white_king = hash[:white_king]
  end
end
