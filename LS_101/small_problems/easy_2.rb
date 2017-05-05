1. How old is Teddy?
=begin

Build a program that randomly generates and prints Teddy's age.
To get the age, you should generate a random number between 20 and 200.

=end

Answer:

puts "Give me a name:"
name = gets.chomp

age = rand(20..200)
puts "#{name} is #{age} years old!"

-----------------------------------

2. How big is the room?
=begin

Build a program that asks a user for the length and width of a room in meters and
then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

=end

Answer:
sq_ft_to_sq_mt = 10.7639

puts "Enter the length of the room in meters:"
length = gets.to_f

puts "Enter the width of the room in meters:"
width = gets.to_f

sq_mt = (length * width).round(2)
sq_ft = (sq_mt * sq_ft_to_sq_mt).round(2)

puts "The area of the room is #{sq_mt} square meters (#{sq_ft} square feet)"

--------------------------------------

3. Tip calculator
=begin

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
The program must compute the tip and then display both the tip and the total amount of the bill.

=end

Answer:

print "What is the bill? "
bill = gets.to_f

print "What is the tip percentage? "
tip_percent = gets.to_f

tip = (bill * (tip_percent / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{tip}."
puts "The total is $#{total}."

---------------------------------------

4. When will I Retire?
=begin

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

=end

Answer:

year = 2016

print "What is your age? "
age = gets.to_i

print "What age would you like to retire? "
retire_age = gets.to_i

years_to_work = retire_age - age
retire_year = year + years_to_work

puts "Its #{year}. You will retire in #{retire_year}"
puts "You have only #{years_to_work} years of work to go!"

---------------------------------------------

5. Greeting a user
=begin

Write a program that will ask for user's name.
The program will then greet the user.
If the user writes "name!" then the computer yells back to the user.

=end

Answer:

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

-----------------------------------------------

6. Odd Numbers
=begin

Print all odd numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.

=end

Answer:

(1..99).each { |num| puts num if num % 2 == 1 }
or
(1..99).to_a.select { |num| puts num if num % 2 == 1}

-------------------------------------------------

7. Even Numbers
=begin

Print the even numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.

=end

Answer:

(1..99).each { |num| puts num if num.even? }

--------------------------------------------------

8. Sum or Product of Consecutive Integers
=begin

Write a program that asks the user to enter an integer greater than 0,
then asks if the user wants to determine the sum or product of all numbers
between 1 and the entered integer.

=end

Answer:

puts ">>> Please enter an integer greater than 0:"
number = gets.to_i

puts ">>> Enter 's' to compute the sum, 'p' to compute the product."
sum_or_prod = gets.chomp

range = (1..number).to_a
sum = range.reduce(:+)
product = range.reduce(:*)

if sum_or_prod == 's'
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif sum_or_prod == 'p'
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Error. Operation unkown."
end

-----------------------------------------------

9. String Assignment
=begin

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
What does this print out? Can you explain these results?

=end

BOB
BOB
upcase! mutates the string 'Bob'. Both save_name and name are pointing at the string'Bob'

------------------------------------------------

10. Mutation
=begin

What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=end

Answer:

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
Both array1 and array2 contain the same String objects. 
If you modify one of those Strings, that modification will show up in both Arrays.
