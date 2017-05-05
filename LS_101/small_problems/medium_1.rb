1. Rotation (Part 1)
=begin

Write a method that rotates an array by moving the first element to the end of the array.
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

=end

Answer:

def rotate_array(array)
  array[1..-1] + [array[0]]
end

---------------------------------

2. Rotation (Part 2)
=begin

Write a method that can rotate the last n digits of a number.
Note that rotating just 1 digit results in the original number being returned.
You may use the rotate_array method from the previous exercise if you want. (Recommended!)
You may assume that n is always a positive integer.

=end

Answer:

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

---------------------------------

3. Rotation (Part 3)
=begin

If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597.
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument,
and returns the maximum rotation of that argument.
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

=end

Answer:

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end
0r
def max_rotation(x)
  (0...x.to_s.size).reduce(x.to_s) { |x, n| x[0...n] + x[n + 1..-1] + x[n] }.to_i
end

----------------------------------------

4. 1000 Lights
=begin

You have a bank of switches before you numbered from 1 to 1000.
Each switch is connected to exactly one light that is initially off.
You walk down the row of switches, and turn every one of them on.
Then, you go back to the beginning and toggle switches 2, 4, 6, and so on.
Repeat this for switches 3, 6, 9, and so on, and keep going until you have been through 1000 repetitions of this process.

Write a program that determines which lights are on at the end.

=end

Answer:

def toggle_on_or_off(lights)
  1.upto(lights.size) do |round_number|
    lights.each do |position, value|
      if position % round_number == 0
        value == "off" ? lights[position] = "on" : lights[position] = "off"
      end
    end
  end
end

def on_lights(lights)
  lights.keys.select { |key| lights[key] == "on"  }
end

lights = Hash.new
1.upto(1000) { |number| lights[number] = "off" }
toggle_on_or_off(lights)
p on_lights(lights)

--------------------------------------

5. Diamonds!
=begin

Write a method that displays a 4-pointed diamond in an n x n grid,
where n is an odd integer that is supplied as an argument to the method.
You may assume that the argument will always be an odd integer.

=end

Answers:

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

-----------------------------------------

6. Stack Machine Interpretation
=begin

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument.
Your program may assume that all programs are correct programs;
that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.

=end

Answer:

def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when (/\d/) then register = token.to_i
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else return "INVALID TOKEN"
    end
  end
    nil
end

---------------------------------------

7. Word to Digit

Write a method that takes a sentence string as input,
and returns a new string that contains the original string with any sequence of the words
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Answer:

NUMBERS = {
  'zero' => 0, 'one' => 1, 'two' => 2, 'three'=> 3, 'four' => 4, 'five' => 5,
  'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
}

def word_to_digit(string)
  word_to_num = string.split(' ')
  word_to_num.map do |word|
    NUMBERS.each do |k, v|
      word.gsub!(k.to_s, v.to_s) if word.include?(k)
    end
  end
  word_to_num.join(' ')
end
0r for phone numbers

DIGITS = %w[zero one two three four five six seven eight nine]
def word_to_digit(str)
  str.gsub(/\w+ ?/) { |w| DIGITS.index(w.downcase.strip) || ' ' + w }
     .strip
     .squeeze(' ')
     .gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

-----------------------------------------

8. Fibonacci Numbers (Recursion)
=begin

Write a recursive method that computes the nth Fibonacci number,
where nth is an argument to the method.

=end

Answer:

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

-------------------------------------------

9. Fibonacci Numbers (Procedural)
=begin

Rewrite your recursive fibonacci method so that it computes its results without recursion.

=end

Answer:

def fibonacci(nth)
  fib = [0, 1]
  nth.times do
     fib << fib[-1] + fib[-2]
    end
   fib[-2]
end
0r
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end
0r
def fibonacci(n)
  (3..n).reduce([1, 1]) { |(a, b), _| [b, a + b] }.last
end

-------------------------------------------

10. Fibonacci Numbers (Last Digit)
=begin

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

=end

Answer:

def fibonacci_last(n)
  (1...n % 60).reduce([1, 1]) { |(a, b), _| [b % 10, (a + b) % 10] }.first
end
