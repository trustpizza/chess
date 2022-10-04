require_relative 'pieces/knight.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require 'pry-byebug'

class Board
  attr_accessor :board, :pieces

  def initialize
    @board = Array.new(8) { Array.new(8,nil) }
    @pieces = []
  end

  def allowed_moves(piece)
    piece.next_moves
  end

  def moves_tree(piece, start, destination)
    piece_class = piece.class
    queue = [piece_class.new(start)]
    current = queue.shift

    until current.location == destination
      current.next_moves.each do |move|
        current.children << new_piece = piece_class.new(move, current)
        queue << new_piece
      end
      current = queue.shift
    end

    current
  end

  def move_piece(piece, location)
    allowed_moves = allowed_moves(piece)

    if piece.is_a?(Knight) || piece.is_a?(Pawn)
      piece.set_location(location) if allowed_moves.include?(location)
    elsif piece.is_a?(Rook)
      start = piece.location
      piece.set_location(location) if moves_tree(piece, start, location)
      binding.pry

    end
  end
end

game = Board.new
pawn = Pawn.new([1,0])
rook = Rook.new([3,3])
game.move_piece(rook, [3,0])

game.pieces



  