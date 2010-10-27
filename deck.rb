class Deck
  attr_accessor :deck
  def initialize
    rank = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
    suite = ['D','H','S','C']
    @deck = [] 
    rank.each do |i|
      suite.each do |j|
        @deck.push([j,i])
      end
    end
    @deck.shuffle
  end 
end  
