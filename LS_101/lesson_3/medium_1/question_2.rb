=begin
Question 2

The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
Why is this and what are two possible ways to fix this?
=end

(40+2) results in an integer and it is being concatenated to a string.
You can fix this by:

  (40 + 2).to_s

or you can use string interpolation:

  puts "the value of 40 + 2 is #{40 + 2}"
