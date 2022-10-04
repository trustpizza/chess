require_relative 'pieces/knight.rb'
require_relative 'pieces/pawn.rb'
require 'pry-byebug'

class Board
  attr_accessor :board, :pieces

  def initialize
    @board = Array.new(8) { Array.new(8,nil) }
    @pieces = []
  end

  def allowed_moves(piece)
    allowed_moves = piece.next_moves
  end

  def move_piece(piece, location)
    allowed_moves = allowed_moves(piece)

    piece.set_location(location) if allowed_moves.include?(location)
  end

end

game = Board.new
binding.pry
game.pieces



  