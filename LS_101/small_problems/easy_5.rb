1.ASCII String Value
=begin

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
The ASCII string value is the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

=end

Answer:

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

* here is an Integer method such that:

char.ord.mystery == char
where mystery is our mystery method.
Can you determine what method name should be used in place of mystery?
What happens if you try this with a longer string instead of a single character?

Answer:

char.ord.chr('UTF-8'). When used with longer string it returns first character of that string.

--------------------------------------

2. After Midnight (Part 1)
=begin

The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

=end

Answer:

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

---------------------------------

3. After Midnight (Part 2)
=begin

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format,
and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

=end

Answer:

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

--------------------------------------

4. Letter Swap
=begin

Given a string of words separated by spaces,
write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word.
You may also assume that each string contains nothing but words and spaces

=end

Answer:

def swap_first_last_char(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  string.split(' ').each do |word|
    swap_first_last_char(word)
  end.join(' ')
end

-----------------------------------------

5. Clean up the words
=begin

Given a string that consists of some words and an assortment of non-alphabetic characters,
write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
If one or more non-alphabetic characters occur in a row,
you should only have one space in the result (the result should never have consecutive spaces).

=end

Answer:

def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

*.squeeze Returns a new string where runs of the same character that occur in this set are replaced by a single character.

--------------------------------------------

6. Letter Counter (Part 1)
=begin

Write a method that takes a string with one or more space separated words
and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

=end

Answer:

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

-----------------------------------------------

7. Letter Counter (Part 2)
=begin

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size.
For instance, the length of "it's" is 3, not 4.

=end

Answer:

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

-----------------------------------------------

8. Alphabetical Numbers
=begin

Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten,
eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

=end

Answer:

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

----------------------------------------

9. ddaaiillyy ddoouubbllee
=begin

Write a method that takes a string argument
and returns a new string that contains the value of the original string
with all consecutive duplicate characters collapsed into a single character.

=end

Answer:

def crunch(string)
  string.squeeze('^\S/')
end

----------------------------------------

10. Bannerizer
=begin

Write a method that will take a short line of text, and print it within a box.

=end

Answer:

def print_in_box(message)
   horizontal_rule = "+#{'-' * (message.size + 2)}+"
   empty_line = "|#{' ' * (message.size + 2)}|"

   puts horizontal_rule
   puts empty_line
   puts "| #{message} |"
   puts empty_line
   puts horizontal_rule
end
