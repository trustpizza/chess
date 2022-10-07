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
    end

    def invalid_moves(possible_moves, board)
        row = row(possible_moves)
        col = col(possible_moves) 

        right_row = right_row(row)
        left_row = left_row(row)

        up_col = up_col(col)
        down_col = down_col(col)
        binding.pry

        # Take the possible moves and split them into two arrays, Arrays with the same Rank and Arrays with the same file (later add diagonals)
        # For the Rank array, check the board for each spot that exists in that array
            # If all are nil, return that array
            
            # If any is full, split the array at that point and return ONLY the closer array (even if nil)
        # 
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

    def row(possible_moves)
        out = []

        possible_moves.each do |move|
            out << move if move[0] == location[0]
        end
        out
    end

    def left_row(row)
        row << location
        row = row.uniq.sort
            
        left_row = row[0..row.index(location)] 
        left_row.pop

        left_row
    end

    def right_row(row)
        row << location
        row = row.uniq.sort

        right_row = row[row.index(location)..]

        right_row.shift
        right_row
    end

    def col(possible_moves)
        out = []

        possible_moves.each do |move|
            out << move if move[1] == location[1]
        end
    
        out
    end

    def up_col(col)
        col << location
        col = col.uniq.sort

        up_col = col[..col.index(location)]

        up_col.pop
        up_col
    end

    def down_col(col)
        col << location
        col = col.uniq.sort

        down_col = col[col.index(location)..]

        down_col.shift
        down_col
    end
end


