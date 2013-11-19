require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game

  attr_reader :player1, :player2, :board

  def initialize(args = {})
    @player1 = args[:player1]
    @player2 = args[:player2]
    @board = args[:board]
  end

  def what_do_you_do?
    "I manage the rules and flow of the game."
  end

  def run_game_loop
    draw_introduction
    begin
      make_move(player1)
      draw_board
      puts board.state
      make_move(player2) unless game_over?
      draw_board
      puts board.state
    end while game_over? == false
    puts "Cat Game!" if board.full?
    puts winner? if winner?
  end 

  def game_over?
    winner? || board.full?
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

  private

  def draw_introduction
    puts "(((((())))))"
    puts "( ( (()) ) )"
    puts "TIC TAC WHOA"
    puts "(((((())))))"
    puts "( ( (()) ) )"
    puts ""
    puts ""
  end

  def draw_board
    puts ""
    puts "#{draw_mark(1)} | #{draw_mark(2)} | #{draw_mark(3)} "
    puts "#{draw_mark(4)} | #{draw_mark(5)} | #{draw_mark(6)} "
    puts "#{draw_mark(7)} | #{draw_mark(8)} | #{draw_mark(9)} "
    puts ""
  end

  def draw_mark(position)
    if board.state[position].respond_to?(:symbol)
      board.state[position].symbol
    else
      "_"
    end
  end


end

