# Card to represent an individual playing card. This class should contain the suit and the
# value and provide methods for determining what type of card it is (e.g. face card or ace).
# Write the code to implement this class in lib/card.rb.

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end
