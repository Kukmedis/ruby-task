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

  
end
