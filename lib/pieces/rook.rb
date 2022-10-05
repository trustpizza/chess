class Rook  
    attr_accessor :children, :parent, :location, :direction

    def initialize(location, parent = nil)
        @location = location
        @children = []
        @parent = parent
        @direction = nil
    end

    def set_location(location)
        @location = location
    end

    def next_moves(out = [])
        moves = [[0,-1],[0,1], [1,0],[-1,0]] #Left, Right, Up, Down

        moves.map do |move|
            x = @location[0] + move[0]
            y = @location[1] + move[1]

            out << [x, y] if x.between?(0, 7) && y.between?(0, 7)
        end
        out     
    end
end