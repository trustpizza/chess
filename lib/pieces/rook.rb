# frozen_string_literal: true

require_relative 'pieces'

class Rook < Piece
  def initialize(board, args)
    super(board, args)
    @symbol = " \u265C "
  end

  private

  def move_set
    [[0, 1], [0, -1], [-1, 0], [1, 0]]
  end
end
