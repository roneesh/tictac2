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
    c.open_moves.should eq ([5,6,7,8,9])
  end
end 

describe ComputerPlayer, '#winning_move' do
  it 'returns a winning move if one exists' do
    b = Board.new
    c = ComputerPlayer.new(b)
    b.state = {
      1 => c,
      2 => c,
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.winning_move.should eq (3)
  end

  it 'returns a winning move if one exists' do
    b = Board.new
    c = ComputerPlayer.new(b)
    b.state = {
      1 => c,
      2 => "empty",
      3 => "empty",
      4 => c,
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.winning_move.should eq (7)
  end

  it 'returns false if no winning move exists' do
    b = Board.new
    c = ComputerPlayer.new(b)
    b.state = {
      1 => c,
      2 => "empty",
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.winning_move.should be_false
  end
end

describe ComputerPlayer, '#blocking_move' do
  it 'returns false if no blocking move exists' do
    b = Board.new
    other_c = ComputerPlayer.new(b)
    c = ComputerPlayer.new(b)
    b.state = {
      1 => other_c,
      2 => "empty",
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.blocking_move.should be_false
  end

  it 'returns a winning move if one exists' do
    b = Board.new
    other_c = ComputerPlayer.new(b)
    c = ComputerPlayer.new(b)
    b.state = {
      1 => other_c,
      2 => other_c,
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.blocking_move.should eq (3)
  end
end

describe ComputerPlayer, '#center_move' do
  it 'takes the center move if it is available' do
    b = Board.new
    other_c = ComputerPlayer.new(b)
    c = ComputerPlayer.new(b)
    b.state = {
      1 => other_c,
      2 => "empty",
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.center_move.should eq(5)
  end

    it 'returns false if the cener move is taken' do
    b = Board.new
    other_c = ComputerPlayer.new(b)
    c = ComputerPlayer.new(b)
    b.state = {
      1 => other_c,
      2 => "empty",
      3 => "empty",
      4 => "empty",
      5 => c,
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    c.center_move.should be_false
  end
end

describe ComputerPlayer, '#novice_move' do
  it 'selects randomly from the open moves' do
    b = Board.new
    other_c = ComputerPlayer.new(b)
    c = ComputerPlayer.new(b)
    b.state = {
      1 => other_c,
      2 => c,
      3 => c,
      4 => c,
      5 => c,
      6 => c,
      7 => c,
      8 => c,
      9 => "empty"
    }
    c.novice_move.should eq (9)
  end
end