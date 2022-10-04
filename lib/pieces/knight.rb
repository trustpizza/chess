

class Knight
    attr_reader :location
    attr_accessor :children, :parent
  
    def initialize(location, parent = nil)
      @location = location
      @children = []
      @parent = parent
    end
  
    def next_moves(out = [])
      moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]]
  
      moves.map do |move|
        x = @location[0] + move[0]
        y = @location[1] + move[1]
  
        out << [x, y] if x.between?(0, 7) && y.between?(0, 7)
      end
      out
    end
  end