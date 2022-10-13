require "pry-byebug"

class Board 
  attr_accessor :grid, :pieces

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
    @pieces = nil
  end
  
  def update_pieces(arr)
    @pieces = arr
  end
  
  def update_all_pieces(pieces)
    pieces.each do |piece|
      update_location(piece, piece.location)
    end
  end

  def update_location(piece, coords)
    @grid[coords[0]][coords[1]] = piece
  end

  def all_available_moves
    out = []
    
    @pieces.each { |piece| out << piece.valid_moves(piece.possible_moves) }
    out.compact.flatten(1).sort
  end 

  def check?(king_location)
    all_available_moves.any? { |move| move == king_location }
  end

  def in_checkmate?(king_possible_locations)
    true if king_possible_locations.all? { |km| check?(km) }
    false
  end

end
