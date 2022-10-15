
require_relative "piece"

class Pawn < Piece
  def initiailze(board, args)
    super(board, args)
    @symbol = "\u265F"
    @moved = false
  end

  def find_possible_moves(board)
    [move_once(board) + move_twice(board)].compact
  end

  def find_possible_captures(board)
    file = @location[1]
    [
      attack(board, file - 1),
      attack(board, file +1)
    ]
  end

  def piece_direction
    color == 'white' ? -1 : 1 #This should only be used on changing the RANK of a piece
  end

  private

  def move_once(board)
    move = [@location[0] + piece_direction, location[1]]
    move unless board.grid[move[0]][move[1]]
  end

  def move_twice(board)
    move = [@location[0] + (piece_direction * 2), location[1]]
    move unless move_twice_invalid?(board, move)
  end

  def move_twice_invalid?(board, move)
    first = move_once(board)
    return true unless first

    @moved || @board.data[move[0]][mov[1]]
  end

  def attack(board, file)
    rank = @location + piece_direction
    return [rank, file] if oppossing_piece?(rank, file, board.grid)
  end
end