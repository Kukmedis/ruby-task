require 'user'

describe User, "When created" do
  user = User.new("usern","passw","e@mai.l")
  friend = User.new("Vladas","K","nulis")
  
  it "should have 100 money" do    
    user.money.should equal 100
  end
  
  it "should have a username" do
    user.username.should_not equal ""
  end
  
  it "should have a password" do
    user.password.should_not equal ""
  end
  
  it "should have an email" do
    user.email.should_not equal ""
  end
  
  it "should be able to see its money" do
    lambda {user.money}.should_not raise_error 
  end
  
  it "should be able to add friends" do
    lambda {user.addFriend(friend)}.should_not raise_error
    user.isFriend(friend).should equal true
  end
  
  it "should be able to remove friends" do
    lambda {user.removeFriend(friend)}.should_not raise_error
    user.isFriend(friend).should equal false
  end
  
    
end
