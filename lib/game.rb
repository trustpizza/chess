
require_relative "translator"
require "pry-byebug"

class Chess
  def initialize(number, board = Board.new, current_turn = :white)
    @number = number
    @board = board

    @current_turn = current_turn
    play
  end

  def setup
    @board.new_game 
  end

  def play
    @board.to_s

    @board.new_game
    player_turn until @board.game_over?
  end

  def player_turn
    puts "#{@current_turn}'s turn"

    play_turn

    @board.to_s
    
    switch_color
  end

  def play_turn
    select_piece

    @board.to_s
    move = user_select_move
    binding.pry    
    @board.update_cur_piece(move)


  end

  def select_piece
    input = user_select_piece
    coords = translate_to_coords(input)
  end

  def user_select_piece
    input = user_input(user_piece_selection) # both of these need LOTS of work to protect from inapropriate input
  end

  def user_select_move
    input = user_input(user_move_selection) # ^^^^
    translate_to_coords(input)
  end

  def translate_to_coords(input)
    translation = Translator.new
    translation.translate(input)
  end

  def switch_color
    @current_turn = @current_turn == :white ? :black : :white
  end
  private

  def user_piece_selection
    "Enter the location of the piece you want to move(i.e. 'a5')."
  end
  
  def user_move_selection
    "Enter the location of the place you want to move to(i.e. 'a5')."
  end

  def user_input(prompt)
    puts prompt
    gets.chomp
  end
end

x = Chess.new(1)
