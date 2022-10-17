
class Movement
  attr_reader :row, :col, :board

  def initialize(board = nil, row = nil, col = nil)
    @board = board
    @row = row
    @col = col
  end

  def update_pieces(board, coords)
    @board = board
    @row = coords[:row]
    @col = coords[:col]
    update_moves
  end

  def update_moves
    update_new_coords
    remove_original_piece
    update_current_piece_location
  end

  def update_new_coords
    @board.grid[row][col] = @board.current_piece
  end

  def remove_original_piece
    location = @board.current_piece.location
    @board.grid[location[0]][location[1]] = nil
  end

  def update_current_piece_location
    @board.current_piece.update_location(row, col)
  end
end