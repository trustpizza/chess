require_relative "../lib/pieces/piece.rb"
require_relative "../lib/pieces/rook.rb"
require_relative "../lib/board.rb"
require_relative "../lib/pieces/bishop.rb"
require_relative "../lib/pieces/queen.rb"
require_relative "../lib/pieces/king.rb"
require_relative "../lib/pieces/knight.rb"
require_relative "../lib/pieces/pawn.rb"
require_relative "../lib/chess.rb"

describe Chess do
    describe "#Initialize" do
        context "All possible moves are only Knight and Pawn moves" do
            it "New Game Movements" do
                chess = Chess.new
                out = []

                chess.pieces.each { |piece| out << piece.valid_moves(piece.possible_moves(chess.board), chess.board) }

                expect(out.flatten(1).sort).to eql([[2, 0], [2, 0], [2, 1], [2, 2], [2, 2], [2, 3], [2, 4], [2, 5], [2, 5], [2, 6], [2, 7], [2, 7], [5, 0], [5, 0], [5, 1], [5, 2], [5, 2], [5, 3], [5, 4], [5, 5], [5, 5], [5, 6], [5, 7], [5, 7]])
            end 
        end
    end
end
