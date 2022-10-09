#require_relative "pieces/rook.rb"
require "pry-byebug"

class Board 
  attr_accessor :grid

  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
  end
end
