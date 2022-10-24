# frozen_string_literal: true

require_relative '../board'
require_relative '../move_validator'


class Piece
  attr_reader :color, :location, :symbol, :moves, :captures, :moved

  def initialize(board, args)
    @@board = board
    @color = args[:color]
    @location = args[:location]
    @symbol = nil # Will be reset at the child class
    @moves = []
    @captures = []
    @moved = false
  end

  def update_location(row, col)
    @location = [row, col]
    @moved = true
  end

  def current_moves(board)
    possible_moves = find_possible_moves(board)
    @moves = remove_invalid_moves(board, possible_moves)
  end

  def current_captures(board)
    possible_captures = find_possible_captures(board)
    @captures = remove_invalid_moves(board, possible_captures)
  end

  def find_possible_moves(board)
    moves = move_set.reduce([]) do |out, move|
      out << create_moves(board.grid, move[0], move[1])
    end

    moves.compact.flatten(1)
  end

  def find_possible_captures(board)
    moves = move_set.reduce([]) do |out, move|
      out << create_captures(board.grid, move[0], move[1])
    end

    moves.compact
  end

  def remove_invalid_moves(board, moves)
    return moves unless moves.size.positive? # empty move_sets are FINE
    
    temp = Marshal.load(Marshal.dump(board))
    validator = MoveValidator.new(location, temp, moves)
    validator.verify_possible_moves
  end

  def update(board)
    current_captures(board)
    current_moves(board)
  end

  private

  # This take 1 of items from the move_set arr and continues applying it until it is no longer between 0..7 OR has a piece
  def create_moves(grid, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    out = []

    while valid_location?(rank, file)
      break if grid[rank][file]

      out << [rank, file]
      rank += rank_change
      file += file_change
    end
    out
  end

  def create_captures(grid, rank_change, file_change)
    rank = @location[0] + rank_change # Applies the
    file = @location[1] + file_change
    while valid_location?(rank, file)
      break if grid[rank, file]

      rank += rank_change
      file += file_change
    end
    [rank, file] if opposing_piece?(rank, file, grid)
  end

  def valid_location?(rank, file)
    rank.between?(0,7) && file.between?(0,7)
  end

  def opposing_piece?(rank, file, grid)
    return unless valid_location?(rank, file)

    piece = grid[rank][file]
    piece && piece.color != color
  end
end
