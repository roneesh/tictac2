require_relative '../lib/board'
require_relative '../lib/computer_player'
require_relative '../lib/game'
require_relative '../lib/human_player'

player1 = ARGV[1]
player2 = ARGV[2]
sym1 = ARGV[3]
sym2 = ARGV[4]

puts player1
puts player2

if player1 == 'computer'
  p1 = ComputerPlayer.new
else 
  p1 = HumanPlayer.new
end

if player2 == 'human'
  p2 = HumanPlayer.new
else
  p2 = ComputerPlayer.new
end

if sym1 != nil
  p1.symbol = sym1
end

if sym2 != nil
  p2.symbol = sym2
end

b = Board.new
g = Game.new({player1: p1, player2: p2, board: b})
g.run_game_loop