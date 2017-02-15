Exercises: Additional Practice

Exercise 1
=begin

Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
Turn this array into a hash where the names are the keys and the values are the positions in the array.

=end

Answer:

flintstones_hsh = {}

flintstones.each_with_index do |name, index|
  flintstones_hsh[name] = index
end

p hsh

---------------------------------------------

Exercise 2
=begin

Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

=end

Answer:

ages_sum = 0

ages.each_value do |value|
  ages_sum += value
end

puts ages_sum

or

ages.values.inject(:+)

-----------------------------------------------

Exercise 3

In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
throw out the really old people (age 100 or older).

=end

Answer:

ages.select! do |_, value|
  value < 100
end

----------------------------------------------

Exercise 4
=begin

Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

=end

Answer:

ages.values.min

---------------------------------------------

Exercise 5
=begin

In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
Find the index of the first name that starts with "Be"

=end

Answer:

flintstones.index { |name| name[0, 2] == 'Be' }

----------------------------------------------

Exercise 6
=begin

Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

=end

Answer:

flintstones.map! do |name|
  name[0,3]
end

-----------------------------------------------

Exercise 7
=begin

Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

=end

Answer:

statement.each_char do |char|
  unless char == " "
    hsh[char] = statement.count char
  end
end

-------------------------------------------------

Exercise 8
=begin

What happens when we modify an array while we are iterating over it? What would be output by this code?

1. numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
What would be output by this code?

2. numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=end

Answer:

1. 1
   3
   It modifies array in real time, changing the output of the next iteration.

2. 1
   2
   same reason as 1.
------------------------------------------------

Exercise 9
=begin

As we have seen previously we can use some built-in string methods to change the case of a string.
A notably missing method is something provided in Rails, but not in Ruby itself...titleize!
This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
For example, the string:

words = "the flintstones rock"
would be:

words = "The Flintstones Rock"
Write your own version of the rails titleize implementation.

=end

Answer:

def titleize!(input)
  title = input.split(' ')

  title.map! do |word|
    if word == word.capitalize
      word
    else
      word.capitalize!
    end
  end
  title.join(' ')
end

-------------------------------------------------

Exercise 10
=begin

Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
Modify the hash such that each member of the Munster family has an additional "age_group" key
that has one of three values describing the age group the family member is in
(kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

hint: try using a case statement along with Ruby Range objects in your solution

=end

Answer:

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end


-------------------------------------------------

Exercise 11
=begin

Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
figure out the total age of just the male members of the family.

=end

Answer:

male_age_sum = 0

munsters.each do |name, details|
  if details["gender"] == "male"
    male_age_sum += details["age"]
  end
end

male_age_sum

---------------------------------------------------

Exercise 12
=begin

One of the most frequently used real-world string properties is that of "string substitution",
where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
...like this:

(Name) is a (age) year old (male or female).

=end

Answer:

munsters.each do |name, details|
    puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end

-------------------------------------------------------
Exercise 13
=begin

A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system.
That is, without any form of synchronization, two or more separate computer systems can create new items and label them
with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.

=end

Answer:

def generate_uuid
  char = []

  ("0".."9").to_a.each { |num| char << num }
  ("a".."f").to_a.each { |letter| char << letter }

  uuid = ''

  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times do
      uuid += char.sample
    end
    uuid += "-" unless index >= sections.size - 1
  end

  uuid
end