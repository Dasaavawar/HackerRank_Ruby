# HackerRank - Ruby - Challenges - I - Introduction


# 1. Introduction - Ruby Tutorial - Hello HackerRank!
#
# Let's get started with Ruby!
#
# Go ahead and type the following code in the code-editor:
#
print "Hello HackerRank!!"
#
# Solution
#

print "Hello HackerRank!!"


# 2. Introduction - Ruby Tutorial - Everything is an Object
#
# Everything is an object in Ruby. For instance, if you type
#
print self
#
# in the code-editor, Ruby treats self as the object in which it is currently referred to.
#
# Give it a try!
#
# Solution
#

print self


# 3. Introduction - Ruby Tutorial - Object Methods
#
# Each object in Ruby may have methods associated with it. To demonstrate this, we want you to print whether a number is even or odd. A number has an even? method associated with it, which returns true or false based on the parity of the number.
#
# Assuming a variable number is already defined, check whether a given number is even or not.
#
# Hint
#
# Type in the code-editor
#
return number.even?
#
# or
#
number.even?
#
# Input Format
#
# The first line of input contains an integer n. The next n contains one integer in each line.
#
# Output Format
#
# The output is handled by the code written in the editor.
#
# Solution
#

def odd_or_even(number)
    number.even? # add your code here
end

(0...gets.to_i).each do |i|
    puts odd_or_even(gets.to_i)
end


# 4. Introduction - Ruby Tutorial - Object Method Parameters
#
# A method may take zero or more parameters as input. To demonstrate this, we look at the asserts we use on HackerRank. Sometimes, we have to check whether a given number a is within the range b and c (where b ≤ c, and both inclusive ).
#
# Three variables a, b, and c are already defined. Your task is to write code that checks whether a is within the range of b and c by calling the method range? (which we have defined for you as a method for this example) on a and passing b and c as arguments.
#
# Hint
#
a.range?(b, c)
#
# or
#
return a.range?(b, c)
#
# or
#
a.range? b, c
#
# or
#
return a.range? b, c
#
# Solution
#

a.range?(b, c) # write your code here

