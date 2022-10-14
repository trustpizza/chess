require_relative "../board.rb"
require_relative "piece"

class King < Piece
  attr_accessor :location

  def initialize(location, color)
    super(location, color)
  end

  def move_set
    [[0,1],[1,0],[-1,0],[0,-1], [1,1], [-1,1], [1,-1], [-1, -1]]
  end

  def valid_moves(possible_moves)
      remove_same_colors(possible_moves)   
  end

  def symbol
    return " \u2654" if self.color == 'white'
    return " \u265A" if self.color == 'black'
  end

  private 

  def make_moves(rank_delta, file_delta)
    rank = location[0] + rank_delta
    file = location[1] + file_delta
    
    out = []
    out << [rank, file] if valid_location?(rank,file)

    out
  end
end