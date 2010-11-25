require 'deck'
class Turn
  attr_accessor :players, :callSum, :raiser, :round_number, :cards, :move
  def initialize(table)
    @move = 0
    @roundMoney = 0
    @players = []
    @callSum = 0
    @raiser = nil
    @table = table
    @pot = 0
    @cards = []
    @round_number = 0 #0,1,2,3,4   
    @deck = Deck.new
    table.players.each do |p|
      @players << p if p.tableBalance >= table.bigBlind
    end
    if (@players.length < 2)
      @players = []
    else
      @players.each do |p|
        p.hand = @deck.giveTwo
      end
      @move = @players.at(0) 
    end
  end
  
  def nextMove 
    if (@move == @raiser)
      @pot += (@callSum * @players.length)
      @callSum = 0
      @players.each do |p| 
        p.call = 0      
      end
      if @round_number == 3
        @round_number = 0
        checkCards
      elsif @round_number == 2
        @round_number = 3
        @cards += @deck.giveOne
      elsif @round_number == 1
        @round_number = 2
        @cards += @deck.giveOne
      elsif @round_number == 0
        @round_number = 1
        @cards = @deck.giveThree
      end
      @move = @players.shift
      @players.push(@move)
    else
      @move = @players.shift
      @players.push(@move)
    end
  end 
  
  def checkCards
    @players.each do |p|
      p.hand += @cards
      p.hand = p.hand.sort_by {|h| h.at(1)}   
      ranks = p.hand.transpose.at(1)
      puts ranks.inspect
      if ranks.uniq! == nil
        p.hand_rank = 0 
      elsif (ranks.uniq.length + 1) == ranks.length
        p.hand_rank = 1        
      else
        (0..6).each do |i|
          temp_hand = p.hand
          if (temp_hand.remove(temp_hand.at(i)).length + 3) == p.hand.length
            
    end
    
  end  
    
    
  
  def nextGame
    @move = 0
    @roundMoney = 0
    @callSum = 0
    @pot = 0
    @cards = []
    @players = []
    @round_number = 0
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
    nextMove
  end  
  
  def fold(player)
    @players -= [player]
    player.call = 0
    player.potShare = 0
    if (@players.length < 2)
      @players.player.tableBalance += @pot
      nextGame
    end
    nextMove
  end
  
  def raise(player, money)
    sum = money - @callSum - player.call
    #if (sum > 0) && (money <= player.tableBalance)             
      @callSum += sum     
      player.potShare += money
      player.call += sum
      player.tableBalance -= money
      @raiser = player
      @move = @players.shift
      @players.push(@move)
    #elsif (sum > 0) && (money > player.tableBalance)
    #end
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
  
  def work
  end
  
end  
