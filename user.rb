require 'table'

class User
  attr_accessor :money, :username, :password, :email, :friends, :table,
                :tableBalance
  def initialize(username, password, email)
    @username = username
    @password = password
    @email = email
    @money = 100
    @friends = []
    @table = nil
    @tableBalance = nil
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
  
  def joinTable(table, moneyTook)
    if (moneyTook >= money) && (moneyTook >= table.quota)
      @table = table
      @tableBalance = moneyTook
      table.players << self
    end
  end
  
  def leaveTable
    @table.players -= [self]
    @table = nil
    @tableBalance = nil    
  end
  
  
  
end
