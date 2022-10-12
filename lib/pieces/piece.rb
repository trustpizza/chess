require_relative "../board.rb"

class Piece 
    attr_reader :color

    def initialize(location, board, color)
        @location = location

        @board = board

        @color = color
    end

    def location
        @location
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

    def valid_moves(possible_moves, board)
        row = row(possible_moves)
        col = col(possible_moves) 
        left_diag = left_diag(possible_moves)
        right_diag = right_diag(possible_moves)

        right_row = remove_invalids(second_half(row))
        left_row = remove_invalids(first_half(row).reverse)
        
        up_col = remove_invalids(first_half(col).reverse)
        down_col = remove_invalids(second_half(col))

        #These methods create their respective groupings of moves.  Be sure to uniq! the final product to get rid of any duplicates since they do technically include non diagonal movements ;)
        upper_left_diag = remove_invalids(first_half(left_diag).reverse)
        lower_left_diag = remove_invalids(second_half(left_diag))

        upper_right_diag = remove_invalids(first_half(right_diag).reverse)
        lower_right_diag = remove_invalids(second_half(right_diag))
        
        valid_moves = right_row + left_row + up_col + down_col + upper_left_diag + lower_left_diag + upper_right_diag + lower_right_diag
        valid_moves.uniq! # All moves INCLUDING same-colored pieces
        
        remove_same_colors(valid_moves, board)
    end

    private

    def make_moves(grid, rank_delta, file_delta)
        rank = location[0] + rank_delta
        file = location[1] + file_delta
        out = []
        while valid_location?(rank, file)
            #break if grid[rank][file] # This cuts out all moves in inhabited places and needs to be refactored!

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

        possible_moves.each { |move| out << move if move[0] == location[0] }
        
        out
    end

    def col(possible_moves)
        out = []
        
        possible_moves.each { |move| out << move if move[1] == location[1] }

        out
    end


    def left_diag(possible_moves) # The Starting High in the Left going Lower to the right diagonal
        out = []
        
        possible_moves.each { |move| out << move if move[1] < location[1] }

        out
    end

    def right_diag(possible_moves)
        out = []

        possible_moves.each { |move| out << move if move[1] > location[1] }

        out
    end

    def first_half(arr)
        arr << location
        arr = arr.uniq.sort

        first_half = arr[0..arr.index(location)]
        first_half.pop

        first_half
    end

    def second_half(arr)

        arr << location
        arr = arr.uniq.sort

        second_half = arr[arr.index(location)..]
        
        second_half.shift

        second_half
    end

    def remove_invalids(arr)
        return arr if arr.empty?

        out = []

        arr.each do |move|
            out << move
            break unless @board.grid[move[0]][move[1]].nil?
        end

        out
    end

    def remove_same_colors(moves, board)
        moves.reject do |move|
            pc = board.grid[move[0]][move[1]]
            pc && pc.color == self.color
        end
    end
end
