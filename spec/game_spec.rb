require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/computer_player.rb'
require_relative '../lib/human_player.rb'


describe Game, '#initialize' do
  it 'returns a game object with two players and a board' do
    game = Game.new({player1: "p1", player2: "p2", board: "board"})
    game.player1.should_not be_empty
    game.player2.should_not be_empty
    game.board.should_not be_empty
  end
end

describe Game, '#run_game' do
  
end

describe Game, '#what_do_you_do?' do
  it 'tells us what it does' do
    game = Game.new
    game.what_do_you_do?.should eq('I manage the rules and flow of the game.')
  end
end

describe Game, '#make_move' do

end

describe Game, '#valid_move?' do
  it 'only allows numerical moves' do
    g = Game.new({player1: HumanPlayer.new(), player2: ComputerPlayer.new(), board: Board.new()})
    g.valid_move?(1).should be_true
    g.valid_move?(9).should be_true
    g.valid_move?("not a valid move").should be_false
    g.valid_move?(:notvalid).should be_false
  end

  it 'does not allow duplicate moves' do
    p1 = HumanPlayer.new
    p2 = ComputerPlayer.new
    b = Board.new
    g = Game.new({player1: p1, player2: p2, board: b})
    b.state = {
      1 => p1,
      2 => p2,
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "since this doesn't say empty it should be false"
    }
    g.valid_move?(1).should be_false
    g.valid_move?(2).should be_false
    g.valid_move?(3).should be_true
    g.valid_move?(9).should be_false
  end
end

describe Game, '#winner?' do
  it 'returns p1 if the board state has p1 winning' do
    p1 = HumanPlayer.new
    p2 = ComputerPlayer.new
    b = Board.new
    g = Game.new({player1: p1, player2: p2, board: b})
    b.state = {
      1 => p1,
      2 => p1,
      3 => p1,
      4 => p2,
      5 => p2,
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    g.winner.should eq(p1)
  end

  it 'returns p2 if the board state has p2 winning' do
    p1 = HumanPlayer.new
    p2 = ComputerPlayer.new
    b = Board.new
    g = Game.new({player1: p1, player2: p2, board: b})
    b.state = {
      1 => p1,
      2 => "empty",
      3 => p1,
      4 => p2,
      5 => p2,
      6 => p2,
      7 => "empty",
      8 => "emtpy",
      9 => p1
    }
    g.winner.should eq(p2)
  end 

  it 'returns false if there is not a winning board state' do
    p1 = HumanPlayer.new
    p2 = ComputerPlayer.new
    b = Board.new
    g = Game.new({player1: p1, player2: p2, board: b})
    b.state = {
      1 => p1,
      2 => p1,
      3 => "empty",
      4 => p2,
      5 => p2,
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }
    g.winner.should be_false
  end
end
