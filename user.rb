require '~/ruby/table'

class User
  attr_accessor :money, :username, :password, :email, :friends, :table,
                :tableBalance, :call, :place, :potShare, :hand, :hand_rank
  def initialize(username, password, email)
    @username = username
    @password = password
    @email = email
    @money = 1000
    @friends = []
    @table = nil
    @tableBalance = nil
    @call = 0
    @potShare = 0
    @hand = []
    @hand_rank = 0
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
      @call = 0
      @potShare = 0
      @hand = []
      @hand_rank = 0
      @table = table
      @tableBalance = moneyTook
      table.players << self if table.players.include?(self) == false
    end
  end
  
  def leaveTable
    if @table != nil
      @table.players -= [self]
      @table.turn.players -= [self] if @table.turn
      @table = nil
      @tableBalance = nil    
    end
  end
  
  
  
end
