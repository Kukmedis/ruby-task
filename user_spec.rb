require 'user'

describe User, "When created" do
  user = User.new("usern","passw","e@mai.l")
  
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
  
  it "should be able too see its money" do
    lambda {user.money}.should_not raise_error 
  end
  
end
