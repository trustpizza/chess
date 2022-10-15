

class MoveValidator
  
  def initialize(location, board, moves, piece = board.grid[location[0]][location[1]])
    @current_location = location
    @board = board
    @current_piece = piece
    @moves = moves
    @piece = piece
    @king_location = nil
  end

  def verify_possible_moves
    @king_location = find_king
    @board.grid[@current_location[0]][@current_location[1]] = nil
    #binding.pry
    @moves.select do |move| 
      legal_move?(move) unless move.nil?
    end
  end

  private

  def legal_move?(move)
    captured_piece = @board.grid[move[0]][move[1]]
    move_current_piece(move)
    king = @king_location || move
    out = safe_king?(king)
    @board.grid[move[0]][move[1]] = captured_piece
    out
  end

  def move_current_piece(move)
    @board.grid[move[0]][move[1]] = @current_piece
    @current_piece.update_location(move[0], move[1])
  end

  def safe_king?(kings_location)
    pieces = @board.grid.flatten(1).compact
    pieces.none? do |piece|
      next unless piece.color != @current_piece.color

      captures = piece.find_possible_captures(@board)
      captures.include?(kings_location)
    end
  end
  
  def find_king
    #binding.pry
    return if @current_piece.symbol == " \u265A "

    if @current_piece.color == :black
      @board.black_king.location
    else
      @board.white_king.location
    end
  end
end


