require "spec_helper"

RSpec.describe Hand do
    # '♦', '♣', '♠', '♥'

    let(:hand) { Hand.new([Card.new("♦",10), Card.new("♥","J")]) }
    let(:hand_1) { Hand.new([Card.new("♣","A"), Card.new("♣",2)]) }
    let(:hand_2) { Hand.new([Card.new("♣","A"), Card.new("♠","J")]) }


    describe "#calculate_hand" do

      it "returns a correct sum based off of the values of the cards provided in the hand." do
        expect(hand.calculate_hand).to eq(20)
        expect(hand_1.calculate_hand).to eq(13)
        expect(hand_2.calculate_hand).to eq(21)
      end

      it "given more than 2 cards, Ace converts to 1 when over 10." do
        hand_3 = Hand.new([Card.new("♣","A"), Card.new("♠",5), Card.new("♠",8)])
        hand_4 = Hand.new([Card.new("♣","A"), Card.new("♠",4), Card.new("♠",7)])

        expect(hand_3.calculate_hand).to eq(14)
        expect(hand_4.calculate_hand).to eq(12)
      end

      it "given more than 2 cards, Ace converts to 11 when under or equal to 10." do
        hand_5 = Hand.new([Card.new("♣","A"), Card.new("♠",2), Card.new("♠",3)])
        hand_6 = Hand.new([Card.new("♣","A"), Card.new("♠",5), Card.new("♠",5)])

        expect(hand_5.calculate_hand).to eq(16)
        expect(hand_6.calculate_hand).to eq(21)
      end
    end
  end
