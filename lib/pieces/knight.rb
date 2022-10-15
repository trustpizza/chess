require_relative "piece"

class Knight < Piece
  def initialize(board, args)
    super(board, args)
    @symbol = " \u265E "
  end

  def find_possible_moves(board)
    out = []
    move_set.each do |move|
      rank = @location[0] + move[0]
      file = @location[1] + move[1]
      next unless valid_location?(rank, file)
      
      out << [rank, file] unless board.grid[rank][file]
    end
    out
  end

  def find_possible_captures(board)
    out = []
    move_set.each do |move|
      rank = @location[0] + move[0]
      file = @location[1] + move[1]
      next unless @@board.grid[rank][file]

      out << [rank, file] if opposing_piece?(rank, file, board.grid)
    end
    @captures = out
  end

  private 

  def move_set
    [[-1, -2], [1, 2], [-1, 2], [1, -2], [-2, -1], [2, 1], [-2, 1], [2, -1]]
  end
end 