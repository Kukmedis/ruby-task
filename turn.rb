class Turn
  attr_accessor :players, :callSum
  def initialize(table)
    @move = 0
    @roundMoney = 0
    @players = []
    @callSum = 0
    @raiser = nil
    @table = table
    @pot = 0
    table.players.each do |p|
      @players << p if p.tableBalance >= table.bigBlind
    end
    if (@players.length < 2)

    end
  end
  
  def nextMove
    if (@move == @raiser)
      @pot += @callSum
      @callSum = 0
      @players.each do |p|
        p.call = 0
      end 
    else
      @move = @players.shift
      @players.push(@move)
    end
  end 
  
  def checkCards
    
  
  def nextGame
    @dealer = @table.players.shift
    @table.players.push(@dealer)
  end
  
  def call(player)
    if (player.call < @callSum)
      if ((@callSum - player.call) >= player.tableBalance)
        player.potShare += player.tableBalance
        player.call += player.tableBalance
        player.tableBalance = 0
      else
        player.tableBalance -= (@callSum - player.call)
        player.potShare += (@callSum - player.call)
        player.call = @callSum
      end
    end
  end  
  
  def fold(player)
    @players -= player
    player.call = 0
    player.potShare = 0
    if (@players.length == 2)
      @players.player.tableBalance += @pot
    end
  end
  
  def raise(player, money)
    sum = money - @callSum - player.call
    if (sum > 0) && (money <= player.tableBalance)             
      @callSum += sum     
      player.potShare += money
      player.call += sum
      player.tableBalance -= money
      @raiser = player
    elsif (sum > 0) && (money > player.tableBalance)
    end
  end
  
  
  
  def dealer
    d = @players.index(table.lastDealer) + 1
    @players.at(d % @players.length)
  end
  
  def smallBlinder
    sb = @players.index(table.lastDealer) + 2
    @players.at(sb % @players.length)
  end 
  
  def bigBlinder
    bb = @players.index(table.lastDealer) + 3
    @players.at(bb % @players.length)
  end
  
  
  
end  
