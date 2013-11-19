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

  def novice_move
    rand(1..9)
  end

  def intermediate_move

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

end