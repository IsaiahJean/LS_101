1. Repeat Yourself
=begin

Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:

repeat('Hello', 3)

=end

Answer:

def repeat(string, num)
  num.times { puts string }
end

repeat('hello', 3)

---------------------------------

2. Odd
=begin

Write a method that takes one argument in the form of an integer or a float; this argument may be either positive or negative.
This method should check if a number is odd, returning true if its absolute value is odd.
You may assume that only integers are passed in as arguments.

=end

Answer:

def is_odd?(num)
  num % 2 == 1
end

puts is_odd?(7)

---------------------------------

3. List of Digits
=begin

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

=end

Answer:

def digit_list(num)
  num.to_s.split('').map! do |n|
    n.to_i
  end
end

digit_list(12345) == [1,2,3,4,5]

-----------------------------------

4. How Many?
=begin

Write a method that counts the number of occurrences of each element in a given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
Once counted, print each element alongside the number of occurrences.

=end

Answer:

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  vehicle_count = {}

  array.each do |vehicle|
    vehicle_count[vehicle] = array.count(vehicle)
  end

  vehicle_count.each do |vehicle, count|
    puts "#{vehicle} => #{count}"
  end
end

----------------------------------

5. Reverse It (Part 1)
=begin

Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

Examples:

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
The tests above should print true.

=end

Answer:

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

-------------------------------

6. Reverse It (Part 2)
=begin

Write a method that takes one argument, a string containing one or more words,
and returns the given string with all five or more letter words reversed.
Each string will consist of only letters and spaces.
Spaces should be included only when more than one word is present.

=end

Answer:

def reverse_words(string)
  string = string.split

  string.map! do |word|
    word.size >= 5 ? word.reverse : word
  end

  string.join(' ')
end

-----------------------------------

7. Stringy Strings
=begin

Write a method that takes one argument, a positive integer,
and returns a string of alternating 1s and 0s, always starting with 1.
The length of the string should match the given integer.

=end

Answer:

def stringy(number, )
  string = []

  loop do
    break if string.count == number
    string << '1' if string.count != number
    string << '0' if string.count != number
   end

   string.join
end

----------------------------------------

8. Array Average
=begin

Write a method that takes one argument, an array containing integers, a
nd returns the average of all numbers in the array.
The array will never be empty and the numbers will always be positive integers.

=end

Answer:

def average(numbers)
  numbers.reduce(:+).to_f / numbers.count
end

--------------------------------------------

9. Sum of Digits
=begin

Write a method that takes one argument, a positive integer, and returns the sum of its digits.

=end

Answer:

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

-------------------------------------------

10. Whats my Bonus?
=begin

Write a method that takes two arguments, a positive integer and a boolean,
and calculates the bonus for a given salary.
If the boolean is true, the bonus should be half of the salary.
If the boolean is false, the bonus should be 0.

=end

Answer:

def calculate_bonus(number, bonus)
  bonus ? (number / 2) : 0
end

