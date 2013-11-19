require_relative '../lib/computer_player.rb'
require_relative '../lib/board'

describe ComputerPlayer, '#what_do_you_do?' do
  it 'tells us what it does' do
    b = Board.new
    player = ComputerPlayer.new(b)
    player.what_do_you_do?.should eq('I supply a computer selected move')
  end
end

describe ComputerPlayer do
  context "creating" do
    it 'initializes with a symbol' do
      symbol = "C"
      b = Board.new
      c1 = ComputerPlayer.new(b, symbol)
      c1.symbol.should eq symbol
    end

    it 'initializes without a symbol to symbol = C' do
      b = Board.new
      c1 = ComputerPlayer.new(b)
      c1.symbol.should eq "C"
    end
  end
end

describe ComputerPlayer, '#my_moves' do
  it 'gets an array of its moves' do
    b = Board.new
    c = ComputerPlayer.new(b)
    b.state = {
      1 => c,
      2 => c,
      3 => "human player",
      4 => "human player",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }

    c.my_moves.should eq([1,2])
  end
end

describe ComputerPlayer, '#their_moves' do
  it 'gets an array of the other players moves' do
    b = Board.new
    c = ComputerPlayer.new(b)
    b.state = {
      1 => c,
      2 => c,
      3 => "human player",
      4 => "human player",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }

    c.their_moves.should eq([3,4])
  end
end

describe ComputerPlayer, '#open_moves' do
  it 'gets an array of empy moves' do
    b = Board.new
    c = ComputerPlayer.new(b)
    b.state = {
      1 => c,
      2 => c,
      3 => "human player",
      4 => "human player",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
  end
end 