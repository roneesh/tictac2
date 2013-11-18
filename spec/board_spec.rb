require_relative '../lib/board.rb'
require_relative '../lib/human_player.rb'
require_relative '../lib/computer_player.rb'

describe Board, '#what_do_you_do?' do
  it 'tells us what it does' do
    board = Board.new
    board.what_do_you_do?.should eq('I keep track of the board')
  end
end

describe Board, '#initialize' do
  it 'initializes with an empty board' do
    board = Board.new
    board.state.should eq({
      1 => "empty", 
      2 => "empty", 
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    })
  end
end

describe Board, '#state' do
  it 'supplies the current board state' do
    board = Board.new
    board.state.should be_a(Hash)
  end

  it 'lets us alter the state to fill state[1]' do
    board = Board.new
    board.state[1] = "filled"
    board.state.should eq({
      1 => "filled", 
      2 => "empty", 
      3 => "empty",
      4 => "empty",
      5 => "empty",
      6 => "empty",
      7 => "empty",
      8 => "empty",
      9 => "empty"
    }) 
  end

  it 'lets us alter the state to fill the board completely' do
    board = Board.new
    (1..9).each do |number|
      board.state[number] = "filled"
    end
    board.state.should eq({
      1 => "filled", 
      2 => "filled", 
      3 => "filled",
      4 => "filled",
      5 => "filled",
      6 => "filled",
      7 => "filled",
      8 => "filled",
      9 => "filled"
    }) 
  end

  it 'lets us fill the board with HumanPlayer and CompuerPlayer objects' do
    board = Board.new
    p1 = HumanPlayer.new
    p2 = ComputerPlayer.new
    (1..5).each do |number|
      board.state[number] = p1
    end
    (6..9).each do |number|
      board.state[number] = p2
    end
    board.state.should eq({
      1 => p1, 
      2 => p1, 
      3 => p1,
      4 => p1,
      5 => p1,
      6 => p2,
      7 => p2,
      8 => p2,
      9 => p2
    }) 
  end
end
