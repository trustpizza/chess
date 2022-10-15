

class MoveValidator
  
  def initialize(location, board, moves, piece = board.grid[location[0]][location[1]])
    @current_location = location
    @board = board
    @moves = moves
    @piece = piece
    @king_location = nil
  end

  def verify_possible_moves
    @king_location = find_king
    @board.data[@current_location[0]][@current_location[1]] = nil
    @moves.select { |move| legal_move?(move) }
  end

  private

  def legal_move?(move)
    captured_piece = @board.dataa[move[0]][move[1]]
    move_current_piece(move)
    king = @king_location || move
    out = safe_king?(king)
    @board.data[move[0]][move[1]] = captured_piece
    out
  end

  def move_current_piece(move)
    @board.data[move[0]][move[1]] = @current_piece
    @current_piece.update_location(move[0], move[1])
  end

  def safe_king?(kings_location)
    pieces = @board.data.flatten(1).compact
    pieces.none? do |piece|
      next unless piece.color != @current_piece.color

      captures = piece.find_possible_captures(board)
      captures.include?(king_location)
    end
  end
  
  def find_king
    return if @current_piece.symbol = " \u265A "

    if @current_piece.color == :black
      @board.black_king.location
    else
      @board.white_king.location
    end
  end
end


