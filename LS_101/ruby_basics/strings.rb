1. Create a String
=begin

Create an empty string using the String class and assign it to a variable.

=end

Answer:

empty_string = ''

--------------------------------------

2. Quote Confusion
=begin

Modify the following code so that double-quotes are used instead of single-quotes.

puts 'It\'s now 12 o\'clock.'

=end

Answer:

puts "It's now 12 o 'clock."

side note - %Q(string) for double-quoted strings and %q(string) for single-quoted strings.

-----------------------------------------

3. Ignoring Case
=begin

Using the following code, compare the value of name with the string 'RoGeR'
while ignoring the case of both strings. Print true if the values are the same;
print false if they aren't. Then, perform the same case-insensitive comparison,
except compare the value of name with the string 'DAVE' instead of 'RoGeR'.

name = 'Roger'

=end

Answer:

name = 'Roger'

puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0

--------------------------------------------

4. Dynamic String
=begin

Modify the following code so that the value of name is printed within "Hello, !".

name = 'Elizabeth'

puts "Hello, !"

=end

Answer:

name = 'Elizabeth'
puts "Hello, #{name}!"

------------------------------------------------

5. Combining Names
=begin

Using the following code, combine the two names together to form a full name
and assign that value to a variable named full_name. Then, print the value of full_name.

first_name = 'John'
last_name = 'Doe'

=end

Answer:

first_name = 'John'
last_name = 'Doe'

full_name = "#{first_name} #{last_name}"

puts full_name

------------------------------------------------

6. Tricky Formatting
=begin

Using the following code, capitalize the value of state then print the modified value.
Note that state should have the modified value both before and after you print it.

state = 'tExAs'

=end

Anser:

state = 'tExAs'

state.capitalize!
puts state

--------------------------------------------------

7. Goodbye, not Hello
=begin

Given the following code, invoke a destructive method on greeting so that Goodbye! is printed instead of Hello!.

greeting = 'Hello!'
puts greeting

=end

Answer:

greeting = 'Hello!'

greeting.gsub!('Hello', 'Goodbye')
puts greeting

---------------------------------------------------

8. Print the Alphabet
=begin

Using the following code, split the value of alphabet by individual characters and print each character.

alphabet = 'abcdefghijklmnopqrstuvwxyz'

=end

Answer:

alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.split('')

-------------------------------------------------

9. Pluralize
=begin

Given the following code, use Array#each to print the plural of each word in words.

words = 'car human elephant airplane'

=end

Answer:

words = 'car human elephant airplane'

words.split(' ').each { |word| puts word + 's'}

---------------------------------------------------

10. Are You There?
=begin

Using the following code, print true if colors includes the color 'yellow' and print false if it doesn't.
Then, print true if colors includes the color 'purple' and print false if it doesn't.

colors = 'blue pink yellow orange'

=end

Answer:

colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')