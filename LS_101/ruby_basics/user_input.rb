

def valid_number?USER INPUT EXERCISES


1. Repeat after me
=begin

Write a program that asks the user to type something in, after which your program should simply display what was entered.

=end

Answer:

puts "type something"
text = gets.chomp
puts text

----------------------------------

2. Your Age in Months
=begin

Write a program that asks the user for their age in years, and then converts that age to months.

=end

Answer:

puts "What is your age in years?"
age = gets.chomp
age_in_months = age.to_i * 12
puts "You are #{age_in_months} months old."

------------------------------------

3. Print Something (Part 1)
=begin

Write a program that asks the user whether they want the program to print
"something", then print it if the user enters y. Otherwise, print nothing.

=end

Answer:

puts "Do you want to print something?(y/n)?"
answer = gets.chomp
puts "something" if answer == 'y'

--------------------------------------

4. Print Something (Part 2)
=begin

In the previous exercise, you wrote a program that asks the user if they want the program to print "something".
However, this program recognized any input as valid:
if you answered anything but y, it treated it as an n response, and quit without printing anything.

Modify your program so it prints an error message for any inputs that aren't y or n,
and then asks you to try again. Keep asking for a response until you receive a valid y or n response.
In addition, your program should allow both Y and N (uppercase) responses;
case sensitive input is generally a poor user interface choice. Whenever possible, accept both uppercase and lowercase inputs.

=end

Answer:

choice = nil
loop do
  puts '>> Do you want me to print something? (y/n)'
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)
  puts '>> Invalid input! Please enter y or n'
end
puts 'something' if choice == 'y'

------------------------------------------

5. Launch School Printer (Part 1)
=begin

Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed.
The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

For now, just use #to_i to convert the input value to an Integer,
and check that result instead of trying to insist on a valid number;
validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.

=end

Answer:

answer = nil
loop do
  puts "Pick a number of outputs you want to be displayed >= 3:"
  answer = gets.chomp
  break if answer.to_i >= 3
  puts "Output has to be 3 lines or greater."
end

answer.to_i.times { puts 'Launch School is the best' }

--------------------------------------------

6. Passwords
=begin

Write a program that displays a welcome message, but only after the user enters the correct password,
where the password is a string that is defined as a constant in your program.
Keep asking for the password until the user enters the correct password.

=end

Answer:

PASSWORD = "hiphop"

loop do
  puts "Please enter your password:"
  answer = gets.chomp.downcase
  break if answer == PASSWORD
  puts "Invalid password!"
end

puts "Welcome!"

---------------------------------------------

7. User Name and Password
=begin

In the previous exercise, you wrote a program to solicit a password.
In this exercise, you should modify the program so it also requires a user name.
The program should solicit both the user name and the password, then validate both,
and issue a generic error message if one or both are incorrect; the error message
should not tell the user which item is incorrect.

=end

Answer:

USER_NAME = Isaiah
PASSWORD = "hiphop"

loop do
  puts "Please enter user name:"
  name = gets.chomp

  puts "Please enter your password:"
  password = gets.chomp
  break if name == USER_NAME && password == PASSWORD
  puts "Authorization failed!"
en

puts "Welcome!"

-----------------------------------------

8. Dividing Numbers
=begin

Write a program that obtains two Integers from the user,
then prints the results of dividing the first by the second.
The second number must not be 0, and both numbers should be validated using this method:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

This method returns true if the input string can be converted to an Integer and
back to a string without loss of information, false otherwise.
It's not a perfect solution in that some inputs that are otherwise valid (such as 003) will fail,
but it is sufficient for this exercise.

=end

Answer:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop do
  puts "Please enter a numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input. Only integers allowed."
end

loop do
  puts "Please enter denominator:"
  denominator = gets.chomp
  break if valid_number?(denominator) && denominator.to_i != 0
  puts "Invalid input. Only integers allowed." if !valid_number?(denominator)

  puts "Invalid input. A denominator of 0 is not allowed" if
  denominator.to_i == 0 && valid_number?(denominator)
end

dividend =  numerator.to_f / denominator.to_f

puts "#{numerator.to_i} / #{denominator.to_i} is #{dividend}"

------------------------------------------

9. Launch School Printer (Part 2)
=begin

In an earlier exercise, you wrote a program that prints 'Launch School is the best!'
repeatedly until a certain number of lines have been printed. Our solution looked like this:

Modify this program so it repeats itself after each input/print iteration,
asking for a new number each time through. The program should keep running until the user enters q or Q.

=end

Answer:


loop do
  answer = nil
  loop do
    puts "Pick a number of outputs you want to be displayed >= 3:('q' to quit)"
    answer = gets.chomp
    break if answer.to_i >= 3 || answer == 'q'
    puts "Output has to be 3 lines or greater."
  end

  break if answer == 'q'

  answer.to_i.times { puts 'Launch School is the best' }
end

--------------------------------------------

10. Opposites Attract
=begin

Write a program that requests two integers from the user, adds them together, and then displays the result.
Furthermore, insist that one of the integers be positive, and one negative;
however, the order in which the two integers are entered does not matter.

Do not check for positive/negative requirement until after both integers are entered,
and start over if the requirement is not met.

You may use the following method to validate input integers

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

=end

Answer:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num_1 = nil
num_2 = nil
loop do
  loop do
    puts "Please enter a positive or negative number:"
    num_1 = gets.chomp
    break if valid_number?(num_1)
    puts "invalid input. Allow only Integers, except for 0."
  end

  loop do
    puts "Please enter positive or negative numer:"
    num_2 = gets.chomp
    break if valid_number?(num_2)
    puts "invalid input. Allow only Integers, except for 0."
  end

  break if num_1.to_i * num_2.to_i < 0

  puts "Sorry, one integer must be positive and one must be negative"
  puts "Start over."
end

sum = num_1.to_i + num_2.to_i
puts "#{num_1.to_i} + #{num_2.to_i} = #{sum}"
