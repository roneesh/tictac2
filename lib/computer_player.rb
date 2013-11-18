class ComputerPlayer

  attr_accessor :symbol

  def initialize(symbol = "C")
    @symbol = symbol
  end

  def what_do_you_do?
    "I supply a computer selected move"
  end

  def give_move
    move = rand(1..9)
  end

end