require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  Integer(input) rescue false # covers every incorrect input
end

def float?(input)
  Float(input) rescue false # covers every incorrect input
end

def number?(input)
  integer?(input) || float?(input)
end

def float_or_integer(output) # covers unnecessary .0's at end.
  if output.include? "."
    output.to_f
  else
    output.to_i
  end
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES["welcome"])

name = ''

loop do
  name = Kernel.gets().chomp().capitalize
  if name.count("0-9") > 0 || name.empty? || name.start_with?(' ')
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

name = name.split(' ').each(&:capitalize).join(' ')

prompt("Hi #{name}!")

loop do
  number1 = ''

  loop do
    prompt(MESSAGES["first_number"])
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end

  number1 = float_or_integer(number1)

  number2 = ''

  loop do
    prompt(MESSAGES["second_number"])
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end

  number2 = float_or_integer(number2)

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["valid_operator"])
    end
  end

  Kernel.puts("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             if number1.zero? || number2.zero? # for ZeroDivisionError
               'Cannot divide by zero.'
             elsif number1 % number2 != 0 # when integer dividend is a float.
               number1.to_f / number2
             else
               number1 / number2
             end
           end

  prompt("Answer = #{result}")

  prompt(MESSAGES["calculate_again?"])

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

prompt(MESSAGES["good_bye"])
