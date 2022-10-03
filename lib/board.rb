require_relative "./misc/misc.rb"

class Board
  include Miscellaneous
  
  def initialize
    @grid = [
      [8, white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [7, black_square, white_square, black_square, white_square, black_square, white_square, black_square, white_square],
      [6, white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [5, black_square, white_square, black_square, white_square, black_square, white_square, black_square, white_square],
      [4, white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [3, black_square, white_square, black_square, white_square, black_square, white_square, black_square, white_square],
      [2, white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
      [1, black_square, white_square, black_square, white_square, black_square, white_square, black_square, white_square],
    ]
  end

  def display_board
    @grid.each do |row|
      puts row.join('')
    end
    puts "  a b c d e f g h"
  end
    
end

board = Board.new
board.display_board  