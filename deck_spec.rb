require '~/ruby/deck'
require 'simplecov'
SimpleCov.start

describe Deck, "When created" do
  deck = Deck.new
  before do
    deck = Deck.new
  end
  
  it "should have no similar cards" do
    deck.deck.uniq!.should == nil
  end
  
  it "should have 52 cards" do
    deck.deck.length.should == 52
  end
  
  it "should give one card" do
    given_card1 = deck.giveOne.at(0)
    deck.deck.include?(given_card1).should == false
    deck.should have(51).deck
  end
  
  it "should give two cards" do
    given = deck.giveTwo
    given_card1 = given.at(0)
    given_card2 = given.at(1)
    deck.deck.should not_contain([given_card1,given_card2])
    deck.should have(50).deck
  end
  
  it "should give three cards" do
    given = deck.giveThree
    given_card1 = given.at(0)
    given_card2 = given.at(1)
    given_card3 = given.at(2)
    deck.deck.should not_contain([given_card1,given_card2,given_card3])
    deck.should have(49).deck
  end
  
  it "should give four cards and have 48 left" do
    given1 = deck.giveTwo
    given2 = deck.giveTwo
    deck.should have(48).deck
  end
    
end
