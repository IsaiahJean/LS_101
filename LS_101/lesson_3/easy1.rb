
Question 1

What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Answer
# 1
# 2
# 2
# 3

# This will show the original array because the # uniq
# method does not mutate the original array.

Question 2

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# Answers

1) what is != and where should you use it?

# This is not equal

2) put ! before something, like !user_name

# ! before something will change that object to false.

3) put ! after something, like words.uniq!

# This specifies a method with some type of special
# functionality such as mutating the caller
# (but it could be something else)

4) put ? before something

# The question mark before is used in a ternary operator
# ex. false ? "this is true" : "this is not true"

5) put ? after something

# A question mark after for example a method,
# indicates that the method returns a boolean value.
# However I'm not exactly sure in other circumstances.

6) put !! before something, like !!user_name

# This turns any object into the boolean equivalent.

Question 3

Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# advice.gsub!('important', 'urgent')

Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Lets see how they differ:

numbers = [1, 2, 3, 4, 5]

What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
numbers.delete(1)

# The first method deletes the number at index 1.
# So it would delete the value 2.

# numbers = [1, 3, 4, 5]

# The second deletes the actual value one
# So it would delete 1 which is currently at index zero.

# numbers = [2, 3, 4, 5]

# Both return the deleted value and mutate the array.

Question 5

Programmatically determine if 42 lies between 10 and 100.

hint: Use Rubys range object in your solution.

# (10..100).cover?(42)

Question 6

Starting with the string:

famous_words = "seven years ago..."

show two different ways to put the expected "Four score and " in front of it.

# "Four score and " + famous_words
# "Four score and " << famous_words

Question 7

Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

If we take advantage of Rubys Kernel#eval method to have it execute this string as if it were a "recursive" method call

eval(how_deep)

what will be the result?

# 42. ( 5 * 8 + 2)

Question 8

If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

Make this into an un-nested array.

# flintstones.flatten!

Question 9

Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

Turn this into an array containing only two elements: Barney's name and Barney's number

# flintstones.assoc('Barney')