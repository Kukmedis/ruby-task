require 'deck'

describe Deck, "When created" do
  deck = Deck.new
  
  it "should have no similar cards" do
    deck.deck.uniq!.should == nil
  end
  
  it "should have 52 cards" do
    deck.deck.length.should == 52
  end

end
