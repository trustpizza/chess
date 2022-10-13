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
    attr_reader  :board, :pieces, :white_king, :black_king

    def initialize
        new_game
    end

    def send_pieces
        @board.pieces = @pieces
    end

    def update_pieces(arr)
        @pieces = arr
    end

    def all_available_moves
        out = []
        
        @pieces.each { |piece| out << piece.valid_moves(piece.possible_moves) }
        out.compact.flatten(1).sort
    end

    def select_piece
        puts "Select a rank"
        rank = gets.chomp.to_i
        puts "Select a file"
        file = gets.chomp.to_i

        @pieces.sample.board.grid[rank][file] 
    end

    def move_piece(piece, rank, file)
        original_loc = piece.location

        piece.board.grid[rank][file] = piece
        piece.update_location(rank, file)

        piece.board.grid[original_loc[0]][original_loc[1]] = nil
    end

    private 

    def new_game
        @pieces = new_white_pieces + new_black_pieces

        @pieces.sample.board.update_all_pieces(pieces) #All the pieces share the same board so it shouldn't matter which 
    end

    def new_white_pieces
        out = []
        for i in 0..7
            pawn = Pawn.new([1, i], 'white')
            out << pawn
        end
        rook1 = Rook.new([0,0], 'white')
        rook2 = Rook.new([0,7], 'white')

        knight1 = Knight.new([0,1], 'white')
        knight2 = Knight.new([0,6], 'white')

        bishop1 = Bishop.new([0,2], 'white')
        bishop2 = Bishop.new([0,5], 'white')

        queen = Queen.new([0,4], 'white')
        @white_king = King.new([0,3], 'white')
        
        out += [rook1, rook2, knight1, knight2, bishop1, bishop2, queen, @white_king]
    end

    def new_black_pieces
        out = []
        for i in 0..7
            pawn = Pawn.new([6, i], 'black')
            out << pawn
        end
        rook1 = Rook.new([7,0], 'black')
        rook2 = Rook.new([7,7], 'black')

        knight1 = Knight.new([7,1], 'black')
        knight2 = Knight.new([7,6], 'black')

        bishop1 = Bishop.new([7,2], 'black')
        bishop2 = Bishop.new([7,5], 'black')

        queen = Queen.new([7,4], 'black')
        @black_king = King.new([7,3], 'black')
        
        out += [rook1, rook2, knight1, knight2, bishop1, bishop2, queen, @black_king]
    end
end
