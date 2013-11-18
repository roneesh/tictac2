require_relative '../lib/human_player.rb'

describe HumanPlayer, '#what_do_you_do?' do
  it 'tells us what it does' do
    player = HumanPlayer.new("X")
    player.what_do_you_do?.should eq('I supply a human selected move')
  end
end

describe HumanPlayer, '#give_move' do
  it 'gives a move' do
    player = HumanPlayer.new("X")
    player.stub(:gets) { "1\n" }
    player.should_receive(:puts).with("Human player, what's your move?")
    player.give_move.should be_a(String)
  end
end

describe HumanPlayer do
  context "creating" do
    it 'initializes with a symbol' do
      symbol = "X"
      p1 = HumanPlayer.new(symbol)
      p1.symbol.should eq symbol
    end

    it 'initializes without a symbol to symbol = H' do
      p1 = HumanPlayer.new
      p1.symbol.should eq "H"
    end
  end
end