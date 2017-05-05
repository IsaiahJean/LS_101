1. First Car
=begin

Create a hash that contains the following data and assign it to a variable named car.

type	color	mileage
sedan	blue	80_000

=end

Answer:

car = {
  type: 'sedan',
  color: 'blue',
  mileage: 80_000
}

----------------------------------

2. Adding the Year
=begin

Using the code below, add the key :year and the value 2003 to car.

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}

=end

Answer:

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}

car[:year] = 2003

-----------------------------------

3. Broken Odometer
=begin

Using the following code, delete the key :mileage and its associated value from car.

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}

=end

Answer:

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}

car.delete(:mileage)

-------------------------------------

4. What Color?
=begin

Using the following code, select the value 'blue' from car and print it with #puts.

car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}

=end

Answer:

car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}

puts car[:color]

-----------------------------------

5. Labeled Numbers
=begin

Use Hash#each to iterate over numbers and print each element's key/value pair.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

=end

Answer:

numbers = {
  high:   100,
  medium: 50,
  low:    10
}
numbers.each { |k, v| puts "A #{k} number is #{v}." }

-------------------------------------

6. Divided by Two
=begin

Use Hash#map to iterate over numbers and return an array containing each number divided by 2.
Assign the returned array to a variable named half_numbers and print its value using #p.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

=end

Answer:

numbers = {
  high:   100,
  medium: 50,
  low:    10
}
half_numbers = numbers.map { |_, v| v / 2 }
p half_numbers

------------------------------------------

7. Low, Medium, or High?
=begin

Use Hash#select to iterate over numbers and return a hash containing only key-value pairs
where the value is less than 25.
Assign the returned hash to a variable named low_numbers and print its value using #p.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

=end

Answer:

numbers = {
  high:   100,
  medium: 50,
  low:    10
}
low_numbers = numbers.select { |_, v| v < 25 }
p low_numbers

----------------------------------------------

8. Low or Nothing
=begin

In the following code, numbers isn't mutated because #select isn't a destructive method.
However, there is a destructive version of #select named #select!.
Modify the code so that #select mutates numbers.

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select do |key, value|
                 value < 25
               end

p low_numbers
p numbers

=end

Answer:

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end

p low_numbers
p numbers

-----------------------------------------

9. Multiple Cars
=begin

Create a nested hash using the following data.

Car

type	color	year
sedan	blue	2003

Truck

type	color	year
pickup	red	1998

=end

Answer:

{
  car:   { type: 'sedan', color: 'blue', year: 2003 },
  truck: { type: 'pickup', color: 'red', year: 1998 }
}

--------------------------------------------

10. Which Collection?
=begin

Rewrite car as a nested array containing the same key-value pairs.

car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

=end

Answer:


car = [[type:  'sedan'], [color: 'blue'], [year:  2003]]


