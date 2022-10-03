require_relative "./misc/misc.rb"

class Board
  include Miscellaneous
  
  def initialize
    @grid = [
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square]
    ]
  end

  def display_board
    @grid.each do |row|
      puts row.join('')
    end
  end
    
end

board = Board.new
board.display_board  