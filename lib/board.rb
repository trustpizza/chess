require_relative "./misc/misc.rb"
require_relative "./pieces/pawn.rb"
require 'pry-byebug'

class Board
  include Miscellaneous
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8, nil) }
  end

  def display_board
    @grid.each do |row|
      puts row.join('')
    end
  end

  def letter_mapping(letter)
    letters = { 'a'=>0, 'b'=>1, 'c'=>2, 'd'=>3, 'e'=>4, 'f'=>5, 'g'=>6, 'h'=>7 }
    letters[letter]
  end

  def letter_location(location)
    location = location.split('')
    letter_mapping(location[0])
  end

  def number_location(location)
    location = location.split('')
    location[1].to_i - 1
  end


  def place_piece(piece, location)
    location_letter = letter_location(location)
    location_number = number_location(location)

    @grid[location_number][location_letter] = piece.symbol #Idea here is to place the piece's symbol to that spot in the grid THEN...
    update_location(piece, location) #Update the piece's location
  end

  def update_location(piece, location)
    location_letter = letter_location(location)
    location_number = number_location(location)

    piece.update_placement(location) #Update the piece's location
  end

end

board = Board.new
board.display_board  
pawn = Pawn.new('a1')
binding.pry

board.place_piece(pawn, pawn.placement)

puts 'hi'