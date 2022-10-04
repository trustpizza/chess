
require 'pry-byebug'
class Pawn
  attr_reader :symbol, :placement

  MOVES = [1,0]
  def initialize(location)
    @symbol = "\u2659" #White pawn
    @placement = location
  end

  def next_moves(out = [])
    moves = [[1,0]]

    moves.map do |move|
      x = @placement[0] + move[0]
      y = @placement[1] + move[1]
      
      out << [x,y] if x.between?(0,7) && y.between?(0,7)
    end

    out
  end



  def update_placement(location)
    @placement = location
  end
end