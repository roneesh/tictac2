require_relative '../lib/board'
require_relative '../lib/computer_player'
require_relative '../lib/game'
require_relative '../lib/human_player'

p1 = HumanPlayer.new("X")
p2 = HumanPlayer.new("O")
b = Board.new
g = Game.new({player1: p1, player2: p2, board: b})
g.run_game_loop