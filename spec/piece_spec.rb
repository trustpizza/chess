require_relative "../lib/pieces/piece.rb"
require_relative "../lib/pieces/rook.rb"
require_relative "../lib/board.rb"
require_relative "../lib/pieces/bishop.rb"
require_relative "../lib/pieces/queen.rb"
require_relative "../lib/pieces/king.rb"
require_relative "../lib/pieces/knight.rb"
require_relative "../lib/pieces/pawn.rb"

require "pry-byebug"

describe Piece do
    describe "#possible_moves" do
        context "Empty board Rook Locations" do 
            it "Locations are the top row and first column" do
                rook = Rook.new([0,0], 'white')
               
                expect(rook.possible_moves).to eql([[0,1],[0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]])
            end

            it "Locations are the 2nd row and 3rd column" do
                rook = Rook.new([2,3], 'white')

                expect(rook.possible_moves).to eql([[2, 4], [2, 5], [2, 6], [2, 7], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3], [1, 3], [0, 3], [2, 2], [2, 1], [2, 0]])
            end
        end

        context "Empty Board Bishop Locations" do
            it "Locations are the down-left diagonal" do
                bishop = Bishop.new([0,0], 'white')

                expect(bishop.possible_moves).to eql([[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]])
            end
        end
    end

    describe "#legal moves" do 
        context "Board with a piece in the way" do
            xit "Locations are only the top row due to a blockage" do #blocked because new board now populates board
                bishop = Bishop.new([1,0], 'white')

                bishop.board.grid[1][0] = bishop

                rook = Rook.new([0,0], 'black')
                
                expect(rook.valid_moves(rook.possible_moves)).to eql([[0,1],[0,2], [0,3], [0,4], [0,5], [0,6], [0,7], [1,0]])
            end

            xit "locations are only the left top and bottom rows, as well as the bishop piece" do
                bishop = Bishop.new([4,4], 'white')
                bishop.board.grid[4][4] = bishop

                rook = Rook.new([4,3], 'black')
                
                expect(rook.valid_moves(rook.possible_moves)).to eql([[4, 4], [4, 2], [4, 1], [4, 0], [3, 3], [2, 3], [1, 3], [0, 3], [5, 3], [6, 3], [7, 3]])
            end

            it "The same but for bishops" do
                rook = Rook.new([1,1], "white")
                rook.board.grid[1][1] = rook

                bishop = Bishop.new([0,0], "black")

                expect(bishop.valid_moves(bishop.possible_moves)).to eql([[1,1]])
            end

            it "Pawns can move 2 spaces on their first move" do 
                pawn = Pawn.new([1,1], 'white')
                pawn.board.grid[1][1] = pawn

                expect(pawn.valid_moves(pawn.possible_moves)).to eql([[2,1], [3,1]])
            end

            it "Pawn can move only 1 place on their second move" do 
                pawn = Pawn.new([2,2], 'white')
                pawn.board.grid[2][2] = pawn

                expect(pawn.valid_moves(pawn.possible_moves)).to eql([[3,2]])
            end

            it "Black pawn moves 2 spaces on first move" do
                pawn = Pawn.new([6,0], 'black')
                pawn.board.grid[6][0] = pawn

                expect(pawn.valid_moves(pawn.possible_moves)).to eql([[5,0], [4,0]])
            end

            it "Black pawn moves 1 space on second move" do 
                pawn = Pawn.new([5,0], 'black')
                pawn.board.grid[5][0] = pawn

                expect(pawn.valid_moves(pawn.possible_moves)).to eql([[4,0]])
            end
        end

        context "Blocking each piece" do 
            it "Pawn blocked" do 
                rook = Rook.new([1,0], "white")
                rook.board.grid[1][0] = rook

                pawn = Pawn.new([0,0], 'white')
                
                expect(pawn.valid_moves(pawn.possible_moves)).to eql([])
            end

            it "rook blocked" do 
                rook = Rook.new([1,0], "white")
                bishop = Bishop.new([0,1], 'white')
                rook.board.grid[1][0] = rook
                rook.board.grid[0][1] = bishop

                rook1 = Rook.new([0,0], 'white')
                
                expect(rook1.valid_moves(rook1.possible_moves)).to eql([])
            end
        end
    end
end
