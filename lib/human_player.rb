class HumanPlayer

  attr_accessor :symbol

  def initialize(symbol = "H")
    @symbol = symbol 
  end

  def what_do_you_do?
    'I supply a human selected move'
  end

  def give_move
    puts "Human player, what's your move?"
    move = gets.chomp
  end

end