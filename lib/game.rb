class Chess
  def initialize(number, board = Board.new, current_turn = :white)
    @player_count = number
    @board = board
    @current_turn = current_turn
  end

  def setup
    @board.new_game 
  end

  def play
    @board.print_board
    @board.new_game
    player_turn until @board.game_over? || @player_count.zero?
  end

  def player_turn
    puts "#{@current_turn}'s turn"
    # something else?
  end
end