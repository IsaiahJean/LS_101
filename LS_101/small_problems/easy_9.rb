1. Welcome Stranger
=begin

Create a method that takes 2 arguments, an array and a hash.
The array will contain 2 or more elements that,
when combined with adjoining spaces, will produce a person's name.
The hash will contain two keys, :title and :occupation, and the appropriate values.
Your method should return a greeting that uses the person's full name, and mentions the person's title.

=end

Answer:

def greetings(arr, hsh)
  title = hsh[:title]
  occ = hsh[:occupation]
  puts "Hello, #{arr.join(' ')}! Nice to have a #{title} #{occ} around."
end
0r
def greetings(name, job)
  format('Hello, %s %s %s! Nice to have a %s %s around.', *name, *job.values)
end

-------------------------------------------

2. Double Doubles
=begin

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument,
unless the argument is a double number; double numbers should be returned as-is.

=end

Answer:

def twice(num)
  mid = num.to_s.size / 2
  first_half, second_half = num.to_s.slice(0..mid - 1), num.to_s.slice(mid..-1)
  first_half == second_half && num.to_s.size > 1 ? num : num * 2
end

--------------------------------------------

3. Always Return Negative
=begin

Write a method that takes a number as an argument.
If the argument is a positive number, return the negative of that number.
If the number is 0 or negative, return the original number.

=end

Answer:

def negative(num)
  num > 0 ? -num : num
end

--------------------------------------------

4. Counting Up
=begin

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

=end

Answer:

def sequence(num)
  num > 0 ? (1..num).to_a : "Number is less than 1"
end

-------------------------------------------

5. Uppercase Check
=begin

Write a method that takes a string argument,
and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

=end

Answer:

def uppercase?(string)
  string == string.upcase
end

-------------------------------------------

6. How long are you?
=begin

Write a method that takes a string as an argument,
and returns an Array that contains every word from the string,
to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space,
and that any substring of non-space characters is a word.

=end

Answer:

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}" }
end

---------------------------------------------

7. Name Swapping
=begin

Write a method that takes a first name, a space,
and a last name passed as a single String argument,
and returns a string that contains the last name, a comma, a space, and the first name.

=end

Answer:

def swap_name(name)
  name.split.reverse.join(', ')
end

---------------------------------------------

8. Sequence Count
=begin

Create a method that takes two integers as arguments.
The first argument is a count,
and the second is the first number of a sequence that your method will create.
The method should return an Array that contains the same number of elements as the count argument,
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value.
If the count is 0, an empty list should be returned.

=end

Answer:

def sequence(count, first)
  (1..count).map { |idx| idx * first }
end

---------------------------------------

9. Grade book
=begin

Write a method that determines the mean (average) of the three scores passed to it,
and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'
Tested values are all between 0 and 100.
There is no need to check for negative values or values greater than 100.

=end

Answer:

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

------------------------------------

10. Grocery List
=begin

Write a method which takes a grocery list (array) of fruits with quantities
and converts it into an array of the correct number of each fruit.

=end

Answer:

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

