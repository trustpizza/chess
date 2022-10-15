# frozen_string_literal: true

<<<<<<< HEAD
class Piece 
<<<<<<< HEAD
    attr_accessor :board, :location
    attr_reader :color
=======
require_relative '../board'
require_relative '../move_validator'
require 'rubocop'
>>>>>>> origin/chess_2

class Piece
  attr_reader :color, :location, :symbol, :moves, :captures, :moved

  def initialize(board, args)
    @color = args[:color]
    @location = args[:location]
    @symbol = nil # Will be reset at the child class
    @moves = []
    @captures = []
    @moved = false
  end

  def update_location(row, col)
    @location = [row, col]
    @moved = true
  end

  def current_moves(board)
    possible_moves = find_possible_moves(board)
    @moves = remove_invalid_moves(board, possible_moves)
  end

  def current_captures(board)
    possible_captures = find_possible_captures(board)
    @captures = remove_invalid_moves(board, possible_captures)
  end

  def find_possible_moves(board)
    moves = move_set.reduce([]) do |out, move|
      out << create_moves(board.grid, move[0], move[1])
    end

<<<<<<< HEAD
    def board
        @@board
    end
    
=======
    attr_reader :location, :color
    
    def initialize(location, board, color)
        @location = location

        @board = board

        @color = color
    end

>>>>>>> origin/test
    def update_location(rank, file)
        @location = [rank, file]
    end

<<<<<<< HEAD
    def possible_moves
        moves = move_set.reduce([]) do |out, move|
            out << make_moves(move[0], move[1]) #Function that takes the board, takes move[0] and move[1] to determine available moves
=======
    def possible_moves(board)
        moves = move_set.reduce([]) do |out, move|
            out << make_moves(board.grid, move[0], move[1]) #Function that takes the board, takes move[0] and move[1] to determine available moves
>>>>>>> origin/test
        end
        moves.compact.flatten(1)   
    end

<<<<<<< HEAD
    def valid_moves(possible_moves)
=======
    def valid_moves(possible_moves, board)
>>>>>>> origin/test
        row = row(possible_moves)
        col = col(possible_moves) 
        left_diag = left_diag(possible_moves)
        right_diag = right_diag(possible_moves)
=======
    moves.compact.flatten(1)
  end

  def find_possible_captures(board)
    moves = move_set.reduce([]) do |out, move|
      out << create_captures(board.grid, move[0], move[1])
    end

    moves.compact
  end

  def remove_invalid_moves(board, moves)
    return moves unless moves.size.positive? # empty move_sets are FINE

    temp = Marshal.load(Marshal.dump(board))
    validator = MoveValidator.new(location, temp, moves)
    validator.verify_possible_moves
  end

  def update(board)
    current_captures(board)
    current_moves(board)
  end

  private

  # This take 1 of items from the move_set arr and continues applying it until it is no longer between 0..7 OR has a piece
  def create_moves(grid, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    out = []

    while valid_location?(rank, file)
      break if grid[rank][file]

      out << [rank, file]
      rank += rank_change
      file += file_change
    end
    out
  end

  def create_captures(grid, rank_change, file_change)
    rank = @location[0] + rank_change # Applies the
    file = @location[1] + file_change
    while valid_location?(rank, file)
      break if data[rank, file]

      rank += rank_change
      file += file_change
    end

    [rank, file] if oppossing_piece?(grid, rank, file)
  end
>>>>>>> origin/chess_2

  def valid_location?(rank, file)
    rank.between?(0..7) && file.between?(0..7)
  end

  def oppossing_piece?(grid, rank, file)
    return unless valid_location?(rank, file)

<<<<<<< HEAD
        upper_right_diag = remove_invalids(first_half(right_diag).reverse)
        lower_right_diag = remove_invalids(second_half(right_diag))
        
        valid_moves = right_row + left_row + up_col + down_col + upper_left_diag + lower_left_diag + upper_right_diag + lower_right_diag
        valid_moves.uniq! # All moves INCLUDING same-colored pieces
<<<<<<< HEAD
        
        remove_same_colors(valid_moves)
=======

        remove_same_colors(valid_moves, board)
>>>>>>> origin/test
    end

    private

<<<<<<< HEAD
    def make_moves(rank_delta, file_delta)
=======
    def make_moves(grid, rank_delta, file_delta)
>>>>>>> origin/test
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
<<<<<<< HEAD
            break unless @@board.grid[move[0]][move[1]].nil?
=======
            break unless @board.grid[move[0]][move[1]].nil?
>>>>>>> origin/test
        end

        out
    end

<<<<<<< HEAD
    def remove_same_colors(moves)
        moves.compact!
        moves.reject do |move|
            pc = @@board.grid[move[0]][move[1]]
            pc && pc.color == self.color
=======
    def remove_same_colors(moves, board)
        moves.each do |move|
            unless @board.grid[move[0]][move[1]].nil?
                #binding.pry
                if @board.grid[move[0]][move[1]].color == self.color 
                    moves.delete(move)
                end
            end
>>>>>>> origin/test
        end
    end
=======
    piece = data[rank][file]
    piece && piece.color != color
  end
>>>>>>> origin/chess_2
end
