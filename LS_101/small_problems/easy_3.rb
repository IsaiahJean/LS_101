1. Searching 101
=begin

Write a program that solicits 6 numbers from the user,
then prints a message that describes whether or not  -
the 6th number appears amongst the first 5 numbers.

=end

Answer:

search = []
number = 1
loop do
  puts "Enter number #{number}:"
  search << gets.to_i
  break if number == 5
  number += 1
end

puts "enter last number:"
last_num = gets.to_i

if search.include?(last_num)
  puts "The number #{last_num} appears in #{search}."
else
  puts "The number #{last_num} does not apper in #{search}."
end

----------------------------------------

2. Arithmetic Integer
=begin

Write a program that prompts the user for two positive integers,
and then prints the results of the following operations on those two numbers:
addition, subtraction, product, quotient, remainder, and power.
Do not worry about validating the input.

=end

Answer:

puts "==> Enter the first number:"
num_1 = get.to_i
puts "==> Enter the second number:"
num_2 = gets.to_i

puts "==> #{num_1} + #{num_2} = " + (num_1 + num_2).to_s
puts "==> #{num_1} - #{num_2} = " + (num_1 - num_2).to_s
puts "==> #{num_1} * #{num_2} = " + (num_1 * num_2).to_s
puts "==> #{num_1} / #{num_2} = " + (num_1 / num_2).to_s
puts "==> #{num_1} % #{num_2} = " + (num_1 % num_2).to_s
puts "==> #{num_1} ** #{num_2} = " + (num_1 ** num_2).to_s

------------------------------

3. Counting the Number of Characters
=begin

Write a program that will ask a user for an input of a word or multiple words
and give back the number of characters. Spaces should not be counted as a character.

=end

Answer:

print "Please type a word or multiple words: "
user_input = gets.chomp

num_of_char = user_input.gsub(' ', '').size

puts "There are #{num_of_char} characters in '#{user_input}'."

--------------------------------

4. Multiplying Two Numbers
=begin

Create a method that takes two arguments, multiplies them together, and returns the result.

=end

Answer:

def multiply(num1, num2)
  num1 * num2
end

------------------------------

5. Squaring an Argument
=begin

Using the multiply method from the "Multiplying Two Numbers" problem,
write a method that computes the square of its argument
(the square is the result of multiplying a number by itself).

=end

Answer:

def square(num)
  multiply(num, num)
end

--------------------------------

6. Exclusive Or
=begin

The || operator returns true if either or both of its operands are true, false if both operands are false.
The && operator returns true if both of its operands are true, and false if either operand is false.
This works great until you need only one of two conditions to be true, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments,
and returns true if exactly one of its arguments is true, false otherwise.

=end

Answer:

def xor?(value1, value2)
  (value1 && !value2) || (value2 && !value1)
end

7. Odd Lists
=begin

Write a method that returns an Array that contains every other element of an Array that is passed in as an argument.
The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

=end

Answer:

def oddities(array)
  odd_array = []
  array.each_with_index { |item, idx| odd_array << item unless idx.odd? }
  odd_array
end

----------------------------------------

8. Palindromic Strings (Part 1)
=begin

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
(A palindrome reads the same forwards and backwards.) Case matters, and all characters should be considered

=end

Answer:

def palindrome?(arg)
  arg == arg.reverse
end

----------------------------------------------

9. Palindromic Strings (Part 2)
=begin

Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.
If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

=end

Answer:

def palindrome?(arg)
  arg == arg.reverse
end

def real_palindrome?(arg)
  palindrome?(arg.downcase.delete("^a-zA-Z"))
end

----------------------------------------------

10. Palindromic Numbers
=begin

Write a method that returns true if its integer argument is palindromic, false otherwise.
A palindromic number reads the same forwards and backwards.

end

Answer:

def palindromic_number?(num)
  palindrome?(num.to_s)
end
