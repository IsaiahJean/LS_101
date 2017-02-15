require 'pry'

def prompt(msg)
  puts "=>#{msg}"
end

def initialize_deck
  suits = ['H', 'S', 'D', 'C'] # hearts, spades, diamonds, and clubs.
  card_value = ['A', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                'J', 'Q', 'K'] # Ace, Jack , Queen, Kings
  cards = []
  suits. map do |suit|
    card_value. map do |value|
      cards << [suit, value]
    end
  end

  cards.shuffle!
end

def draw_cards(cards, player_hand, dealer_hand)
  2.times do
    player_hand << hit(cards)
    dealer_hand << hit(cards)
  end
end

def hit(cards)
  cards.pop
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += value.to_i
    sum += 11 if value == 'A'
    sum += 10 if value.to_i.zero? && value != 'A'
  end

  values.select { |value| value == 'A' }.count. times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(hand)
  hand > 21
end

def show_dealer_draw(dealer_hand)
  prompt "Dealer hand = #{dealer_hand[0]} and '?' "
end

def show_player_hand(player_hand)
  prompt "Your hand = #{player_hand}, hand value = #{total(player_hand)} "
end

def player_turn(cards, player_hand)
  answer = nil
  loop do
    prompt "'h' for hit or 's' for stay?"
    answer = gets.chomp.downcase
    if answer == 'h'
      player_hand << hit(cards)

      show_player_hand(player_hand)
    end
    break if ['s'].include?(answer) || busted?(total(player_hand))
  end
  prompt "Your hand value is #{total(player_hand)}"

  puts "~~You Bust!~~\n\n**Computer wins!**" if busted?(total(player_hand))
end

def show_dealer_hand(dealer_hand)
  prompt "dealer_hand = #{dealer_hand}, hand value = #{total(dealer_hand)}"
end

def dealer_turn(cards, dealer_hand)
  until total(dealer_hand) >= 17
    prompt "Dealer hits..."
    dealer_hand << hit(cards)

    prompt "dealer_hand = #{dealer_hand}, hand value = #{total(dealer_hand)}"
  end

  puts "~~Dealer Bust!~~" if busted?(total(dealer_hand))

  puts "Dealer stays!" if !busted?(total(dealer_hand))
end

def detect_winner(dealer_hand, player_hand)
  return "**Player wins!**" if total(dealer_hand) < total(player_hand) ||
                               total(dealer_hand) > 21

  return "**Dealer wins!**" if total(dealer_hand) > total(player_hand) &&
                               total(dealer_hand) <= 21

  "_It's a tie!_" if total(dealer_hand) == total(player_hand)
end

def display_winner(dealer_hand, player_hand)
  puts detect_winner(dealer_hand, player_hand).to_s
end

def display_result(player_points, dealer_points)
  prompt "Player score: #{player_points} | Dealer score: #{dealer_points}"
end

def start_game?
  puts "**Welcome to Twenty-One!**"
  puts "=========================="
  response = ''
  loop do
    puts ''
    prompt "First to five wins! Ready to play?('y' or 'n')"
    response = gets.chomp.downcase
    break if ['y', 'n'].include?(response)
    prompt "Enter 'y' or 'n'"
  end
  response
end

def next_round?
  answer = ''
  loop do
    prompt "start the next round?('y' or 'n')"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    prompt "Enter 'y' or 'n'."
  end
  answer
end

def display_game_winner(player_points, dealer_points)
  puts "~***~You win the game!!~***~" if player_points == 5

  puts ">>>Dealer wins the game<<<" if dealer_points == 5
end

def exit_game?
  response = ''
  loop do
    puts ''
    prompt "Do you want to play again?('y' or 'n')"
    response = gets.chomp.downcase
    break if ['y', 'n'].include?(response)
    prompt "Enter 'y' or 'n'"
  end
  response
end

loop do
  system 'clear'
  break if start_game? == 'n'
  player_points = 0
  dealer_points = 0

  loop do
    system 'clear'
    player_hand = []
    dealer_hand = []
    deck = initialize_deck

    loop do
      puts "Shuffling cards..."

      draw_cards(deck, player_hand, dealer_hand)

      show_dealer_draw(dealer_hand)

      show_player_hand(player_hand)
      player_turn(deck, player_hand)
      break if busted?(total(player_hand))
      puts "You chose to stay!"

      puts "Dealers turn..."
      show_dealer_hand(dealer_hand)
      dealer_turn(deck, dealer_hand)
      puts "---------------------------"
      prompt "Dealer hand value is #{total(dealer_hand)}"
      prompt "Player hand value is #{total(player_hand)}"
      puts "---------------------------"
      puts ''
      display_winner(dealer_hand, player_hand)

      player_points += 1 if detect_winner(dealer_hand, player_hand) ==
                            "**Player wins!**"
      dealer_points += 1 if detect_winner(dealer_hand, player_hand) ==
                            "**Dealer wins!**"

      break
    end

    dealer_points += 1 if busted?(total(player_hand))

    display_result(player_points, dealer_points)
    puts ""

    break if player_points == 5 ||
             dealer_points == 5 ||
             next_round? == 'n'
  end

  display_game_winner(player_points, dealer_points)
  break if exit_game? == 'n'
end

puts "~~You have exited Twenty_one! Good bye!~~"
