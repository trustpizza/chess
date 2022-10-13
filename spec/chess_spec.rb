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
        context "New Game Movements" do
            it "All possible moves are only Knight and Pawn moves" do
                chess = Chess.new
                        
                expect(chess.all_available_moves).to eql([[2, 0],[2, 0],[2, 1], [2, 2],[2, 2],[2, 3],[2, 4],[2, 5],[2, 5],[2, 6],[2, 7],[2, 7],[3, 0],[3, 1],[3, 2],[3, 3],[3, 4],[3, 5],[3, 6],[3, 7],[4, 0],[4, 1],[4, 2],[4, 3],[4, 4],[4, 5],[4, 6],[4, 7],[5, 0],[5, 0],[5, 1],[5, 2],[5, 2],[5, 3],[5, 4],[5, 5],[5, 5],[5, 6],[5, 7],[5, 7]])
            end 
        end
    end

    describe "#Checkmate" do
        context "No Checkmates" do 
            it "New Game" do
                chess = Chess.new

                chess.pieces.sample.board.update_pieces(chess.pieces)
                
                expect(chess.pieces.sample.board.in_checkmate?(chess.white_king)).to be(false)
            end
            it "New game with black piece" do
                chess = Chess.new
                chess.pieces.sample.board.update_pieces(chess.pieces)
                
                expect(chess.pieces.sample.board.in_checkmate?(chess.black_king)).to be(false)
            end
        end

        context "In Check but NOT checkmate" do
            it "In check" do
                chess = Chess.new
                
                rook = Rook.new([1,3], 'black')

                chess.pieces.sample.board.grid[1][3] = rook

                pieces = rook.board.grid.flatten.compact

                chess.pieces.sample.board.update_pieces(pieces) # Need to update the board associated with the pieces
                chess.update_pieces(pieces)

                expect(chess.pieces.sample.board.check?(chess.white_king.location)).to be(true)
            end

            it "Not in checkmate" do 
                chess = Chess.new
                
                rook = Rook.new([1,3], 'black')

                chess.pieces.sample.board.grid[1][3] = rook

                pieces = rook.board.grid.flatten.compact

                chess.pieces.sample.board.update_pieces(pieces)
                chess.update_pieces(pieces)

                expect(chess.pieces.sample.board.check?(chess.white_king.valid_moves(chess.white_king.possible_moves))).to be(false)
            end
        end
    end
end
