1. Sum of Sums
=begin

Write a method that takes an Array of numbers and then
returns the sum of the sums of each leading subsequence for that Array.
You may assume that the Array always contains at least one number.

=end

Answer:

def sum_of_sums(array)
  sum = []
  array.each_with_object([]) do |num, arr|
    arr << num
    sum << arr.reduce(:+)
  end
  sum.reduce(:+)
end
0r
def sum_of_sums(nums)
  (1..nums.size).reduce(0) { |sum, n| sum + nums.take(n).reduce(0, :+) }
end

----------------------------------------

2. Madlibs
=begin

Mad libs are a simple game where you create a story template with blanks for words.
You, or another player, then construct a list of words and
place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
and an adjective and injects those into a story that you create.

=end

Answer:

def madlib
  noun, verb, adj, adv = %w[noun verb adjective adverb].map do |word_type|
    puts "Please enter a#{'n' if word_type[/\Aa/]} #{word_type}:"
    gets.chomp
  end
  puts format("Do you %s your %s %s %s? HA! HA!", verb, adj, noun, adv)
end

madlib

------------------------------------------

3. Leading Substrings
=begin

Write a method that returns a list of all substrings of a string
that start at the beginning of the original string.
The return value should be arranged in order from shortest to longest substring.

=end

Answer:

def substrings_at_start(string)
  0.upto(string.size - 1).map { |num| string[0..num] }
end

--------------------------------------------

4. All Substrings
=begin

Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring begins.
This means that all substrings that start at position 0 should come first,
then all substrings that start at position 1, and so on.
Since multiple substrings will occur at each position,
the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

=end

Answer:

def substrings(string)
  counter = 0
  subs = []
  until counter == string.size - 1
    0.upto(string.size - 1) { |num| subs << string[counter..num] }
    counter += 1
  end
  subs.select { |el| el != '' }
end
0r
def substrings(string)
  result = []
  temp = string.dup
  until temp.empty?
    result << substrings_at_start(temp)
    temp.slice!(0)
  end
  result.flatten
end

---------------------------------------

5. Palindromic Substrings
=begin

Write a method that returns a list of all substrings of a string that are palindromic.
That is, each substring must consist of the same sequence of characters forwards as it does backwards.
The return value should be arranged in the same sequence as the substrings appear in the string.
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case;
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.
In addition, assume that single characters are not palindromes.

=end

Answer:

def palindromes(str)
  substrings(str.delete('^A-Za-z0-9')).select do |s|
    s.size > 1 && s.downcase == s.reverse.downcase
  end
end

--------------------------------------

6. fizzbuzz

Write a method that takes two arguments: the first is the starting number, and the second is the ending number.
Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz",
if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Answer:

def fizzbuzz(first, last)
  first.upto(last).with_object('').map do |n, elem|
    elem =  'Fizz' if (n % 3).zero?
    elem += 'Buzz' if (n % 5).zero?
    elem.empty? ? n : elem
  end.join(', ')
end

-----------------------------------------

7. Double Char (Part 1)
=begin

Write a method that takes a string, and returns a new string in which every character is doubled.

=end

Answer:

def repeater(str)
  str.chars.map { |char| char * 2 }.join
end
0r
def repeater(str)
  str.gsub(/./, '\0\0')
end
0r
def repeater(str)
  Array.new(2, str.chars).transpose.join
end

------------------------------------------

8. Double Char (Part 2)
=begin

Write a method that takes a string, and returns a new string in which every consonant character is doubled.
Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=end

Answer:

def double_consonants(str)
  str.gsub(/[b-z&&[^eiou]]/i, '\0\0')
end

-----------------------------------------

9. Convert number to reversed array of digits
=begin

Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

=end

Answer:

def reversed_number(number)
  number.to_s.chars.reverse.join.to_i
end

-------------------------------------------

10. Get The Middle Character
=begin

Write a method that takes a non-empty string argument,
and returns the middle character or characters of the argument.
If the argument has an odd length, you should return exactly one character.
If the argument has an even length, you should return exactly two characters.

=end

Answer:

def center_of(str)
  mid = (str.size / 2)
  str.size.even? ? str[mid - 1, 2] : str[mid]
end


