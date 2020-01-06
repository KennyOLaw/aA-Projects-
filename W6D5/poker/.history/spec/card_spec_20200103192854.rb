require "rspec"
require "card"

describe Card do
  let (:card) { Card.new(:"1", :Heart) }
  let (:symbols) { %i(1 2 3 4 5 6 7 8 9 10 J Q K A) }
  let (:suits) { %i(Heart Diamond Spade Club) }

  describe "#initialize" do
    expect(card).to be_a(Card)
  end 

  describe "#symbol" do
    expect(symbols.include(card.symbol)).to be true
  end

  describe "#suit" do
    expect(suits.include(card.suit)).to be true
  end

end
