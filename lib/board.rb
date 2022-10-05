require_relative 'pieces/knight.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/king.rb'
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
    binding.pry

    piece_class = piece.class
    queue = [piece_class.new(start)]
    current = queue.shift

    until current.location == destination # This creates an infinite loop if the destination is NEVER available needs refactoring
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
    if piece.is_a?(Knight) || piece.is_a?(Pawn) || piece.is_a?(King)
      if @board[location[0]][location[1]].nil?
        piece.set_location(location) if allowed_moves.include?(location)
      end
    elsif piece.is_a?(Rook) || piece.is_a?(Bishop)
      start = piece.location
      piece.set_location(location) if moves_tree(piece, start, location)
    end

    update_board
  end

  def clear_board
    @board.each do |row|
      0.upto(7) do |tile|
        row[tile] = nil
      end
    end
  end

  def update_board
    clear_board
    
    @pieces.each do |piece|
      place_piece(piece)
    end
  end

  def place_piece(piece)
    @board[piece.location[0]][piece.location[1]] = piece
  end
end

game = Board.new
pawn = Pawn.new([1,0])
king = King.new([1,1])
bishop = Bishop.new([3,3])
rook = Rook.new([5,5])
binding.pry
game.move_piece(pawn, [2,0])






  