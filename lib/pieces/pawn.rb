
class Pawn
  attr_reader :children, :parent, :location

  def initialize(location, parent = nil)
    @location = location
    @children = []
    @parent = parent
  end

  def next_moves(out = [])
    moves = [[1,0]]

    moves.map do |move|
      x = @location[0] + move[0]
      y = @location[1] + move[1]

      out << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    out
  end
end