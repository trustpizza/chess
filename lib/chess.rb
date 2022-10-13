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
    attr_reader :board, :pieces, :white_king, :black_king

    def initialize
        @board = Board.new
        
        new_game
    end

    def send_pieces
        @board.pieces = @pieces
    end

    def all_available_moves
        out = []

        @pieces.each { |piece| out << piece.valid_moves(piece.possible_moves(board), board) }
        out.compact.flatten(1).sort
    end

    def in_check?(moves, location) #Can later remove this and replace use-case with would_check
        moves.any? { |move| move == location }
    end

    def in_checkmate?(moves)
        #Take all the moves that all pieces have
        # Take all the moves that a king has
        # For each of the king's moves see if any of the pieces put it into check
        # If this is true for ALL moves && current move, then checkmate
    end

    private 

    def new_game
        @pieces = new_white_pieces + new_black_pieces

        @board.update_board(pieces)
    end

    def new_white_pieces
        out = []
        for i in 0..7
            pawn = Pawn.new([1, i], board, 'white')
            out << pawn
        end
        rook1 = Rook.new([0,0], board, 'white')
        rook2 = Rook.new([0,7], board, 'white')

        knight1 = Knight.new([0,1], board, 'white')
        knight2 = Knight.new([0,6], board, 'white')

        bishop1 = Bishop.new([0,2], board, 'white')
        bishop2 = Bishop.new([0,5], board, 'white')

        queen = Queen.new([0,3], board, 'white')
        @white_king = King.new([0,4], board, 'white')
        
        out += [rook1, rook2, knight1, knight2, bishop1, bishop2, queen, @white_king]
    end

    def new_black_pieces
        out = []
        for i in 0..7
            pawn = Pawn.new([6, i], board, 'black')
            out << pawn
        end
        rook1 = Rook.new([7,0], board, 'black')
        rook2 = Rook.new([7,7], board, 'black')

        knight1 = Knight.new([7,1], board, 'black')
        knight2 = Knight.new([7,6], board, 'black')

        bishop1 = Bishop.new([7,2], board, 'black')
        bishop2 = Bishop.new([7,5], board, 'black')

        queen = Queen.new([7,4], board, 'black')
        @black_king = King.new([7,3], board, 'black')
        
        out += [rook1, rook2, knight1, knight2, bishop1, bishop2, queen, @black_king]
    end

    def would_check?(moves, location)
        moves.any? { |move| move == location }
    end
end

x = Chess.new
x.in_check?(x.all_available_moves, x.white_king.location)
binding.pry
x