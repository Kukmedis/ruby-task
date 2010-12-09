require '~/ruby/turn'

class Table
  attr_accessor :seats, :players, :smallBlind, :quota, :bigBlind, :lastDealer, :turn
  
  def initialize(seats, smallBlind)
    @seats = seats
    @smallBlind = smallBlind
    @bigBlind = smallBlind * 2
    @quota = smallBlind * 100
    @players = []
    @lastDealer = nil
  end
  
  def startTurn
    @turn = Turn.new(self)
    @turn
  end
end
