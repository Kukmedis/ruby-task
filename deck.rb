class Deck
  attr_accessor :deck
  def initialize
    rank = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    suite = ['D','H','S','C']
    @deck = [] 
    rank.each do |i|
      suite.each do |j|
        @deck.push([j,i])
      end
    end
    @deck = @deck.shuffle
  end
  
  def giveTwo
    a = [@deck.pop, @deck.pop]
    
  end
  
  def giveThree
    [@deck.pop, @deck.pop, @deck.pop]
  end
  
  def giveOne
    [@deck.pop]
  end
  
end  
