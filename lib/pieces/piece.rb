require_relative "../board.rb"

class Piece 
    attr_reader :location, :rank, :file
    
    def initialize(location, board)
        @location = location

        @board = board
    end

    def update_location(rank, file)
        @location = [rank, file]
    end



    def possible_moves(board)
        moves = move_set.reduce([]) do |out, move|
            out << make_moves(board.grid, move[0], move[1]) #Function that takes the board, takes move[0] and move[1] to determine available moves
        end
        moves.compact.flatten(1)   
        binding.pry
    end

    def invalid_moves(board, possible_moves)
        
        #To Check for invalid moves
        # Search the board at every possible move for a piece
        # If there is a piece there, and it is not valid (not yet worrying about color, checkmate, etc.)
        # If there is a piece there all further moves along that branch are ALSO invalid

        # Create an output arr called out
        # Take the possible moves array and go through each of the [rank, file] pairings
        # If any of the values 
    end
    private


    def make_moves(grid, rank_delta, file_delta)
        rank = location[0] + rank_delta
        file = location[1] + file_delta
        out = []
        while valid_location?(rank, file)
            break if grid[rank][file]

            out << [rank,file]
            rank += rank_delta
            file += file_delta
        end
        out
    end

    def valid_location?(rank, file)
        rank.between?(0,7) && file.between?(0,7)
    end


end
