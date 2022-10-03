require_relative "./misc/misc.rb"
#require_relative "./pieces/pawn.rb"
require 'pry-byebug'

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
    
  def letter_location(location)
    location = location.split(' ')
    location[0] 
  end

  def letter_mapping(letter)
    letters = { 'a'=>1, 'b'=>2, 'c'=>3, 'd'=>4, 'e'=>5, 'f'=>6, 'g'=>7, 'h'=>8 }
    letters[letter]
  end

  def number_location(location)
    location = location.split(' ')
    location[1]
  end


  def place_piece(piece, location)
    location_letter = location_letter(location)
    location_number = location_number(location)

    grid[location_letter][location_number] = piece.symbol #Idea here is to place the piece's symbol to that spot in the grid THEN...
    update_location(piece, location) #Update the piece's location
  end

  def update_location(piece, location)
    location_letter = location_letter(location)
    location_number = location_number(location)

    piece.location = grid[location_letter][location_number] #Update the piece's location
  end

end

board = Board.new
board.display_board  