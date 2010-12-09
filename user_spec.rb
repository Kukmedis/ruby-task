require '~/ruby/user'
require '~/ruby/table'
require '~/ruby/matcher'
require 'simplecov'
SimpleCov.start

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
    user.addFriend(friend)
    user.isFriend(friend).should == true
  end
  
  it "should be able to remove friends" do
    user.removeFriend(friend)
    user.isFriend(friend).should == false
  end
  
  it "should be able to sit at table" do
    user.joinTable(table, 300)
    table.players.index(user).should_not == nil
    user.table.should_not == nil
  end
  
  it "should be able to leave table" do
    user.joinTable(table, 500)
    user.leaveTable
    table.players.index(user).should == nil
    user.table.should == nil
  end
  
  it "should make table balance nil when user leaves table" do
    user.joinTable(table,500)
    user.leaveTable
    user.tableBalance.should == nil
  end
  
  it "should have table balance when joins table" do
    user.joinTable(table,300)
    user.tableBalance.should == 300
  end
  
  it "should have 1 friend, if he adds 1 friend" do
    user.addFriend(friend)
    user.howManyFriends.should == 1
  end
  
    
end


