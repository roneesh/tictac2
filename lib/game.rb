require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game

  attr_reader :player1, :player2, :board
  attr_accessor :result

  def initialize(args = {})
    @player1 = args[:player1]
    @player2 = args[:player2]
    @board = args[:board]
  end

  def what_do_you_do?
    "I manage the rules and flow of the game."
  end

  def run_game_loop
    begin
      make_move(player1)
      make_move(player2) unless winner?
      draw_board
    end while winner? == false
    puts winner?
  end 

  def make_move(player)
    selection = player.give_move.to_i
    if valid_move?(selection)
      board.state[selection] = player
    else
      make_move(player)
    end
  end

  def valid_move?(move)
    if (board.state.has_key?(move)) && (board.state[move] == "empty")
      true
    else
      false
    end
  end

  def winner?
    winning_combos = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ] 
    winning_combos.each do |combo|
      if ((board.state[combo[0]] == player1) && (board.state[combo[1]] == player1) && (board.state[combo[2]] == player1))
        # return player1
        return "Player 1 wins with #{combo}!"
      elsif ((board.state[combo[0]] == player2) && (board.state[combo[1]] == player2) && (board.state[combo[2]] == player2))
        # return player2
        return "Player 2 wins with #{combo}!"
      end
    end
    return false
  end

  def draw_board
    puts ""
    puts "#{mark(1)} | #{mark(2)} | #{mark(3)} "
    puts "#{mark(4)} | #{mark(5)} | #{mark(6)} "
    puts "#{mark(7)} | #{mark(8)} | #{mark(9)} "
    puts ""
  end

  def mark(position)
    if board.state[position].respond_to?(:symbol)
      board.state[position].symbol
    else
      "_"
    end
  end


end

p1 = HumanPlayer.new
p2 = ComputerPlayer.new
b = Board.new
g = Game.new({player1: p1, player2: p2, board: b})
g.run_game_loop