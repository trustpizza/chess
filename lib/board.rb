require_relative "misc/misc.rb"
require "pry-byebug"

class Board 
  attr_accessor :grid, :pieces

  include Misc

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
    @pieces = nil
  end
  
  def update_pieces(arr)
    @pieces = arr
  end
  
  def update_all_pieces(pieces)
    pieces.each do |piece|
      update_location(piece, piece.location)
    end
  end

  def update_location(piece, coords)
    @grid[coords[0]][coords[1]] = piece
  end

  def all_available_moves
    out = []

    @pieces.each { |piece| out << piece.valid_moves(piece.possible_moves) }
    out.compact.flatten(1).sort
  end 

  def check?(king_location)
    all_available_moves.any? { |move| move == king_location }
  end

  def in_checkmate?(king)
    (king.valid_moves(king.possible_moves).empty? || king.valid_moves(king.possible_moves).all? { |km| check?(km) } ) && check?(king.location)
  end

  def print_board
    i = 1
    puts "#{piece_or_square1([i,0])} | #{piece_or_square1([i,1])} | #{piece_or_square1([i,2])} | #{piece_or_square1([i,3])} | #{piece_or_square1([i,4])} | #{piece_or_square1([i,5])} | #{piece_or_square1([i,6])} | #{piece_or_square1([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([i,0])} | #{piece_or_square2([i,1])} | #{piece_or_square2([i,2])} | #{piece_or_square2([i,3])} | #{piece_or_square2([i,4])} | #{piece_or_square2([i,5])} | #{piece_or_square2([i,6])} | #{piece_or_square2([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square1([i,0])} | #{piece_or_square1([i,1])} | #{piece_or_square1([i,2])} | #{piece_or_square1([i,3])} | #{piece_or_square1([i,4])} | #{piece_or_square1([i,5])} | #{piece_or_square1([i,6])} | #{piece_or_square1([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([i,0])} | #{piece_or_square2([i,1])} | #{piece_or_square2([i,2])} | #{piece_or_square2([i,3])} | #{piece_or_square2([i,4])} | #{piece_or_square2([i,5])} | #{piece_or_square2([i,6])} | #{piece_or_square2([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square1([i,0])} | #{piece_or_square1([i,1])} | #{piece_or_square1([i,2])} | #{piece_or_square1([i,3])} | #{piece_or_square1([i,4])} | #{piece_or_square1([i,5])} | #{piece_or_square1([i,6])} | #{piece_or_square1([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([i,0])} | #{piece_or_square2([i,1])} | #{piece_or_square2([i,2])} | #{piece_or_square2([i,3])} | #{piece_or_square2([i,4])} | #{piece_or_square2([i,5])} | #{piece_or_square2([i,6])} | #{piece_or_square2([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square1([i,0])} | #{piece_or_square1([i,1])} | #{piece_or_square1([i,2])} | #{piece_or_square1([i,3])} | #{piece_or_square1([i,4])} | #{piece_or_square1([i,5])} | #{piece_or_square1([i,6])} | #{piece_or_square1([i,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([i,0])} | #{piece_or_square2([i,1])} | #{piece_or_square2([i,2])} | #{piece_or_square2([i,3])} | #{piece_or_square2([i,4])} | #{piece_or_square2([i,5])} | #{piece_or_square2([i,6])} | #{piece_or_square2([i,7])}"
    puts "---+----+----+----+----+----+----+----"
  end

  def piece_or_square1(location)
    return location unless @grid[location[0]][location[1]].nil?
    
    return white_square if location[1].even?
    return black_square if location[1].odd?
  end

  def piece_or_square2(location)
    return location unless @grid[location[0]][location[1]].nil?
    
    return white_square if location[1].odd?
    return black_square if location[1].even?
  end
end

board = Board.new
#binding.pry
board.print_board
