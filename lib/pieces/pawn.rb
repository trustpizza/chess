require_relative "../board.rb"

class Pawn < Piece
  
  def initialize(location, board, color)
    super(location, board, color)
  end

  def move_set
    return [[1,0]] if @color == 'white'
    return [[-1,0]] if @color == 'black'
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
end