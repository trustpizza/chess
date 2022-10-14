<<<<<<< HEAD
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
    i = 0
    puts "#{piece_or_square1([0,0])} | #{piece_or_square1([0,1])} | #{piece_or_square1([0,2])} | #{piece_or_square1([0,3])} | #{piece_or_square1([0,4])} | #{piece_or_square1([0,5])} | #{piece_or_square1([0,6])} | #{piece_or_square1([0,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([1,0])} | #{piece_or_square2([1,1])} | #{piece_or_square2([1,2])} | #{piece_or_square2([1,3])} | #{piece_or_square2([1,4])} | #{piece_or_square2([1,5])} | #{piece_or_square2([1,6])} | #{piece_or_square2([1,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square1([2,0])} | #{piece_or_square1([2,1])} | #{piece_or_square1([2,2])} | #{piece_or_square1([2,3])} | #{piece_or_square1([2,4])} | #{piece_or_square1([2,5])} | #{piece_or_square1([2,6])} | #{piece_or_square1([2,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([3,0])} | #{piece_or_square2([3,1])} | #{piece_or_square2([3,2])} | #{piece_or_square2([3,3])} | #{piece_or_square2([3,4])} | #{piece_or_square2([3,5])} | #{piece_or_square2([3,6])} | #{piece_or_square2([3,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square1([4,0])} | #{piece_or_square1([4,1])} | #{piece_or_square1([4,2])} | #{piece_or_square1([4,3])} | #{piece_or_square1([4,4])} | #{piece_or_square1([4,5])} | #{piece_or_square1([4,6])} | #{piece_or_square1([4,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([5,0])} | #{piece_or_square2([5,1])} | #{piece_or_square2([5,2])} | #{piece_or_square2([5,3])} | #{piece_or_square2([5,4])} | #{piece_or_square2([5,5])} | #{piece_or_square2([5,6])} | #{piece_or_square2([5,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square1([6,0])} | #{piece_or_square1([6,1])} | #{piece_or_square1([6,2])} | #{piece_or_square1([6,3])} | #{piece_or_square1([6,4])} | #{piece_or_square1([6,5])} | #{piece_or_square1([6,6])} | #{piece_or_square1([6,7])}"
    puts "---+----+----+----+----+----+----+----"
    puts "#{piece_or_square2([7,0])} | #{piece_or_square2([7,1])} | #{piece_or_square2([7,2])} | #{piece_or_square2([7,3])} | #{piece_or_square2([7,4])} | #{piece_or_square2([7,5])} | #{piece_or_square2([7,6])} | #{piece_or_square2([7,7])}"
    puts "---+----+----+----+----+----+----+----"
  end

  def piece_or_square1(location)
    return @grid[location[0]][location[1]].symbol unless @grid[location[0]][location[1]].nil?
    
    return white_square if location[1].even?
    return black_square if location[1].odd?
  end

  def piece_or_square2(location)
    return @grid[location[0]][location[1]].symbol unless @grid[location[0]][location[1]].nil?
    
    return white_square if location[1].odd?
    return black_square if location[1].even?
=======
#require_relative "pieces/rook.rb"
require "pry-byebug"

class Board 
  attr_accessor :grid

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
>>>>>>> origin/test
  end
end
