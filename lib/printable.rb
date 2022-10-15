require "colorize"

module Printable
  private

  def white_square
    "\u2B1C"
  end

  def black_square
      "\u2B1B"
  end

  def print_chess_board
    system 'clear' 
    puts
    puts "   a b c d e f g h   "
    print_board
    puts "   a b c d e f g h   "
    puts
  end

  def print_board
    @grid.each_with_index do |row, idx|
      print " #{8-idx} "
      print_row(row, idx)
      print " #{8-idx} "
      puts
    end
  end

  def print_row(row, row_idx)
    puts "#{piece_or_square([square, idx])} | #{piece_or_square([square,idx+1])} | #{piece_or_square([square,idx+2])} | #{piece_or_square([square,idx+3])} | #{piece_or_square([square,idx+4])} | #{piece_or_square([square,idx+5])} | #{piece_or_square([square,idx+6])} | #{piece_or_square([square,idx+7])}"
    puts "---+----+----+----+----+----+----+----"
  end

  def piece_or_square
    piece = @grid[location[0]][location[1]]
    return piece.symbol if piece && piece.color == :white
    return piece.symbol.black if piece && piece.color == :black

    return white_square if location[1].even? && row.even?
    return white_square if location[1].odd? && row.odd?
    return black_square if location[1].even? && row.odd?
    return black_square if location[1].odd? && row.even?
  end
end
