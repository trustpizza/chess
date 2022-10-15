# frozen_string_literal: true

class Board
  attr_accessor :grid, :black_king, :white_king, :current_piece

  def initialize(data = Array.new(8) { Array.new(8) }, hash = {})
    @grid = grid
    @current_piece = hash[:current_piece]
    @black_king = hash[:black_king]
    @white_king = hash[:white_king]
  end

  def update_cur_piece(coord)
    @current_piece = @grid[coord[:row]][coord[:col]]
  end

  def cur_piece_moveable?
    @current_piece.moves.size >= 1 || current_piece.captures.size >= 1
  end

  def valid_piece_movement?(coord)
    row = coord[:row]
    col = coord[:col]
    
    @current_piece.moves.any?([row, col]) || @current_piece.captures.any?([row, col])
  end

  def valid_piece?(coord, color)
    piece = @data[coords[:row]][coords[:col]]
    piece&.color == color
  end

  def in_check?(color)
    king = color == :white ? @white_king : @black_king
    pieces = @grid.flatten(1).compact

    pieces.any? do |piece|
      next unless piece.color != king.color

      piece.captures.include?(king.location)
    end
  end

  private

  def init_pawn_row(color, number)
    8.times { |idx| @grid[number][idx] = Pawn.new(self, { color: color, location: [number, idx]}) }
  end

  def init_row(color, number)
    @data[number] = [
      Rook.new(self, { color: color, location: [number, 0] }),
      Knight.new(self, { color: color, location: [number, 1] }),
      Bishop.new(self, { color: color, location: [number, 2] }),
      Queen.new(self, { color: color, location: [number, 3] }),
      King.new(self, { color: color, location: [number, 4] }),
      Bishop.new(self, { color: color, location: [number, 5] }),
      Knight.new(self, { color: color, location: [number, 6] }),
      Rook.new(self, { color: color, location: [number, 7] })
    ]
  end

end
