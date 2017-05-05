1. Cute angles
=begin

Write a method that takes a floating point number that represents an angle between
0 and 360 degrees and returns a String that represents that angle in degrees, minutes, and seconds.
You should use a degree symbol (˚) to represent degrees,
a single quote (') to represent minutes, and a double quote (") to represent seconds.
There are 60 minutes in a degree, and 60 seconds in a minute.

=end

Answer:

def dms(angle)
  angle = angle.abs
  degrees = angle.divmod(1).first
  minutes = angle.divmod(1).last * 60
  seconds = minutes.divmod(1).last * 60
  format(%(#{degrees}°%02d'%02d"), minutes, seconds)
end

------------------------------------------

2. Delete vowels
=begin

Write a method that takes an array of strings,
and returns an array of the same string values,
except with the vowels (a, e, i, o, u) removed.

=end

Answer:

def remove_vowels(array)
  no_vowels = array.map do |letters|
    letters.delete('aeiouAEIOU')
  end
end

----------------------------------------------

3. Fibonacci Number Location By Length
=begin

Write a method that calculates and returns the index of the first Fibonacci number
that has the number of digits specified as an argument.
(The first Fibonacci number has index 1.)

=end

Answer:

def find_fibonacci_index_by_length(num_of_dig)
  fib = [1, 1]

  until fib.last.to_s.size == num_of_dig
    fib << fib[-2] + fib[-1]
  end

  fib.count
end

----------------------------------------------

4. Reversed Arrays (Part 1)
=begin

Write a method that takes an Array as an argument, and reverses its elements in place;
that is, mutate the Array passed in to this method. The return value should be the same Array object.

=end


Answer:

def reverse!(array)
  rev_arr = []
  loop do
    rev_arr << array.pop
    break if array.empty?
  end
  rev_arr.each { |element| array << element }
  array
end
or
def reverse!(list)
  list = list.sort! { |a, b| list.index(b) <=> list.index(a) }
end

-------------------------------------------------

5. Reversed Arrays (Part 2)
=begin

Write a method that takes an Array, and returns a new Array
with the elements of the original list in reverse order.
Do not modify the original list.

=end

Answer:

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end
or
def reverse(array)
  array.each_with_object([]) { |x, arr| arr.unshift(x) }
end

----------------------------------------------------

6. Combining Arrays
=begin

Write a method that takes two Arrays as arguments, and returns an Array
that contains all of the values from the argument Arrays.
There should be no duplication of values in the returned Array,
even if there are duplicates in the original Arrays.

=end

Answer:

def merge(arr1, arr2)
  merge = arr1 + arr2
  merge.uniq
end
or
def merge(arr1, arr2)
  arr1 | arr2
end

Array#| merges with no dup

--------------------------------------------------

7. Halvsies
=begin

Write a method that takes an Array as an argument,
and returns two Arrays that contain the first half and
second half of the original Array, respectively.
If the original array contains an odd number of elements,
the middle element should be placed in the first half Array.

=end

Answer:

def halvsies(arr)
  half = arr.length / 2.0
  [arr[0...(half.round)], arr[(half.round)..-1]]
end

------------------------------------------------

8. Find the Duplicate
=begin

Given an unordered array and the information that exactly one value in the array occurs twice
(every other value occurs exactly once), how would you determine which value occurs twice?
Write a method that will find and return the duplicate value that is known to be in the array.
=end

Answer:

def find_dup(array)
  dup = array.select { |el| array.count(el) > 1 }
  dup.first
end

* enumerable#find is the better choice for this method

--------------------------------------------

9. Does My List Include This?
=begin

Write a method named include? that takes an Array and a search value as arguments.
This method should return true if the search value is in the array, false if it is not.
You may not use the Array#include? method in your solution.

=end

Answer:

def include?(array, value)
  include = array.select { |el| el == value }
  !include.empty?
end
or
def include?(array, value)
  !!array.find_index(value)
end

----------------------------------------------

10. Right Triangles
=begin

Write a method that takes a positive integer, n, as an argument,
and displays a right triangle whose sides each have n stars.
The hypotenuse of the triangle (the diagonal side in the images below)
should have one end at the lower-left of the triangle, and the other end at the upper-right.

=end

Answer:

def triangle(num)
  count = 1
  num = num
  loop do
    puts ' ' * (num - 1) + '*' * (1 * count)
    count += 1
    num -= 1
    break if num == 0
  end
end


