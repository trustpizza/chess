require_relative "pieces/piece.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/rook.rb"
require_relative "pieces/bishop.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/king.rb"

require_relative "board.rb"

require "pry-byebug"
class Chess
    attr_reader :board, :pieces

    def initialize
        @board = Board.new
        
        new_game
    end

    def new_game
        binding.pry
        Rook.new([0,0], board, 'color')
    end
end

Chess.new