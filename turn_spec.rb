require 'turn'
require 'table'
require 'user'
require 'matcher'

describe Turn, "when created" do

  table = Table.new(5,2)
  user1 = User.new("1","1","1")
  user2 = User.new("2","2","2") 
  user3 = User.new("3","3","3")
  user4 = User.new("4","4","4")
  turn = table.startTurn
  
  before do
    user1.joinTable(table,500)
    user2.joinTable(table,500)
    user3.joinTable(table,500)
    user4.joinTable(table,500)
    turn = table.startTurn
  end
  
  after(:each) do
    user1.leaveTable
    user2.leaveTable
    user3.leaveTable
    user4.leaveTable
  end
  
  it "should not start if table has less than 2 players" do
    user1.leaveTable
    user2.leaveTable
    user3.leaveTable
    table.startTurn
    turn.should have(0).players
  end
  
  it "should contain players from table who at least have big blind" do
    user4.tableBalance = 0
    turn = table.startTurn
    turn.players.should_not contain(user4)
  end
  
  it "should contain players only from table" do
    user1.leaveTable
    turn.players.should be_only_from(table.players)
  end

  it "should shift queue of players on next move" do
    beforeMove = turn.players.dup
    turn.nextMove
    afterMove = turn.players
    beforeMove.length.should == afterMove.length
    beforeMove.at(0).should == afterMove.at(-1)
  end
  
  it "should shift queue of players in table on next game" do
    beforeGame = table.players.dup
    turn.nextGame
    afterGame = table.players
    beforeGame.length.should == afterGame.length
    beforeGame.at(0).should == afterGame.at(-1)
  end
  
  it "should raise 25 when called sum is 10, player already called 5 and puts 30 money" do
    user4.joinTable(table,500)
    callSumBefore = turn.callSum
    turn.callSum = 10
    user4.call = 5
    turn.raise(user4, 30)
    callSumAfter = turn.callSum
    (callSumAfter - callSumBefore).should == 25
  end
  
  it "should let player fold" do
    turn.fold(user1)
    turn.players.include?(user1).should == false
  end
  
  it "should increase call pot by 20 when first player raises 20" do
    turn.raise(user1,20)
    turn.callSum.should == 20
  end
  
  it "should make call pot 20 if one player raises 10 and another 20" do
    turn.raise(user1,10)
    turn.raise(user2,20)
    turn.callSum.should == 20
    turn.raiser.should == user2
  end
  
  it "should make call pot 70 if raised - 10,40,70" do
    turn.raise(user1,10)
    turn.raise(user2,40)
    turn.raise(user3,70)
    turn.callSum.should == 70
    turn.raiser.should == user3
  end
  
  it "should give three cards after first round has passed" do
    turn.raise(turn.move,10)
    turn.call(turn.move)
    turn.call(turn.move)
    turn.call(turn.move)
    turn.should have(3).cards  
  end
  
  it "should have 4 cards after second round has finished" do
    turn.raise(turn.move,10)
    (1..7).each do |i|
      turn.call(turn.move)
    end
    turn.should have(4).cards
  end
  
  it "should have 5 cards after third round has finished" do
    turn.raise(turn.move,10)
    (1..11).each do |i|
      turn.call(turn.move)
    end
    turn.should have(5).cards
  end
  
  it "should have 4 cards after second round has finished, and one player made a move" do
    turn.raise(turn.move,10)
    (1..8).each do |i|
      turn.call(turn.move)
    end
    turn.should have(4).cards
  end
  
  it "should give three cards after first round has passed, and one player made a move" do
    turn.raise(turn.move,10)
    (1..4).each do |i|
      turn.call(turn.move)
    end
    turn.should have(3).cards  
  end
  
  it "should sort cards when evaluating strength" do
    turn.cards = [['C',7],['H',3],['D',10],['S',2],['S',12]]
    turn.players.at(0).hand = [['H',4],['D',9]]
    turn.checkCards
    turn.players.at(0).hand.should == [["S", 2], ["H", 3], ["H", 4], ["C", 7], ["D", 9], ["D", 10], ["S", 12]]
  end
  
  
    
     
end
