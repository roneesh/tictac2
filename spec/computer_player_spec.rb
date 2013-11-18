require_relative '../lib/computer_player.rb'

describe ComputerPlayer, '#what_do_you_do?' do
  it 'tells us what it does' do
    player = ComputerPlayer.new
    player.what_do_you_do?.should eq('I supply a computer selected move')
  end
end

describe ComputerPlayer, '#give_move' do
  it 'gives a move' do
    computer = ComputerPlayer.new
    computer.give_move.should be_a(Fixnum)
  end
end

describe ComputerPlayer do
  context "creating" do
    it 'initializes with a symbol' do
      symbol = "C"
      c1 = ComputerPlayer.new(symbol)
      c1.symbol.should eq symbol
    end

    it 'initializes without a symbol to symbol = C' do
      c1 = ComputerPlayer.new()
      c1.symbol.should eq "C"
    end
  end
end