# Deck to represent a collection of 52 cards. When dealing a hand this class can be used to supply the
# Card objects. Write the code to implement this class in lib/Deck.rb.

require_relative 'card'
class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end


# I was trying to get it to at least pop.. but Im getting an argument exception thrown
  def deal(num)
    @cards.pop(num)
  end
end
