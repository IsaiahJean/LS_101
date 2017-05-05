1. Unpredictable Weather (Part 1)
=begin

In the code below, sun is randomly assigned as 'visible' or 'hidden'.

sun = ['visible', 'hidden'].sample
Write an if statement that prints "The sun is so bright!" if sun equals 'visible'.

=end

Answer:

sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == 'visible'

-----------------------------------------

2. Unpredictable Weather (Part 2)
=begin

In the code below, sun is randomly assigned as 'visible' or 'hidden'.

sun = ['visible', 'hidden'].sample
Write an unless statement that prints "The clouds are blocking the sun!" unless sun equals 'visible'.

=end

Answer:

sun = ['visible', 'hidden'].sample

puts "The clouds are blocking the sun!" unless sun == 'visible'

-----------------------------------------

3. Unpredictable Weather (Part 3)
=begin

In the code below, sun is randomly assigned as 'visible' or 'hidden'.

sun = ['visible', 'hidden'].sample
Write an if statement that prints "The sun is so bright!" if sun equals visible.
Also, write an unless statement that prints "The clouds are blocking the sun!" unless sun equals visible.

When writing these statements, take advantage of Ruby's expressiveness and use statement modifiers
instead of an if...end statement to print results only when some condition is met or not met.

=end

Answer:

puts 'The sun is so bright!' if sun == 'visible'
puts 'The clouds are blocking the sun!' unless sun == 'visible'

---------------------------------------------

4. True or False
=begin

In the code below, boolean is randomly assigned as true or false.

boolean = [true, false].sample
Write a ternary operator that prints "I'm true!" if boolean equals true and prints "I'm false!" if boolean equals false.

=end

Answer:

boolean = [true, false].sample

puts boolean ? "I'm true!" : "I'm false!"

----------------------------------------------

5. Truthy Number
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end

=end

Answer:

My favorite number is 7.

--------------------------------------------

6. Stoplight (Part 1)
=begin

In the code below, stoplight is randomly assigned as 'green', 'yellow', or 'red'.

stoplight = ['green', 'yellow', 'red'].sample
Write a case statement that prints "Go!" if stoplight equals 'green',
"Slow down!" if stoplight equals 'yellow', and "Stop!" if stoplight equals 'red'.

=end

Answer:

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when stoplight == 'green'
  puts "Go!"
when stoplight == 'yellow'
  puts 'Slow down!'
else
  puts "stop!"
end

-----------------------------------------------

7. Stoplight (Part 2)
=begin

Convert the following case statement to an if statement.

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

=end

Answer:

stoplight = ['green', 'yellow', 'red'].sample

if stoplight == 'green'
  puts "Go!"
elsif stoplight == 'yellow'
  puts "Slow down!"
else
  puts "Stop!"
end

---------------------------------------------

8. Sleep Alert
=begin

In the code below, status is randomly assigned as 'awake' or 'tired'.

status = ['awake', 'tired'].sample
Write an if statement that returns "Be productive!" if status equals 'awake' and returns "Go to sleep!" otherwise.
Then, assign the return value of the if statement to a variable and print that variable.

=end

Answer:

status = ['awake', 'tired'].sample

new_status = if status == 'awake'
               "Be productive!"
             else
               "go to sleep"
             end
puts new_status

------------------------------------------------

9. Cool Numbers
=begin

In the code below, number is randomly assigned a number between 0 and 9.
Then, an if statement is used to print "5 is a cool number!"
or "Other numbers are cool too!" based on the value of number.

number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end
Currently, "5 is a cool number!" is being printed every time the program is run.
Fix the code so that "Other numbers are cool too!" gets a chance to be executed.

=end

Answer:

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

----------------------------------------------------

10. Stoplight (Part 3)
=begin

Reformat the following case statement so that it only takes up 5 lines.

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

=end

Answer:

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end

side note - If you have multiple statements, put them on separate lines.
