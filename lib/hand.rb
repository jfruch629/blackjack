# Hand to represent the player's and dealer's hand. This class will need to determine the best score based on the cards that have been dealt.
# Write the code to implement this class in lib/hand.rb.

require_relative 'deck'
require_relative 'card'

class Hand
  attr_reader :cards


  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def calculate_hand
    sum = 0
    ace_array = []
    @cards.each do |card|
      if ['J', 'Q', 'K'].include?(card[0].value)
        sum += 10
      elsif ['A'].include?(card[0].value)
        ace_array << card
      else
        sum += card[0].value
      end
    end
    ace_array.each do |ace_card|
      if sum <= 10
        sum += 11
      else
        sum += 1
      end
    end
    sum
  end
end
