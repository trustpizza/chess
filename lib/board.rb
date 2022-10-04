require_relative "./misc/misc.rb"
require_relative "./pieces/pawn.rb"
require 'pry-byebug'

class Board
  include Miscellaneous
  attr_accessor :grid, :pieces
  
  def initialize
    @grid = Array.new(8) {Array.new(8, nil) }
    @pieces = []
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
  end

  def clear_board
    @grid.each do |row|
      0.upto(7) do |tile|
        row[tile] = nil
      end
    end
  end

  def update_grid 
    clear_board #first clear the board

    # Then Update the board based upon the saved locations of the piece
    @pieces.each do |piece|
      place_piece(piece, piece.placement)
    end
  end

  def select_piece(location)
    @pieces.each do |piece|
      return piece if piece.placement == location
    end
    false 
  end
end

board = Board.new
board.display_board  
pawn = Pawn.new('a1')
pawn2 = Pawn.new('e5')

board.pieces << pawn
board.pieces << pawn2

binding.pry

puts 'hi'