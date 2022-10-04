require_relative 'pieces/knight.rb'
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
end


game = Board.new
binding.pry
game.piece_moves([3,3])

  