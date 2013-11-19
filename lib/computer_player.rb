class ComputerPlayer

  attr_accessor :symbol, :board

  def initialize(board, symbol = "C")
    @board = board
    @symbol = symbol
  end

  def what_do_you_do?
    "I supply a computer selected move"
  end

  def give_move
    # move = rand(1..9)
    intermediate_move
  end

  def intermediate_move
    if winning_move
      winning_move
    elsif blocking_move
      blocking_move
    elsif center_move
      center_move
    else
      novice_move
    end
  end

  def winning_move
    winning_move = false
    winning_combinations.each do |combination|
      candidate_winner = board.state.select{ |k,v| combination.include?(k)}
      if candidate_winner.values.count(self) == 2
        winning_move = candidate_winner.key("empty")
      end
    end
    winning_move
  end

  def blocking_move
    blocking_move = false
    winning_combinations.each do |combination|
      candidate_blocker = board.state.select{ |k,v| combination.include?(k)}
      if (candidate_blocker.values.count{ |value| (value != self) && (value != "empty")} == 2) && (candidate_blocker.values.count("empty") == 1)
        blocking_move = candidate_blocker.key("empty")
      end
    end
    blocking_move
  end

  def center_move
    board.state[5] == "empty" ? 5 : false
  end

  def novice_move
    open_moves.sample
  end

  def my_moves
    board.state.select{ |k,v| v == self}.keys
  end

  def their_moves
    board.state.select { |k,v| (v != "empty") && (v != self)}.keys
  end

  def open_moves
    board.state.select{ |k,v| v == "empty"}.keys
  end

  def winning_combinations
    [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ] 
  end

end