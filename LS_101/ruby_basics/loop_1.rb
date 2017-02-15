1. Runaway Loop
=begin

The code below is an example of an infinite loop. The name describes exactly what it does: loop infinitely. This loop isn't useful in a real program, though. Modify the code so the loop stops after the first iteration.

loop do
  puts 'Just keep printing...'
end

=end

Answer:

loop do
  puts 'Just keep printing...'
  break
end

-----------------------------------

2. Loopception
=begin

The code below is an example of a nested loop. Both loops currently loop infinitely.
Modify the code so each loop stops after the first iteration.

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
  end
end

puts 'This is outside all loops.'

=end

Answer:

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'

--------------------------------------

3. Control the Loop
=begin

Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end

=end

Answer:

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

-------------------------------------------

4. Loop on Command
=begin

Modify the code below so the loop stops iterating when the user inputs 'yes'.

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end

=end

Answer:

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Wrong answer. Please answer yes'


-------------------------------------------

5. Say Hello
=begin

Modify the code below so "Hello!" is printed 5 times.

say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end

=end

Answer:

say_hello = true
count = 0

while say_hello
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5
end

-------------------------------------------

6. Print While
=begin

Using a while loop, print 5 random numbers between 0 and 99.
The code below shows an example of how to begin solving this exercise.

numbers = []

while <condition>
  # ...
end

=end

Answer:

numbers = []

while numbers.size < 5
  numbers << rand(0..99)
end

p numbers

--------------------------------------------

7. Count Up
=begin

The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

count = 10

until count == 0
  puts count
  count -= 1
end

=end

Answer:

count = 0

until count > 10
  puts count
  count += 1
end

--------------------------------------------

8. Print Until
=begin

Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]
Expected output:

7
9
13
25
18

=end

Answer:

numbers = [7, 9, 13, 25, 18]
counter = 0

until counter == numbers.size
  puts numbers[counter]
  counter += 1
end

--------------------------------------------

9. That is Odd
=begin

The code below shows an example of a for loop. Modify the code so that it only outputs i if i is an odd number.

for i in 1..100
  puts i
end

=end

Answer:

for i in 1..100
  puts i if i.odd?
end

---------------------------------------------

10. Greet Your Friends
=begin

Your friends just showed up! Given the following array of names, use a for loop to greet each friend individually.

friends = ['Sarah', 'John', 'Hannah', 'Dave']
Expected output:

Hello, Sarah!
Hello, John!
Hello, Hannah!
Hello, Dave!

=end

Answer:

friends = ['Sarah', 'John', 'Hannah', 'Dave']

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end

