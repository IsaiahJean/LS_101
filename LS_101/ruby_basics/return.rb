1. Breakfast, Lunch, or Dinner? (Part 1)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
end

puts meal

=end

Answer:

prints Breakfast. Its printing the return value of the meal method 

------------------------------------------

2. Breakfast, Lunch, or Dinner? (Part 2)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  'Evening'
end

puts meal

=end

Answer:

prints Evening. It is the only line in the method.

-------------------------------------------

3. Breakfast, Lunch, or Dinner? (Part 3)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
  return 'Dinner'
end

puts meal

=end

Answer:

prints Breakfast. When return is executed it exits the method and returns the value.

-------------------------------------------

4. Breakfast, Lunch, or Dinner? (Part 4)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

=end

Answer:

prints Dinner
       Breakfast
There are two puts meaning more than one value will be printed.

----------------------------------------------

5. Breakfast, Lunch, or Dinner? (Part 5)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  'Dinner'
  puts 'Dinner'
end

p meal

=end

Answer:

prints Dinner
       nil
return value is the last line of the method. In this case being puts 'Dinner'.
Two value are printed because there is a p and a puts.
the p instead of puts before meal allow the nil to be visible in  the output.

-------------------------------------------------

6. Breakfast, Lunch, or Dinner? (Part 6)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal

=end

Answer:

prints Breakfast. return exits the method meaning any line proceeding after will not be recognized.

-----------------------------------------------

7. Counting Sheep (Part 1)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

=end

Answer:

0
1
2
3
4
5
The times method starts with 0 and returns the initial number. 

-----------------------------------------------

8. Counting Sheep (Part 2)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

=end

Answer:

0
1
2
3
4
10
The times method starts from 0 and prints up until 4. The return value of the 
count_sheep method is also printed, which is 10, the last line evaluated in the method.

----------------------------------------------------

9. Counting Sheep (Part 3)
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

=end

Answer:

0
1
2
nil

prints numbers less than or equal to 2 than prints nil.
return will be processed once sheep equals 2. 
The method will end there and return the value provided by return.

--------------------------------------------

10. Tricky Number
=begin

What will the following code print? Why? Don't run it until you've attempted to answer.

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

=end

Answer:

prints 1. Since else clause was ignored than the tricky_number method returns -
what the variable number is assigned to, which is 1.



