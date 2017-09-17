# lib/blackjack.rb will contain code to interact with the classes you write and it will handle the logic of the game.

require_relative "card"
require_relative "deck"
require_relative "hand"

deck = Deck.new
player = Hand.new
computer = Hand.new

card = deck.deal(1)
player.add_card(card)
card = deck.deal(1)
player.add_card(card)


puts "Player was dealt: #{player.cards[0][0].value}#{player.cards[0][0].suit}"
puts "Player was dealt: #{player.cards[1][0].value}#{player.cards[1][0].suit}"

puts "Player score: #{player.calculate_hand}"
puts

# => now ask to hit or stand
stand = false
hit = false
player_bust = false
while stand == false && player_bust == false || hit == false
  puts
  print "Would you like to hit or stand? (h/s): "
  next_move = gets.chomp
  valid_answer = false
  # => check for valid answer
  while valid_answer == false
    if next_move == "h"
      valid_answer = true
      card = deck.deal(1)
      player.add_card(card)
      if player.calculate_hand > 21
        puts
        puts "Player was dealt: #{card[0].value}#{card[0].suit}"
        puts "Player score: #{player.calculate_hand}"
        puts
        puts "Bust! You lose.."
        player_bust = true
        hit = true
        stand = true
        break
      else
      puts
      puts "Player was dealt: #{card[0].value}#{card[0].suit}"
      puts "Player score: #{player.calculate_hand}"
      end
    elsif next_move == "s"
      valid_answer == true
      stand = true
      hit = true
      puts
      puts "Player score: #{player.calculate_hand}"
      break
    elsif !['h','s'].include?(next_move)
      print "That wasn't a valid response. Enter h or s! "
      break
    end
  end
end

if player_bust == false
  card = deck.deal(1)
  computer.add_card(card)
  card = deck.deal(1)
  computer.add_card(card)
  puts
  puts "Dealer was dealt: #{computer.cards[0][0].value}#{computer.cards[0][0].suit}"
  puts "Dealer was dealt: #{computer.cards[1][0].value}#{computer.cards[1][0].suit}"
  puts "Dealer score: #{computer.calculate_hand}"

  dealer_bust = false
  while computer.calculate_hand < 17
    card = deck.deal(1)
    computer.add_card(card)
    puts
    puts "Dealer was dealt #{card[0].value}#{card[0].suit}"
    puts "Dealer score: #{computer.calculate_hand}"
  end

  if computer.calculate_hand >= 17 && computer.calculate_hand <= 21
    puts
    puts "Dealer Stands."
  elsif computer.calculate_hand >> 21
    puts
    puts "Dealer busts! You win!"
    dealer_bust = true
  end

  if dealer_bust == false
    if player.calculate_hand < computer.calculate_hand
      puts
      puts "Dealer Wins!"
    elsif computer.calculate_hand < player.calculate_hand
      puts
      puts "You win!"
    else
      puts
      puts "It's a tie!"
    end
  end
end
