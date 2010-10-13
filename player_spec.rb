require 'player'
require 'user'

describe Player, "When created" do
  
  user = User.new("a","b","c")
  player = Player.new(user)
  
  it "should be an instance of User" do
    player.should be_a_kind_of User
  end
  
end
