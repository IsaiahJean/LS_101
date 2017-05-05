1. Combine Two Lists
=begin

Write a method that combines two Arrays passed in as arguments,
and returns a new Array that contains all elements from both Array arguments,
with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

=end

Answer:

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

-----------------------------------------

2. Lettercase Counter
=begin

Write a method that takes a string,
and then returns a hash that contains 3 entries:
one represents the number of characters in the string that are lowercase letters,
one the number of characters that are uppercase letters,
and one the number of characters that are neither.

=end

Answer:

def letter_case_count(string)
  case_count = {}
  case_count[:lowercase] = string.count('a-z')
  case_count[:uppercase] = string.count('A-Z')
  case_count[:neither] = string.count('^a-zA-Z')
  case_count
end

------------------------------------------

3. Capitalize Words
=begin

Write a method that takes a single String argument
and returns a new string that contains the original value of the argument,
but the first letter of every word is now capitalized.

You may assume that words are any sequence of non-blank characters,
and that only the first character of each word must be considered.

=end

Answer:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

--------------------------------------------

4. Swap Case
=begin

Write a method that takes a string as an argument
and returns a new string in which every uppercase letter is replaced by its lowercase version,
and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

=end

Answer:

def swapcase(string)
  string.chars.map { |c| c == c.downcase ? c.upcase : c.downcase}.join
end

-----------------------------------------------

5. Staggered Caps (Part 1)
=begin

Write a method that takes a String as an argument,
and returns a new String that contains the original value
using a staggered capitalization scheme in which every other character is capitalized,
and the remaining characters are lowercase.
Characters that are not letters should not be changed,
but count as characters when switching between upper and lowercase.

=end

Answer:

def staggered_case(string)
  stag = string.dup
  stag = string.chars.each_with_index do |c, idx|
    idx.even? ? c.upcase! : c.downcase!
  end
  stag.join
end

------------------------------------------

6. Staggered Caps (Part 2)
=begin

Modify the method from the previous exercise so it ignores non-alphabetic characters
when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value;
they just don't count when toggling the desired case.

=end

Answer:

def staggered_case(string, alphanumeric_only = true)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char.count('a-zA-Z') == 0 && alphanumeric_only
      result += char
      next
    elsif need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

--------------------------------------------

7. Multiplicative Average
=begin

Write a method that takes an Array of integers as input, multiplies all of the numbers together,
divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places.

=end

Answer:

def show_multiplicative_average(array)
  avg = (array.inject(:*) / array.size.to_f).round(3)
  puts "The result is #{format('%.3f', avg)}"
end

---------------------------------------------

8. Multiply Lists
=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers,
and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index.
You may assume that the arguments contain the same number of elements.

=end

Answer:

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*) }
end

----------------------------------------------

9. Multiply All Pairs
=begin

Write a method that takes two Array arguments in which each Array contains a list of numbers,
and returns a new Array that contains the product of every pair of numbers
that can be formed between the elements of the two Arrays.
The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

=end

Answer:

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |arr| arr.inject(:*) }.sort
end

-----------------------------------------------

10. The End is Near But Not Here
=begin

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

=end

Answer:

def penultimate(string)
  middle = ((string.split.size / 2.0).ceil) - 1
  if string.empty? || string.size == 1
    string
  elsif string.split.size.even?
    'no middle word'
  else
    string.split[middle]
  end
end