=begin

Question 1

What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

=end

Answer:

nil. When you initialize a local variable inside an if block it is initialized to nil.
