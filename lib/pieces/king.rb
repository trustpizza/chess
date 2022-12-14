# frozen_string_literal: true

require_relative 'piece'


class King < Piece
  def initialize(board, args)
    super(board, args)
    @symbol = " \u265A "
  end

  def find_possible_moves(board)
    moves = move_set.reduce([]) do |out, move|
      out << create_moves(board.grid, move[0], move[1])
    end
    # Add castl-ing later
    moves.compact.flatten(1)
  end

  private

  def create_moves(grid, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    return unless valid_location?(rank, file)

    [rank, file] unless grid[rank][file]
  end

  def create_captures(grid, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    return unless valid_location?(rank, file)

    [rank, file] if opposing_piece?(rank, file, grid)
  end

  def safe_move?(board, location)
    pieces = board.grid.flatten(1).compact
    pieces.none? do |piece|
      next unless piece.color != color && piece.symbol != symbol

      moves = piece.find_possible_moves(board)
      moves.include?(location)
    end
  end

  def move_set
    [[0, 1], [0, -1], [-1, 0], [1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
end
