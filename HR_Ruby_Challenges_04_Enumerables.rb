# HackerRank - Ruby - Challenges - IV - Enumerables


# 1. Enumerables - Ruby - Enumerable - Introduction
#
# In control structures tutorial, we learned about various methods to iterate over a collection like unless, loop and the most commonly used each method (https://www.hackerrank.com/challenges/ruby-tutorial-each/problem).
#
# Ruby, however, provides an Enumerable module which packages a bunch of methods which can be used with any other class by including it (referred to as mixing in). That means that programmers don't have to write all those methods many different times for different objects. As long as the custom object defines an each method and includes Enumerable module, it can get access to all of its magic.
#
# In this challenge, you have been provided with a custom object called colors that defines its own each method. You need to iterate over the items and return an Array containing the values.
#
# Solution
#

def iterate_colors(colors)
    # Your code here
    result = []
    colors.each do |x|
        result << x
    end
    result
end


# 2. Enumerables - Ruby - Enumerable - each_with_index
#
# In the previous challenge, we learned about each method being central to all of the methods provided by Enumerable class. One of such useful methods is each_with_index which allows you to iterate over items along with an index keeping count of the item.
#
# For example,
#
 > colors = ['red', 'green', 'blue']
 > colors.each_with_index { |item, index| p "#{index}:#{item}" }
 "0:red"
 "1:green"
 "2:blue"
#
# As you can note, the counting of items starts from 0.
#
# In this challenge, your task is to complete the skip_animals method that takes an animals array and a skip integer and returns an array of all elements except first skip number of items as shown in the example below.
#
# For example,
#
 > skip_animals(['leopard', 'bear', 'fox', 'wolf'], 2)
 => ["2:fox", "3:wolf"]
#
# It is guaranteed that number of items in animals array is greater than the value of skip.
#
# Solution
#

def skip_animals(animals, skip)
  # Your code here
    arr = []
    animals.each_with_index { |item, index| arr.push( "#{index}:#{item}" ) unless index < skip }
    arr
end


# 3. Enumerables - Ruby - Enumerable - collect
#
# Beside simple methods to iterate over objects, Ruby Enumerable provides a number of important higher order constructs that we shall explore in further challenges. One of such important methods is collect method, also known as map.
#
# map as the name may suggest, takes a function and maps (applies) it to a collection of values one by one and returns the collection of result.
#
# That is,
#
# map(f(x), [x1, x2, x3, ..., xn]) -> [f(x1), f(x2), f(x3), ..., f(xn)]
#
# This single powerful method helps us to operate on a large number of values at once.
#
# For example,
#
 >>> [1,2,3].map { |x| 2*x }
 => [2, 4, 6]
 >>> {:a=>1, :b=>2, :c=>3}.collect { |key, value| 2*value }
 => [2, 4, 6]
#
# Note that these methods are different from each in the respect that these methods return a new collection while former returns the original collection, irrespective of whatever happens inside the block.
#
# In this challenge, your task is to write a method which takes an array of strings (containing secret enemy message bits!) and decodes its elements using ROT13 cipher system (https://en.wikipedia.org/wiki/ROT13); returning an array containing the final messages.
#
# For example, this is how ROT13 algorithm works,
#
# Original text:
#
 Why did the chicken cross the road?
 Gb trg gb gur bgure fvqr!
#
# On application of ROT13,
#
 Jul qvq gur puvpxra pebff gur ebnq?
 To get to the other side!
#
# Solution
#

def rot13(secret_messages)
    # your code here
    alphabet = 'A-Za-z'
    ciphered_alphabet = 'N-ZA-Mn-za-m'
    secret_messages.map {|x| x.tr(alphabet, ciphered_alphabet)}
end


# 4. Enumerables - Ruby - Enumerable - reduce
#
# A common scenario that arises when using a collection of any sort, is to get perform a single type of operation with all the elements and collect the result.
#
# For example, a sum(array) function might wish to add all the elements passed as the array and return the result.
#
# A generalized abstraction of same functionality is provided in Ruby in the name of reduce (inject is an alias). That is, these methods iterate over a collection and accumulate the value of an operation on elements in a base value using an operator and return that base value in the end.
#
# Let's take an example for better understanding.
#
 >>> (5..10).inject(1) {|product, n| product * n }
 => 151200
#
# In above example, we have the following elements: a base value 1, an enumerable (5..10), and a block with expressions instructing how to add the calculated value to base value (i.e., multiply the array element to product, where product is initialized with base value)
#
# So the execution follows something like this:

# loop 1
n = 1
product = 1
return value = 1*1

# loop 2
n = 2
product = 1
return value = 1*2

n = 3
product = 2
return value = 2*3

