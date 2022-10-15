<<<<<<< HEAD
<<<<<<< HEAD
require_relative "misc/misc.rb"
require "pry-byebug"
=======
# frozen_string_literal: true
>>>>>>> origin/chess_2

class Board
  attr_accessor :grid, :black_king, :white_king, :current_piece

  def initialize(data = Array.new(8) { Array.new(8) }, hash = {})
    @grid = grid
    @current_piece = hash[:current_piece]
    @last_piece = hash[:last_piece]
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

  def new_game
    init_row(:black, 0)
    init_pawn_row(:black, 1)
    init_row(:white, 7)
    init_pawn_row(:white, 6)
    @white_king = @data[7][4]
    @black_king = @data[0][4]

    update_all
  end

  def game_over?
    return false unless @last_piece

    prior_color = @last_piece.color == :white ? :black : :white
    no_moves_or_captures(prior_color)
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

  def update_all
    pieces = @data.flatten(1).compact
    pieces.each { |piece| piece.update(self) }
  end

  def no_moves_or_captures(color)
    pieces = @data.flatten(1).compact
    @pieces.none? do |piece|
      next unless piece.color == color

<<<<<<< HEAD
  def piece_or_square2(location)
    return @grid[location[0]][location[1]].symbol unless @grid[location[0]][location[1]].nil?
    
    return white_square if location[1].odd?
    return black_square if location[1].even?
=======
#require_relative "pieces/rook.rb"
require "pry-byebug"

class Board 
  attr_accessor :grid

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
>>>>>>> origin/test
=======
      piece.moves.size.positive? || piece.captures.size.positive?
    end
>>>>>>> origin/chess_2
  end
end
