require_relative "../board.rb"
require "pry-byebug"

class Pawn < Piece
  
  def initialize(location, board, color)
    super(location, board, color)
  end

  def move_set
    return [[1,0]] if @color == 'white'
    return [[-1,0]] if @color == 'black'
  end

  def possible_moves(board)
    moves = move_set.reduce([]) do |out, move|
        out << make_moves(board.grid, move[0], move[1]) #Function that takes the board, takes move[0] and move[1] to determine available moves
    end
    moves[0] << first_moves
    moves.compact.flatten(1)
  end

  def valid_moves(possible_moves, board)
      remove_same_colors(possible_moves, board)
  end

  private 

  def make_moves(grid, rank_delta, file_delta)
    rank = location[0] + rank_delta
    file = location[1] + file_delta
    out = []
    out << [rank, file] if valid_location?(rank,file)

    out
  end

  def first_moves
    return [3, @location[1]] if (@color == 'white' && @location[0] == 1)
    return [4, @location[1]] if (@color == 'black' && @location[0] == 6)
  end
end
