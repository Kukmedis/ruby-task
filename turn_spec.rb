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
  user1.joinTable(table,500)
  user2.joinTable(table,500)
  user3.joinTable(table,500)
  user4.joinTable(table,500)
  turn = table.startTurn
  
  it "should not start if table has than 2 players" do
    user1.leaveTable
    user2.leaveTable
    user3.leaveTable
    
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

  it "should shift queue of players on next gove" do
    beforeMove = turn.players
    turn.nextMove
    afterMove = turn.players
    beforeMove.length.should == afterMove.length
    beforeMove.at(0).should == afterMove.at(-1)
  end
  
  it "should shift queue of players in table on next game" do
    beforeGame = table.players
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
     
end
