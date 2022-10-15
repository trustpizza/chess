# frozen_string_literal: true

require_relative 'pieces'

class King < Piece
  def initialize(board, args)
    super(board, args)
    symbol = " \u265A "
  end

  def find_possible_moves(board)
    moves = move_set.reduce([]) do |out, move|
      out << create_moves(board.grid, move[0], move[1])
    end
    # Add castl-ing later
    moves.compact.flatten(1)
  end

  private

  def move_set
    [[0, 1], [0, -1], [-1, 0], [1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
end
