class Card
  attr_reader :symbol, :suit
  def initialize(symbol, suit)
    @symbol, @suit = symbol, suit
  end

  def value
    [symbol, suit]
  end 

end