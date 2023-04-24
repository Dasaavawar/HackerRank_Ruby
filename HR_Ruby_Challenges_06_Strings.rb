# HackerRank - Ruby - Challenges - VI - Strings


# 1. Strings - Ruby - Strings - Introduction
#
# Numbers, boolean values and strings are some of the fundamental data types that we have explored in our previous challenges. In this set of tutorials, we turn our attention to the data type referred to as String or Text literals (https://en.wikipedia.org/wiki/Literal_(computer_programming)).
#
# String data types are a sequence of characters, each of which occupies 1 byte of memory. Technically, you could represent the string using an array (or some collection) of characters, similar to that of classic languages like C. Any character outside the ASCII encoding (https://en.wikipedia.org/wiki/ASCII) set is restricted in C. How do we represent characters outside this range?
#
# Before answering this question, let's learn about the different ways to represent strings,what they mean and their use cases.
#
# Ruby provides 3 ways of including string literals into your source code.
#
#  1.  Single quoted strings
# The easiest way of adding text is by surrounding it with single quote (apostrophe) symbols. However, characters like an apostrophe and a backslash within the string need to be escaped if they are present.
#
> 'Hello! Programmer. How\'s it going?'
#
#  1.  Double quoted strings
# Double quoted strings are more flexible, and they allow special escape sequences, e.g.\t, \n, which don't work with single quoted strings. More importantly, they allow the embedding of arbitrary expressions. When a string is created, the expression in the string is evaluated, converted to a string and inserted into the text in place of the expression. This process is known as interpolation.
#
 > "Hello! There is a tab \t here. Did you see?"
 > "My name is Circle, and I love Pi. Pi is equal to #{Math::PI}"
#
#  1.  Here documents
# This is helpful for putting large amounts of text without worrying about escape sequences or string evaluation. “Here documents” begin with <<-. These are followed immediately by an identifier or string that specifies the ending delimiter. (No space is allowed, to prevent ambiguity with the left-shift operator.)The text of the string literal begins on the next line and continues until the text of the delimiter appears on a line by itself. For example:
#
document = <<-HERE         # We begin with <<- followed by the ending delimiter HERE
This is a string literal.
It has two lines and abruptly ends with a newline...
HERE
#
# (Example from The Ruby Programming Language)
#
# In this introductory challenge, your task is to use each of the above three methods to return the text Hello World and others!
#
# Solution
#

def single_quote
    # single quote string here
    'Hello World and others!'
end

def double_quote
    # Double quote string here
    "Hello World and others!"
end

def here_doc
    # Here doc string here
    document = <<-HERE
    Hello World and others!
    HERE
end


# 2. Strings - Ruby - Strings - Encoding
#
# In Ruby, strings are objects of the String class (https://ruby-doc.org/core-2.3.1/String.html), which defines a powerful set of operations and methods for manipulating text (e.g., indexing, searching, modifying, etc.). Here are a few easy ways to create Strings:
#
my_string = "Hello." # create a string from a literal
my_empty_string = String.new # create an empty string
my_copied_string = String.new(my_string) # copy a string to a new variable
#
# Until Ruby 1.8, Strings were nothing but a collection of bytes. Data was indexed by byte count, size was in terms of number of bytes, and so on. Since Ruby 1.9, Strings have additional encoding (https://ruby-doc.org/core-2.2.2/Encoding.html) information attached to the bytes which provides information on how to interpret them. For example, this code:
#
str = "With ♥!"
print("My String's encoding: ", str.encoding.name) 
print("\nMy String's size: ", str.size)
print("\nMy String's bytesize: ", str.bytesize)
#
# produces this output:
#
# My String's encoding: UTF-8
# My String's size: 7
# My String's bytesize: 9
#
# You can make the following observations about the above code:
#
#  1.  The string literal creates an object which has several accessible methods.
#  2.  The string has attached encoding information indicating it's an UTF-8 string (https://en.wikipedia.org/wiki/UTF-8).
#  3.  A String's size corresponds to the umber of characters we see.
#  4.  A String's bytesize corresponds to the actual space taken by the characters in memory (the ♥ symbol requires 3 bytes instead of 1).
#
# Although UTF-8 is the most popular (and recommended) encoding style for content, Ruby supports 100 other encodings (try puts Encoding.list for the full list). With this in mind, we should learn how to convert between different encodings.
#
# Task
#
# In this challenge, we practice setting the encoding information for some string of text using Ruby's Encoding methods (https://ruby-doc.org/core-2.2.2/Encoding.html#class-Encoding-label-Changing+an+encoding). Write a function named transcode which takes a ISO-8859-1 encoded string as a parameter, converts it to an UTF-8 encoded string, and returns the result.
#
# Input Format
#
# Our hidden code checker will call your function, passing it an ISO-8859-1 encoded string as an argument.
#
# Constraints
#
# Your function must be named transcode.
#
# Output Format
#
# Your function must return an UTF-8 encoded string.
#
# Solution
#

