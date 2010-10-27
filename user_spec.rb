require 'user'
require 'table'
require 'matcher'

describe User, "when created" do

  user = User.new("usern","passw","e@mai.l")
  friend = User.new("Vladas","K","nulis")
  table = Table.new(5,2)
  
  it "should have 1000 money" do    
    user.money.should == 1000
  end
  
  it "should have a username" do
    user.username.should_not == ""
  end
  
  it "should have a password" do
    user.password.should_not == ""
  end
  
  it "should have an email" do
    user.email.should_not == ""
  end
  
  it "should be able to see its money" do
    lambda {user.money}.should_not raise_error 
  end
  
  it "should be able to add friends" do
    lambda {user.addFriend(friend)}.should_not raise_error
    user.isFriend(friend).should == true
  end
  
  it "should be able to remove friends" do
    lambda {user.removeFriend(friend)}.should_not raise_error
    user.isFriend(friend).should == false
  end
  
  it "should be able to sit at table" do
    lambda {user.joinTable(table, 300)}.should_not raise_error
    table.players.index(user).should_not == nil
    user.tableBalance.should >= table.quota
    user.table.should_not == nil
  end
  
  it "should be able to leave table" do
    user.joinTable(table, 500)
    lambda {user.leaveTable}.should_not raise_error
    #user.leaveTable
    table.players.index(user).should == nil
    user.tableBalance.should == nil
    user.table.should == nil
  end
  
  it "should have table balance when joins table" do
    user.joinTable(table,300)
    user.tableBalance.should > 0
  end
  
  it "should not be able to join table when table is full" do
  end
    
end


