require 'table'
require 'user'

describe Table, "When created" do
  user = User.new('a','b','b')
  table = Table.new(5,2)
  
  it "should have 5 seats, if passed 5 as seats" do    
    table.seats.should == 5
  end
  
  it "should have small blind of 2, if passed 2 as smallblind" do    
    table.smallBlind.should == 2
  end
  
  it "should have big blind of 4, if passed 2 as small blind" do    
    table.bigBlind.should == 4
  end  
    
  it "should have quota of 200, if passed 2 as small blind" do    
    table.quota.should == 200
  end
  
  it "should have small blind of 5, if passed 5 as smallblind" do    
    table = Table.new(5,5)
    table.smallBlind.should == 5
  end
  
  it "should have big blind of 10, if passed 5 as small blind" do    
    table = Table.new(5,5)
    table.bigBlind.should == 10
  end  
    
  it "should have quota of 500, if passed 5 as small blind" do    
    table = Table.new(5,5)
    table.quota.should == 500
  end
  
  it "should have 0 players" do    
    table.should have(0).players
  end
  
  it "should add 1 player, when player joins" do
    user.joinTable(table,500)
    table.should have(1).players
  end
  
  it "should let player join only if he hasnt joined yet" do
    user.joinTable(table,500)
    user.joinTable(table,500)
    table.should have(1).players
  end
  
  it "should not let player join if full" do
    table_full = Table.new(1,2)
    user_full = User.new('c','e','r')
    user_full.joinTable(table_full,500)
    user.joinTable(table_full,500)
    table.should have(1).players
  end
  
   
    
end
