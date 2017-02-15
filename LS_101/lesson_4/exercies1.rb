Exercises: Methods, More Methods and Sorting

Exercise 1
=begin

What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

=end

Answer:

[1, 2, 3]. The return value 'hi' will always be truthy.Select will therefore return original array.

------------------------------------------------

Exercise 2
=begin

How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

=end

Answer:

The count method counts the item in enum that return true to the given block.
If an argument is given, it counts the items that are equal to the argument.
You can find this by checking docs for Array#count.

---------------------------------------------------

Exercise 3
=begin

What is the return value of reject? Why?

[1, 2, 3].reject do |num|
  puts num
end

=end

Answer:

1
2
3
puts returns nil. The reject method returns all elements which return falsey to the given block.

-----------------------------------------------------

Exercise 4
=begin

What is the return value of each_with_object? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

=end

{"a"=>"ant", "b"=>"bear", "c"=>"cat"}
Creates a hash of the first index of each item as the key and the item as the value.

------------------------------------------------------

Exercise 5
=begin

What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

=end

Answer:

Removes a key-value pair from hsh and returns it as the two-item array [ key, value ],
or the hash’s default value if the hash is empty.
You can find this by looking it up in doc Hash#shift.

------------------------------------------------------

Exercise 6
=begin

What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

=end

Answer:

The return value is 11. Pop removes the last element from self and returns it, or nil if the array is empty.
size returns the number of elements in self, which would in this case be 'caterpillar'.

-------------------------------------------------------

Exercise 7
=begin

What is the block's return value in the following code? How is it determined?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=end

Answer:

Returns true. The blocks return is determined by the last expression in the block.
num.odd? returns a boolean. It can be either true or false.

----------------------------------------------------------

Exercise 8
=begin

How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

=end

Answer:

Returns first n elements from the array.
If a negative number is given, raises an ArgumentError.
It is not destructive.
You can find this by checking docs Array#take and/or running it in the irb.

-------------------------------------------------------------
Exercise 9
=begin

What is the return value of map? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

=end

Answer:

[ nil,'bear']
.map returns an array. In this case the if condition only evaluates to true if the value is greater than 3.
When none of the if statements evaluate to true, nil is returned.

------------------------------------------------------------

Exercise 10
=begin

What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=end

Answer:

It prints
2
3
and returns
[ 1, nil, nil ]
For the first element the if condition evaluates to false.
For the rest of the elements in the array, num > 1 evaluates to true.
Making the return value for those iterations, nil.

-------------------------------------------------------------

Exercise 11
=begin

How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

=end

Answer:

arr.sort { |a,b| b.to_i <=> a.to_i }
Strings are compared character by character, so '11' will be evaluated to be lesser than '7'.
In order to compare the strings as integers, we need to convert them to integers within the block.

--------------------------------------------------------------

Exercise 12
=begin

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]

=end

Answer:

books.sort_by do |book|
  book[:published]
end

since all values in publish are string, we can compare them.
They are all 4 characters in size so there is no need to convert them into integers.