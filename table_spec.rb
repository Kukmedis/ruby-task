require 'table'

describe Table, "When created" do

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
  
  it "should have 0 players" do    
    table.should have(0).players
  end
  
end
