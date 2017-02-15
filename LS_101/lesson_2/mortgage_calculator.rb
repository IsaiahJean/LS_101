require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_msg.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def monthly_apr(input)
  (input.to_f / 100) / 12
end

def years_to_months(input)
  input.to_i * 12
end

def results(p, j, n)
  if j.to_f.zero?
    p / n - j
  else
    (p * (j / (1 - (1 + j)**-n)))
  end
end

loop do
  prompt(MESSAGES["welcome"])
  prompt("-------------------------------")

  loan_amount = ''

  loop do
    prompt(MESSAGES["loan_amount"])
    loan_amount = gets.chomp()
    if number?(loan_amount)
      break
    else
      prompt(MESSAGES["valid_amount"])
    end
  end

  Kernel.puts("You put a loan amount of:")
  Kernel.puts("$#{loan_amount}")

  loan_amount = loan_amount.to_f

  apr = ''

  loop do
    prompt(MESSAGES["apr"])
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    apr = gets.chomp()
    if number?(apr)
      break
    else
      prompt(MESSAGES["valid_apr"])
    end
  end

  Kernel.puts("You put an APR of:")
  Kernel.puts("#{apr}%")

  apr = monthly_apr(apr)

  loan_duration = ''

  loop do
    prompt(MESSAGES["loan_duration"])
    loan_duration = gets.chomp()
    if number?(loan_duration) && loan_duration.to_i != 0
      break
    else
      prompt(MESSAGES["valid_loan_duration"])
    end
  end

  Kernel.puts("You put a loan duration of:")
  Kernel.puts("#{loan_duration} year/s")

  loan_duration = years_to_months(loan_duration)

  monthly_payment = results(loan_amount, apr, loan_duration)

  prompt(MESSAGES["calculating"])
  Kernel.puts("...")

  prompt("Your monthly mortgage payment is: $#{monthly_payment.round(2)}")

  prompt(MESSAGES["again?"])

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

prompt("Thank you for using mortgage calculator!")
prompt("Goodbye!")