# Your code here.
def transcode(encoded_string)
    encoded_string.force_encoding(Encoding::UTF_8)    
end


# 3. Strings - Ruby - Strings - Indexing
#
# When you index a string, you extract or alter the portions. This is perhaps the most important operation you want to perform on strings. The string class provides a convenient array-like square bracket [] operator, which allows you to extract portions of the string as well as altering the content when used on the left side of an assignment.
#
# Consider the following examples:
#
 > str = "Hello World!"
 > str[str.size-1]
 "!"
 > str[-1] # first character from the end of the string
 "!"
 > str[-2] # second last character
 "d"
 > str[0] # first character
 "H"
#
# More often, you'd want to extract specific portions of the string rather than individual characters. To do this, use comma separated operands between the square brackets. The first operand specifies an index (which may be negative), and the second specifies a length (which must be non-negative).
#
# Consider the example below:
#
 > str[0,4] # first four characters
 "Hell"
 > str[6,3] # 3 characters starting from index 6 ( 0-indexing )
 "Wor"
 > str[-1, 1] # 1 character starting from the END of string
 "!"
#
# The same examples shown above can be used for assignment / deletion of characters. We can insert characters by giving a non-empty assignment or delete characters in the range by giving an empty assignment.
#
# Consider the example below:
#
 > str = "Hello"
 > str[str.size, 0] = " World!" # append by assigning at the end of the string
 > str
 "Hello World!"
 > str[5, 0] = "," # insert a comma after the 5th position
 > str[5, 6] = ""  # delete 6 characters starting from index 5. 
 "Hello!"
 > str[5,1] = " World" # replace the string starting from index 5 and of length 1 with the given string. 
#
# But wait, there's more! Ruby also allows you to index strings using a Range or a Regexp object as well. We will discuss these methods in the future.
#
# In this challenge, your task is to code a serial_average method which is described below:
#
#  1.  It takes a fixed width string in format: SSS-XX.XX-YY.YY. SSS is a three digit serial number, XX.XX and YY.YY are two digit numbers including up to two decimal digits.
#  2.  It returns a string containing the answer in format SSS-ZZ.ZZ where SSS is the serial number of that input string, and ZZ.ZZ is the average of XX.XX and YY.YY.
#  3.  All numbers are rounded off to two decimal places.
#
# For example:
#
 > serial_average('002-10.00-20.00')
 "002-15.00"
#
# You can use string interpolation (https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals#Interpolation) to insert Ruby code within a string.
#
# For example:
#
 > tmp = 123
 > "Hello #{tmp}"
 Hello 123
#
# Constraints
#
# -
#
# Solution
#

# Your code here
def serial_average(input_string)
    init_string = input_string[0, 3]
    first_number = (input_string[4, 8]).to_f
    second_number = (input_string[10, 14]).to_f
    average = ((first_number + second_number) / 2)
    return "#{init_string}-#{average.round(2)}"
end


# 4. Strings - Ruby - Strings - Iteration
#
# In our encoding tutorial, we learned about the different ways Ruby 1.8 and Ruby 1.9 (and higher versions) represent strings internally. The major difference is a wide range of encoding (non-ascii) support in the later versions. This change, however, also overhauls the way strings were iterated between the two versions.
#
# In Ruby 1.8, there's a single each method (remember Enumerable?) which allowed it to iterate over lines of data. While it might seem like a logical option to have, how would one go about iterating on each byte or each character? It turns out that it was not so clean, and people had to resort to tricks for some of these functionalities.
#
# With Ruby 1.9, each was removed from the String class and is no longer an Enumerable. Instead, we have more explicit choices based on what we need to iterate - bytes, chars, lines or codepoints.
#
#  1.  each_byte iterates sequentially through the individual bytes that comprise a string;
#  2.  each_char iterates the characters and is more efficient than [] operator or character indexing;
#  3.  each_codepoint iterates over the ordinal values of characters in the string;
#  4.  each_line iterates the lines.
#
# For example:
#
 > money = "¥1000"
 > money.each_byte {|x| p x} # first char represented by two bytes
 194
 165
 49
 48
 48
 48
 > money.each_char {|x| p x} # prints each character
 "¥"
 "1"
 "0"
 "0"
 "0"
