class Table
  attr_accessor :seats, :players, :smallBlind, :quota, :bigBlind, :lastDealer
  
  def initialize(seats, smallBlind)
    @seats = seats
    @smallBlind = smallBlind
    @bigBlind = smallBlind * 2
    @quota = smallBlind * 100
    @players = []
  end
  
end
