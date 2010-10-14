require 'table'

class User
  attr_accessor :money, :username, :password, :email, :friends
  
  def initialize(username, password, email)
    @username = username
    @password = password
    @email = email
    @money = 100
    @friends = []
    @table = nil
  end
  
  def addFriend(friend)
    @friends << friend
  end
  
  def removeFriend(friend)
    @friends -= [friend]
  end
  
  def howManyFriends
    @friends.length
  end
  
  def isFriend(friend)
    @friends.include?(friend)
  end
  
  def sitAtTable(table)
    @table = table
    table.players << self
  end
  
  def leaveTable
    @table.players -= [self]
    @table = nil
  end
  
end