#
# Without a doubt, Ruby 1.9 makes iteration easier to understand and implement. Hence, we'll stick with Ruby 1.9 and later versions for current and other challenges (unless otherwise stated).
#
# Challenge: Write the method count_multibyte_char which takes a string as input and returns the number of multibyte characters (byte size > 1) in it.
#
# For example:
#
 > count_multibyte_char('¥1000')
 1
#
# Solution
#

# Your code here
def count_multibyte_char(input_string)
    count = 0
    input_string.each_char { |ch| count+=1 if ch.bytesize > 1 }
    count
end


# 5. Strings - Ruby - Strings - Methods I
#
# Text info can be read from varied sources and is often unsuitable for direct processing or usage by core functions. This necessitates methods for post-processing and data-fixing. In this tutorial, we'll learn how to remove flanking whitespace and newline from strings.
#
#  1.  String.chomp(separator=$/): Returns a new string with the given separator removed from the end of the string (if present). If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is, it will remove \n, \r, and \r\n).
#
 > "Hello World!  \r\n".chomp
 "Hello World!  "
 > "Hello World!".chomp("orld!")
 "Hello W"
 > "hello \n there".chomp
 "hello \n there"
#
#  2.  String.strip - Returns a new string with the leading and trailing whitespace removed.
#
 > "    hello    ".strip
 "hello"
 > "\tgoodbye\r\n".strip
 "goodbye"
#
#  3.  String.chop - Returns a new string with the last character removed. Note that carriage returns (\n, \r\n) are treated as single character and, in the case they are not present, a character from the string will be removed.
#
 > "string\n".chop
 "string"
 > "string".chop
 "strin"
#
# In this challenge, your task is to code a process_text method, which takes an array of strings as input and returns a single joined string with all flanking whitespace and new lines removed. Each string has to be separated by a single space.
#
 > process_text(["Hi, \n", " Are you having fun?    "])
 "Hi, Are you having fun?"
#
# Solution
#

# Your code here
def process_text(input_array)
    input_array.map(&:strip).join(" ")
end


# 6. Strings - Ruby - Strings - Methods II
#
# In this tutorial, we'll learn about the methods in String class that help us to search and replace portions of the string based on a text or pattern.
#
#  1.  String.include?(string) - Returns true if str contains the given string or character. Very simple!
#
 > "hello".include? "lo"   #=> true  
 > "hello".include? "ol"   #=> false  
#
#  2.  String.gsub(pattern, <hash|replacement>) - Returns a new string with all the occurrences of the pattern substituted for the second argument: . The pattern is typically a Regexp, but a string can also be used.
#
 "hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
 "hello".gsub(/([aeiou])/, '')             #=> "hll"
#
# Either method will depend upon the problem you are trying to solve, and the nature of input-output behavior you desire.
#
# In this challenge, your task is to write the following methods:
#
#  1.  mask_article which appends strike tags around certain words in a text. The method takes 2 arguments: A string and an array of words. It then replaces all the instances of words in the text with the modified version.
#  2.  A helper method strike, given one string, appends strike off HTML tags around it. The strike off HTML tag is <strike></strike>.
#
# For example:
#
 > strike("Meow!") # => "<strike>Meow!</strike>"
 > strike("Foolan Barik") # => "<strike>Foolan Barik</strike>"
 > mask_article("Hello World! This is crap!", ["crap"])
 "Hello World! This is <strike>crap</strike>!"
#
# Apply the helper method in completing your main method.
#
# Solution
#

# Enter your code here
def strike(input_string)
    '<strike>#{input_string}</strike>'
end

def mask_article(text, words_arr)
    words_arr.each do |word|
        text.gsub!(word, strike(word))
    end
    text
end


