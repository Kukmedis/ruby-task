require 'deck'

describe Deck, "When created" do
  deck = Deck.new
  
  it "should have no similar cards" do
    deck.deck.uniq!.should == nil
  end
  
  it "should have 52 cards" do
    deck.deck.length.should == 52
  end
  
  it "should give one card" do
    given_card1 = deck.giveOne.at(0)
    deck.deck.include?(given_card1).should == false
  end
  
  it "should give two cards" do
    given_card1 = deck.giveOne.at(0)
    given_card2 = deck.giveOne.at(1)
    deck.deck.include?(given_card1).should == false
    deck.deck.include?(given_card2).should == false
  end
  
  it "should give three cards" do
    given_card1 = deck.giveOne.at(0)
    given_card2 = deck.giveOne.at(1)
    given_card3 = deck.giveOne.at(2)
    deck.deck.include?(given_card1).should == false
    deck.deck.include?(given_card2).should == false
    deck.deck.include?(given_card3).should == false
  end
    
end
