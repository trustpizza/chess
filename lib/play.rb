require_relative 'board'
require_relative 'game'
require_relative 'pieces/piece'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'move_validator'


def play_game
  two_player = Game.new(2)
  two_player.setup_board
  two_player.play
end

play_game