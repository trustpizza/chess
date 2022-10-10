#require_relative "pieces/rook.rb"
require "pry-byebug"

class Board 
  attr_accessor :grid

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
  end
  #I should add rules to the game here! (Checkmate, turn-based, etc.)
  def update_board(pieces)
    pieces.each do |piece|
      update_location(piece, piece.location)
    end
  end

  def update_location(piece, coords)
    @grid[coords[0]][coords[1]] = piece
  end
end