..
#
# As you can notice, the base value is continually updated as the expression loops through the element of container, thus returning the final value of base value as result.
#
# Other examples,
#
 >>> (5..10).reduce(1, :*)   # :* is shorthand for multiplication
 => 151200
#
# Consider an arithmetico-geometric sequence where the nth term of the sequence is denoted by tn = n^2 + 1, n ≥ 0. In this challenge, your task is to complete the sum method which takes an integer n and returns the sum to the n terms of the series.
#
# Solution
#

def sum_terms(n)
    # your code here
    (1..n).inject(0) {|sum, n| sum + n**2 + 1}
end


# 5. Enumerables - Ruby Enumerables: 'any', 'all', 'none', and 'find'
#
# Ruby offers various enumerables (https://ruby-doc.org/core-2.2.3/Enumerable.html) on collections that check for validity of the objects within it.
#
# Consider the following example:
#
 > arr = [1, 2, 3, 4, 5, 6]
 => [1, 2, 3, 4, 5, 6]
 > h = {"a" => 1, "b" => 2, "c" => 3}
 => {"a" => 1, "b" => 2, "c" => 3}
#
# The any? (https://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-any-3F) method returns true if the block ever returns a value other than false or nil for any element passed to it:
#
 > arr.any? {|a| a % 2 == 0} # checks if any number in the array is even
 => True
 > h.any? {|key, value| value.is_a? String} # checks if any value of the Hash object is of the type String
 => False
#
# The all? (https://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-all-3F) method returns true if the block never returns false or nil for any element passed to it:
#
 > arr.all? {|a| a.is_a? Integer} # checks if all elements of the array are of the type Integer
 => True
 > h.all? {|key, value| key.is_a? String} # checks if all keys of the Hash object are of the type String
 => True
#
# The none? (https://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-none-3F) method returns true if the block never returns true for any element passed to it:
#
 > arr.none? {|a| a.nil?} # Checks if none of the elements in the array are of nil type
 => True
 > h.none? {|key, value| value < 3} # checks if all values of the Hash object are less than 3
 => False
#
# The find (https://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-find) method returns the first element for which block is not false:
#
 > arr.find {|a| a > 5} # returns the first element greater than 5 and `nil` if none satisfies the condition
 => 6
 > h.find {|key, value| key == "b"} # returns an Array of the first match [key, value] that satisfies the condition and nil otherwise
 => ["b", 2]
#
# Task
# Based on what you've learned above, complete the functions declared in your editor below.
#
# Solution
#

def func_any(hash)
    # Check and return true if any key object within the hash is of the type Integer
    # If not found, return false.
    hash.any? {|key, value| key.is_a? Integer}
end

def func_all(hash)
    # Check and return true if all the values within the hash are Integers and are < 10
    # If not all values satisfy this, return false.
    hash.all? {|key, value| value.is_a? Integer and value < 10 }
end

def func_none(hash)
    # Check and return true if none of the values within the hash are nil
    # If any value contains nil, return false.
    hash.none? {|key, value| value.nil?}
end

def func_find(hash)
    # Check and return the first object that satisfies either of the following properties:
    #   1. There is a [key, value] pair where the key and value are both Integers and the value is < 20 
    #   2. There is a [key, value] pair where the key and value are both Strings and the value starts with `a`.
    hash.find {|key, value| (key.is_a? Integer and value.is_a? Integer and value < 20) or (key.is_a? String and value.is_a? String and value.start_with? 'a')}
end


# 6. Enumerables - Ruby - Enumerable - group_by
#
# Another function often used with data collections is one which groups the elements according to some evaluation result.
#
# Consider the following example. Let's say you have a list of 100 integers and you want to group them according to their even and odd value.
#
# In Ruby, you can easily do this by using group_by method provide by Enumerable module.
#
 > (1..5).group_by {|x| x%2}
 {1=>[1,3,5], 0=>[2, 4]}
#
# Of course this is a very simple example and its use can be very complicated in nature.
#
# In this challenge, your task is to group the students into two categories corresponding to their marks obtained in a test. The list of students will be provided in a marks hash with student name as key and marks obtained (out of 100) as value pair, along with the pass_marks as argument.
#
# The method group_by_marks must return a Hash containing an array of students who passed as value to Passed key, and those who failed as value to Failed key. If a particular key is empty, don't return that key.

# For example,
#
 > marks = {"Ramesh":23, "Vivek":40, "Harsh":88, "Mohammad":60}
 > group_by_marks(marks, 30)
 => {"Failed"=>[["Ramesh", 23]], "Passed"=>[["Vivek", 40], ["Harsh", 88], ["Mohammad", 60]]}
#
# Solution
#

def group_by_marks(marks, pass_marks)
    # your code here
    marks.group_by do |name, score|
        score < pass_marks ? "Failed" : "Passed"
    end
end

