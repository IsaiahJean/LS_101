VALID_CHOICES = %w(rock paper scissors)
WINNING_COMBO = {
  'rock' => 'scissors',
  'paper' => 'rock',
  'scissors' => 'paper'
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINNING_COMBO[first] == second
end

def display_results(player, computer)
  if player == computer
    prompt("Tie!")
  elsif win?(player, computer)
    prompt("You win!")
  else
    prompt("You lost!")
  end
end

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?(enter:'y' or 'n')")

  answer = ''

  loop do
    answer = Kernel.gets().chomp().downcase

    if answer == 'y' || answer == 'n'
      break
    else
      prompt("Please type 'y' or 'n'.")
    end
  end

  break unless answer.start_with?('y')
end

prompt("Thanks for playing rock, paper, scissors! Goodbye!")
