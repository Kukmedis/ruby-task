class Turn
  attr_accessor :players
  def initialize(table)
    @turn = nil
    @pot = nil
    @roundMoney = nil
    @players = []
    @callSum = nil
    i = 0
    table.players.each do |p|
      if p.tableBalance >= table.bigBlind
        @players << p
        p.place = i
        i += 1
      end
    end
    if (@players.length < 2)

    end
  end
  
  def nextTurn
    
  end 
  
  def call(player)
    
    if (player.call < @callSum)
      
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
