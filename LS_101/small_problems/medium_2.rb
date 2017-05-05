1. Longest Sentence
=begin

Write a program that reads the content of a text file and then
prints the longest sentence in the file based on number of words.
Sentences may end with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
You should also print the number of words in the longest sentence.

=end

Answer:

def longest_sentence(file)
  sentences =  File.read(file).strip.split(/[!.?]/)
  sorted = sentences.sort_by { |sentence| sentence.split(' ').length }
  puts "Longest: #{sorted[-1].strip}\nWord Count: #{sorted[-1].split(' ').length}"
end

------------------------------------

2. Now I Know My ABCs
=begin

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M
This limits the words you can spell with the blocks to just those words that do not use both letters from any given block.
Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

=end

Answer:

BLOCK = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'],
        ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'],
        ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(str)
  result = ""
  BLOCK.all? do |a, b|
    result = str.upcase.include?(a) && str.upcase.include?(b) ? false : true
  end
  result
end
0r
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end


--------------------------------------------

3. Lettercase Percentage Ratio
=begin

Write a method that takes a string, and then returns a hash that contains 3 entries:
one represents the percentage of characters in the string that are lowercase letters,
one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

=end

Answer:

def letter_percentage(input)
  arr = input.chars
  lowcase_pct = arr.count { |char| char =~ /[a-z]/ } / input.size.to_f * 100
  upcase_pct = arr.count { |char| char =~ /[A-Z]/ } / input.size.to_f * 100
  neither_pct = arr.count { |char| char =~ /[^a-zA-Z]/ } / input.size.to_f * 100
  result = {
    lowercase: lowcase_pct,
    uppercase: upcase_pct,
    neither: neither_pct
  }
end

------------------------------------------------

4. Matching Parentheses?
=begin

Write a method that takes a string as argument,
and returns true if all parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

=end

Answer:

OPEN = ["(", "[", "{",]
CLOSE = [")", "]", "}"]
AMBIGIOUS = "\'\""

def balanced?(string)
  check_it = 0
  return false if string.count(AMBIGIOUS).odd?
  string.each_char do |i|
   check_it += 1 if OPEN.include?(i)
   check_it -= 1 if CLOSE.include?(i)
   return false if check_it < 0
  end
  check_it.zero?
end

-----------------------------------------------

5. Triangle Sides
=begin

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid
depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

=end

Answer:

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort!
  return :invalid if sides.any? { |side| side == 0 } ||
                     sides[0] + sides[1] <= sides[2]
  if sides.all? { |side| side == sides[0] }
    :equilateral
  elsif sides.any? { |side| sides.count(side) == 2 }
   :isosceles
  else
    :scalene
  end
end

------------------------------------------------

6. Tri-Angles
=begin

Write a method that takes the 3 angles of a triangle as arguments,
and returns a symbol :right, :acute, :obtuse, or :invalid
depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

=end

Answer:

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if angles.reduce(:+) != 180 || angles.include?(0)
  if angles.any? { |angle| angle == 90 }
    :right
  elsif angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

------------------------------------------------

7. Unlucky Days
=begin

Write a method that returns the number of Friday the 13ths in the year passed in as an argument.
You may assume that the year is greater than 1752
(when the modern Gregorian Calendar was adopted by the United Kingdom),
and you may assume that the same calendar will remain in use for the foreseeable future.

=end

Answer:

def friday_13th?(year)
  require 'date'

def friday_13th?(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end
0r
def friday_13th?(year)
  (1..12).reduce(0) { |sum, m| Time.new(year, m, 13).friday? ? sum + 1 : sum }
end

------------------------------------------------------

8. Next Featured Number Higher than a Given Value
=begin

A featured number (something unique to this exercise) is an odd number that is a multiple of 7,
and whose digits occur exactly once each. So, for example,
49 is a featured number, but 98 is not (it is not odd),
97 is not (it is not a multiple of 7),
and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument,
and returns the next featured number that is greater than the argument.
Issue an error message if there is no next featured number.

=end

Answer:

def featured(num)
  num += 1
  num += 1 until (num % 7).zero? && num.odd?
  num.step(9_876_543_202, 14).find { |n| !n.to_s[/(\d).*\1/] } ||
    'There is no possible number that fulfills those requirements.'
end

------------------------------------------------------

9. Bubble Sort
=begin

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described.
Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument.
You may assume that the Array contains at least 2 elements.

=end

Answer:

def bubble_sort!(array)
  loop do
    n = array.size - 1
    swapped = false
    1.upto(n) do |idx|
      if array[idx - 1] > array[idx]
        array[idx -1], array[idx] = array[idx], array[idx - 1]
        swapped = true
      end
    end
    break if swapped == false
    n -= 1
  end
  array
end

-------------------------------------------------------

10. Sum Square - Square Sum
=begin

Write a method that computes the difference between the square of the sum of the first n positive integers
and the sum of the squares of the first n positive integers.

=end

Answer:

def sum_square_difference(num)
  square_of_sum = (1..num).reduce(:+)**2
  sum_of_squares = (1..num).reduce { |sum, n| sum + n**2 }
  square_of_sum - sum_of_squares
end