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
    print_board
    puts "   a   b  c  d  e  f  g  h "
    puts
  end

  def print_board
    @grid.each_with_index do |row, idx|
      print " #{8-idx} "
      print_row(row, idx)
      puts
    end
  end
# This is borrows from rlmoser since it looks so pretty
  def print_row(row, row_index)
    row.each_with_index do |square, index|
      background_color = select_background(row_index, index)
      print_square(row_index, index, square, background_color)
    end
  end

  def select_background(row_index, column_index)
    if @active_piece&.location == [row_index, column_index]
      106
    elsif capture_background?(row_index, column_index)
      41
    elsif @previous_piece&.location == [row_index, column_index]
      46
    elsif (row_index + column_index).even?
      100
    else
      40
    end
  end
  
  def capture_background?(row, column)
    @active_piece&.captures&.any?([row, column]) && @data[row][column]
  end

  # determines the font colors each square based on specific conditions
  # 97 = white font color (chess pieces)
  # 30 = black font color (chess pieces)
  # 90 = dark gray font color (chess pieces)
  # 91 = light red font color (possible moves circle \u25CF)
  # 41 = red font color (possible moves circle \u25CF)
  def print_square(row_index, column_index, square, background)
    if square
      text_color = square.color == :white ? 97 : 30
      color_square(text_color, background, square.symbol)
    elsif @active_piece&.moves&.any?([row_index, column_index])
      color_square(41, background, " \u25CF ")
    else
      color_square(90, background, '   ')
    end
  end

  # prints the final square with specified font, background, and string (symbol)
  def color_square(font, background, string)
    print "\e[#{font};#{background}m#{string}\e[0m"
  end
end