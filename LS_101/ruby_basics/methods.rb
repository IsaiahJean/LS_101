1. Greeting Through Methods (Part 1)
=begin

Write two methods, one that returns the string "Hello" and one that returns the string "World".
Then print both strings using #puts, combining them into one sentence.

=end

Answer:

def hello
  "hello"
end

def world
  "world"
end

puts "#{hello} #{world}"

---------------------------------------

2. Greeting Through Methods (Part 2)
=begin

Write a method named greet that invokes the following methods:

def hello
  "hello"
end

def world
  "world"
end

When greet is invoked with #puts, it should output the following:

Hello World

Make sure you add a space between "Hello" and "World", however, you're not allowed to modify hello or world.

=end

Answer:

def hello
  "Hello"
end

def world
  "World"
end

def greet
  hello + ' ' + world
end

puts greet

-------------------------------------------

3. Make and Model
=begin

Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.

car('Toyota', 'Corolla')

=end

Answer:

def car(make, model)
 puts  "#{make} #{model}"
end

car('Toyota', 'Corolla')

-------------------------------------------

4. Day or Night?
=begin

The variable below will be randomly assigned as true or false.
Write a method named time_of_day that, given a boolean as an argument,
prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false.
Pass daylight into the method as the argument to determine whether it's day or night.

daylight = [true, false].sample

=end

Answer:

def time_of_day(time)
 puts time ? "It's daytime!" : "It's nighttime!"
end

daylight = [true, false].sample

time_of_day(daylight)

-----------------------------------------------

5. Naming Animals
=begin

Fix the following code so that the names are printed as expected.

def dog
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat}."

=end

Answer:

def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

----------------------------------------

6. Name Not Found
=begin

Write a method that accepts one argument, but doesn't require it.
The parameter should default to the string "Bob" if no argument is given.
The method's return value should be the value of the argument.

puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'
The code should output true twice.

=end

Answer:

def assign_name(name = 'Bob')
  name
end

puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'

----------------------------------------

7. Multiply the Sum
=begin

Write the following methods so that each output is true.

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

=end

Answer:

def add(num1, num2)
  num1 + num2
end

def multiply(num1, num2)
  num1 * num2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

--------------------------------------

8. Random Sentence
=begin

The variables below are both assigned to arrays. The first one, names, contains a list of names.
The second one, activities, contains a list of activities.
Write the methods name and activity so that they each take the appropriate array
and return a random value from it.
Then write the method sentence that combines both values into a sentence and returns it from the method.

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))

=end

Answer:

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(name, activity)
  "#{name} went #{activity} this morning."
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))

--------------------------------------------

9. Print Me (Part 1)
=begin

Write a method named print_me that prints "I'm printing within the method!" when invoked.

print_me

=end

Answer:

def print_me
  puts "I'm printing within the method!"
end

print_me

----------------------------------------------

10. Print Me (Part 2)
=begin

Write a method named print_me that returns "I'm printing the return value!" when using the following code.

puts print_me

=end

Answer:

def print_me
  "I'm printing the return value!"
end

puts print_me
