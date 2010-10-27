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
  user1.joinTable(table,200)
  user2.joinTable(table,200)
  user3.joinTable(table,200)
  user4.joinTable(table,200)

  turn = Turn.new(table)
  
  it "should have at least 2 players at table to start" do    
    table.should have_at_least(2).players 
  end
  
  it "should contain players from table who at least have small blind" do
    user4.tableBalance = 0
    turn = Turn.new(table)
    turn.players.should not_include(user4)
  end
  
  it "should only allow players with money less than big blind if it is they have small blind button" do
    table.stub!(:lastDealer).and_return(user1)
    user2.tableBalance = 1
    user4.tableBalance = 1
    turn = Turn.new(table)
    turn.players.should contain(user2)
    turn.players.should not_contain(user4)
  end
  
end
