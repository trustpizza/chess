require_relative "../lib/pieces/piece.rb"
require_relative "../lib/pieces/rook.rb"
require_relative "../lib/board.rb"
require_relative "../lib/pieces/bishop.rb"
require "pry-byebug"

describe Piece do
    describe "#possible_moves" do
        context "Empty board Rook Locations" do 
            it "Locations are the top row and first column" do
                board = Board.new
                rook = Rook.new([0,0], board)

                expect(rook.possible_moves(board)).to eql([[0,1],[0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]])
            end

            it "Locations are the 2nd row and 3rd column" do
                board = Board.new
                rook = Rook.new([2,3], board)

                expect(rook.possible_moves(board)).to eql([[2, 4], [2, 5], [2, 6], [2, 7], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3], [1, 3], [0, 3], [2, 2], [2, 1], [2, 0]])
            end
        end

        context "Empty Board Bishop Locations" do
            it "Locations are the down-left diagonal" do
                board = Board.new
                bishop = Bishop.new([0,0], board)

                expect(bishop.possible_moves(board)).to eql([[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]])
            end
        end
    end

    describe "#legal moves" do 
        context "Board with a piece in the way" do
            it "Locations are only the top row due to a blockage" do 
                board = Board.new
                bishop = Bishop.new([1,0], board)
                board.grid[1][0] = bishop

                rook = Rook.new([0,0], board)

                expect(rook.valid_moves(rook.possible_moves(board), board)).to eql([[0,1],[0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [1,0]])
            end

            it "locations are only the left top and bottom rows, as well as the bishop piece" do
                board = Board.new
                bishop = Bishop.new([4,4], board)
                board.grid[4][4] = Bishop

                rook = Rook.new([4,3], board)
                
                expect(rook.valid_moves(rook.possible_moves(board), board)).to eql([[4, 4], [4, 2], [4, 1], [4, 0], [3, 3], [2, 3], [1, 3], [0, 3], [5, 3], [6, 3], [7, 3]])
            end

            it "The same but for bishops" do
                board = Board.new
                rook = Rook.new([1,1], board)
                board.grid[1][1] = rook

                bishop = Bishop.new([0,0],board)

                expect(bishop.valid_moves(bishop.possible_moves(board), board)).to eql([[1,1]])
            end
        end
    end
end
