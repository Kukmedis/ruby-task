require 'table'

class User
  attr_accessor :money, :username, :password, :email, :friends, :table,
                :tableBalance, :call, :place, :potShare
  def initialize(username, password, email)
    @username = username
    @password = password
    @email = email
    @money = 1000
    @friends = []
    @table = nil
    @tableBalance = nil
    @call = nil
    @potShare = nil
    @place = nil
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
    if (moneyTook <= money) && (moneyTook >= table.quota)
      @table = table
      @tableBalance = moneyTook
      table.players << self
    end
  end
  
  def leaveTable
    if @table != nil
      @table.players -= [self]
      @table.turn.players -= [self]
      @table = nil
      @tableBalance = nil    
    end
  end
  
  
  
end
