class Board

  attr_accessor :state

  def initialize
    @state = {
      1 => "empty",
      2 => "empty",
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
  end

  def what_do_you_do?
    'I keep track of the board'
  end

  def full?
    if state.has_value?("empty") 
      false 
    else 
      true
    end
  end

end