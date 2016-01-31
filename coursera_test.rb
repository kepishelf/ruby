# ruby playground / sandbox = d:\sandbox\ruby\coursera_test.rb
#  see notes from coursera :  d:\sandbox\ruby\ruby-reference.txt
a = 6

# ----------------------------------------------------------
# IF ELSE, CASE, UNTIL
# ----------------------------------------------------------
puts 'more stuff after this'
if a==3 
	puts 3
elseif a==4 
	puts 4
else 
	puts "I dont know how much a is = to"
end
puts "a = to : #{a}" 
unless a == 6
  puts "a is not 6 "
end

# LOOPS - while and until loop
while a < 9
  puts a
  a += 1
end

until  a > 11
  puts a
  a += 1
end

resa = 2
resa *= 6
puts resa


# ----------------------------------------------------------
# MODIFIER
# ----------------------------------------------------------
a=5; b=0
puts "execute in one line : " if a == 5 and b == 0 
resa = 2
# multiplel resa * 2  while the result (resa) is less than 100 2, 4, 8, 16, 32, 64, x  128
resa *= 2 while resa < 9
puts resa

# TRUE / FALSE
c = nil
puts "true" if "false"
puts "false" if false
puts "false" if c == nil

# TRIPLE EQUALS   -- does this regular expression (/sera/) MATCH the "coursera" string
if /sera/ === "coursera" 
	puts "Triple Equals"
end

# ----------------------------------------------------------
# CASE
# ----------------------------------------------------------

puts ' -------------- testing CASE'
age = 53
case
  when age > 21
    puts "legal"
  when 1 === 0
    puts "illogical"
 else
   puts "default case"
end

name = 'Fisher'
case name
 when /fish/i then puts "reg exp matched the name : #{name} "
 when 'Smith' then puts "the name var matched. value = #{name}"
end

# ----------------------------------------------------------
# FOR - each,  times
# ----------------------------------------------------------
for i in 200..202
  puts i
end
puts " after for i = #{i}"
# each
ary = [1,2,3,4,5]
ary.each do |i|
   puts i
end

# ----------------------------------------------------------
# METHODS
# ----------------------------------------------------------
def simple()
  puts "this is method simple"
end
puts simple()
#- what is restuned : the last executed line in the method
def multiply( a, b )
 a * b
end
puts multiply(3,18)

def divide_by?(number)
  # number has a method "zero"
  return false if number.zero?
  # else return true
  true
end
puts divide_by? 0

# default arguments
def add_numbers(a = 2)
  a + 7
end
puts add_numbers()

def max(p1, *unknown_numbers, p3)
  unknown_numbers.max
end
puts max("jeff", 2,5,2,7,19,20, "")


# ----------------------------------------------------------
# BLOCKS
# ----------------------------------------------------------
3.times do |index|
 if index > 0 
   puts index 
 end
end
# or via single line
3.times { |index| puts index if  index > 0  }

# Methods and passing blocks : implicit, epxlicit
def testmethod
  return "no passed block of code" unless block_given?
  yield
  yield
end
puts testmethod()
puts testmethod() {puts 'hello world'}


# EXplicit :  pushed as last parameter and use a "call" parameter
def test_explicit(&block_of_code)
  return "no block passed" if block_of_code.nil?
  block_of_code.call
end
puts test_explicit()
puts test_explicit() { puts "New text passed to method" }


# ----------------------------------------------------------
# FILES
# ----------------------------------------------------------

# read and display entire file
open('watcher.cfg') { |f| puts f.read }

filename = 'testa.txt'
# check that file exists 
begin
  File.foreach( filename ) do |line|
    puts "--------- #{line}"
    puts line.chomp    # remote newline char from end of string
    arr = line.split
    puts arr
  end
rescue Exception => e
  puts "error missing file : #{e.message}"
end  
if File.exist? filename
  puts "file found"
else
  puts "file NOT found" 
end
puts "End of file Exist / Read"

# WRITING to files
newfile = "jeffoutput.txt"
File.open(newfile, "w") do |filehandle|
  puts "Writing to #{newfile}"
  filehandle.puts "line#1"
  filehandle.puts "line#2"
  filehandle.puts "line#3"
end

puts ENV["NWUSERNAME"] = "GAVEL"
puts ENV["NWUSERNAME"]



# ----------------------------------------------------------
# STRINGS / SYMPOLS
# ----------------------------------------------------------
puts "jeff \nWarvel \n"
a=24;b=6
puts "#{a} times #{b}  = #{ a * b } "

myname = "Jeff Warvel"
myname[3,2] = 'xxxxx'
puts myname
:ThisIsaSymbol

cur_weather = %Q{It's a hot day outside 
			     Grab your umbrellas…} 
puts cur_weather
cur_weather.lines do |line| 
  line.sub! 'hot', 'rainy' # substitute 'hot' with 'rainy' 
  puts "#{line.strip}" 
end 

# ----------------------------------------------------------
# ARRAYS 
# ----------------------------------------------------------
arr_words  = %w{ jeff warvel was here }
puts arr_words
puts arr_words.first
puts arr_words[-2,1]		# start at end, go back to and use 1
puts arr_words[1..2]
puts arr_words.join(';')	# convert space to semicolon

# appending : push or <<
# Remove 	: pop or shift
# Set 		: [] =
# Sample 	: randomly pull out elements
# Sorting 	: sort!,  reverse!    

# You want a stack (LIFO)? Sure 
stack = []; stack << "one"; stack.push ("two") 
puts stack
puts stack.pop # => two 
puts "after pop #{stack}"

# You need a queue (FIFO)? We have those too... 
queue = []; queue.push "one"; queue.push "two" ; queue.push "thre" 
puts queue.shift 		# removes the first item in
puts queue 

a = [5,3,4,2].sort!.reverse! 
p a # => [5,4,3,2] (actually modifies the array) 
p a.sample(2) # => 2 random elements
a = [5,3,4,2].sort!.reverse! 

a = [5,3,4,2]
a[6] = 33 
p a 			# will add 2 nils to auto expand array  => [5, 4, 3, 2, nil, nil, 33]

# array Methods - common
arr1 = [2,3,4,5,22]
arr1.each { |value| print " next #{value} " }
puts ""
sel_arr = arr1.select { |num| num > 3}
puts sel_arr
puts map_arr = arr1.map{ |x| x-200}

# ----------------------------------------------------------
# RANGES
# ----------------------------------------------------------
arange = 1..6
puts (1..10) === 9.375		# true
puts arange.to_a.sample(2)	# convert to array and get a sample (random of 2 elements of array)


# ----------------------------------------------------------
# HASHES
# ----------------------------------------------------------
puts "--------------- HASHES --------------------------"

hashmap = { "key1" => "value of key", "size" => 22 }
hashmap["jeff"] = "warvel"
hashmap.each_pair do | key, value|
  puts "Key: #{key} = #{value}"
end
puts "nil" if hashmap["missing"] == nil 

# init a hash to values of zero, then count words and put sums into this Hash
word_frequency = Hash.new(0) 
sentence = "Chicka chicka boom boom" 
sentence.split.each do |word| 
  word_frequency[word.downcase] += 1 
  puts "counting #{word}, currval = #{word_frequency[word.downcase]}"
end 
puts word_frequency # => {"chicka" => 2, "boom" => 2}


# Named parameter "like" behavior... 
#  method, with a default "hash" argument setting foreground, and backgroup
def adjust_colors (props = {foreground: "red", background: "white"}) 
  puts "Foreground: #{props[:foreground]}" if props[:foreground] 
  puts "Background: #{props[:background]}" if props[:background] 
end 
adjust_colors # => foreground: red 
              # => background: white 
# now set forground using a symbol (2 ways)
# 3 ways to set the value... note the ({} )are optional
adjust_colors ({ :foreground => "green" }) # => foreground: green 
adjust_colors background: "yella" # => background: yella 
adjust_colors :background => "magenta" # => background: magenta


# block and hash Confusion
a_hash = { :one => "one" } 
puts a_hash # => {:one=>"one"} 
# If you try to print out a hash  - you get a SyntaxError 
# RUBY GETS CONFUSED AND THINKS {} IS A BLOCK!!!
#    puts { :one => "one" } 

# To get around this - you can use parens around the Hash
puts ({ :one => "one" }) 



# ----------------------------------------------------------
# CLASSES
# ----------------------------------------------------------
puts "--------------- CLASSES --------------------------"
class Person 
  def initialize (name, age) # "CONSTRUCTOR" 
    @name = name 
    @age = age 
  end 
  def get_info 
    @additional_info = "Interesting" 
    "Name: #{@name}, age: #{@age}" 
  end 
end 

# Create an object of Person class and assign to "person1" var
person1 = Person.new("Joe", 14) 
# show the "instance" variables available to to object from the Class "Person"
p person1.instance_variables 			# [:@name, :@age] 
# This adds an another Instance varaible @additional_info
puts person1.get_info 					# => Name: Joe, age: 14 
p person1.instance_variables 			# [:@name, :@age, :@additional_info] 


# Access to Instance Variables - must define GETTER, SETTER methods
#   getter, setter   methods
class Person2
  def initialize (name, age) # "CONSTRUCTOR" 
    @name = name 
    @age = age 
  end 
  def get_info ()
    @additional_info = "Interesting" 
    "Name: #{@name}, age: #{@age}" 
  end 
  def name()
  	@name
  end
  def name=(set_name)
  	@name = set_name
  end
end 
puts "- Creating Jeff Person Object / Instance"
person2 = Person2.new("jeff", 53)
puts person2.name
#puts person2
person2.name = "Warvel"
puts "using Set then new Name instance var = #{person2.name}"


# Getter, Setter - more Convenient   using   : attr_accessor  (both, attr_reader, attr_writer
class PersonNew
	attr_accessor :name, :age
end
puts "- Using attr_accessor"
person3 = PersonNew.new
person3.name = "jeffry"
puts person3.name
person3.age = "this is not a number"; puts person3.age

# to control the Intance Vars in the Object
# Use a CONSTRUCTOR
# Using "self" - when inside method, refers to the object
#   when outside the Instance method, self refers to the class itself
puts "- Using self within a init method of a class"
class PersonD
  attr_reader :age 			# create the getter methods for age
  attr_accessor :name 		# creates getter, setter for name

  def initialize (name, ageVar) # CONSTRUCTOR 
    @name = name 
    self.age = ageVar 		# call the age= method . "self" is required here. (when inside the method)
    						# if only had "age = ageVar" would only set local var, not the Instance var
    						# self.age is actuall the Method that gets called here
                # amd that method is below.
    #puts "--- setting age: #{age }"  # put calls the age reader method  (this is for debug only)
  end 
  def age= (new_age) 
    @age = new_age unless ( new_age > 120  or new_age < 0 )
  end 
end 
person1 = PersonD.new("Jeff Warvel", 53)
puts "Created Instance object : Name is #{person1.name}  Age is #{person1.age}" # => My age is 13 
newage = 1
puts "Attempting to set Age to:     #{newage}"
person1.age = newage 			# Try to change the age 
puts "Resulting person object.age:  #{person1.age}"


puts "- Using the double pipes"
class PersonE
  attr_reader :age      # create the getter methods for age
  attr_accessor :name     # creates getter, setter for name

  def initialize (name, ageVar) # CONSTRUCTOR 
    @name = name 
    self.age = ageVar     # call the age= method . "self" is required here. (when inside the method)
  end 
  # age setter method
  def age= (new_age) 
    @age ||="n/a"     # Default - use age if set, else use "n/a"
    @age = new_age unless ( new_age > 120  or new_age < 0 )   # put bounds on the age setting
  end 
end 
person1 = PersonE.new("Jeff Warvel",133)
puts "Resulting person object.age:  #{person1.age}"


# --------------------------------------------------------
puts "- CLASS METHODS AND VARIABLES - "
# 3 ways to define the class level methods , variables
class MathFunctions 
  def self.double(var)        # 1. Using self  - Class Method
    times_called; var * 2; 
  end 
  class << self           # 2. Using << self - Class Variable 
    def times_called 
      @@times_called ||= 0; @@times_called += 1 
    end 
  end 
end 
def MathFunctions.triple(var)     # 3. Outside of class 
  times_called; var * 3 
end

# No instance created for any of these
puts MathFunctions.double 5     # => 10 
puts MathFunctions.triple(3)    # => 9 
puts MathFunctions.times_called   # => 3 


# ----------------------------------------------------------
# CLASSES
# ----------------------------------------------------------

puts "- CLASS INHERITANCE - "
class Dog 
  def to_s 
    "Dog" 
  end 
  def bark 
    "barks loudly" 
  end 
end 
class SmallDog < Dog 
  def bark # Override 
    "barks quietly" 
  end 
end 

dog = Dog.new # (btw, new is a class method) 
small_dog = SmallDog.new 
puts "#{dog}1 #{dog.bark}" # => Dog1 barks loudly 
puts "#{small_dog}2 #{small_dog.bark}" # => Dog2 barks quietly 


# MIXIN example
puts "- MIXIN / Include - "
module SayMyName 
  attr_accessor :name 
  def print_name 
    puts "Name: #{@name}" 
  end 
end 

class Person 
  include SayMyName 
end 
class Company 
  include SayMyName 
end 

person = Person.new 
person.name = "Joe" 
person.print_name # => Name: Joe 
company = Company.new 
company.name = "Google & Microsoft LLC" 
company.print_name # => Name: Google & Microsoft LLC 



puts "--------------- SCOPE --------------------------"
puts "- Scope inside outside a class "
v1 = "outside"
class MyClass 
  def my_method
    # p v1 EXCEPTION THROWN - no such variable exists
    v1 = "inside"
    p v1
    p local_variables 
    # 
    puts "what is self inside a class "
    p self
  end 
end 

p v1        # => outside
obj = MyClass.new 
obj.my_method     # => inside 
          # => [:v1] 
puts "variables outside class ---"          
p local_variables   # => [:v1, :obj]
p self        # => main


puts "- Using Constants - start with Upper" 
module MyModule 
  MyConstant = 'Outer Constant' 
  class MyClass 
    puts MyConstant # => Outer Constant 
    MyConstant = 'Inner Constant' 
    puts MyConstant # => Inner Constant 
  end
  puts MyConstant # => Outer Constant 
end
  
jeff = MyModule::MyClass.new


puts "- Block scope " 
class BankAccount 
  attr_accessor :id, :amount 
  def initialize(id, amount) 
    @id = id 
    @amount = amount 
  end 
end 

acct1 = BankAccount.new(123, 200) 
acct2 = BankAccount.new(321, 100) 
acct3 = BankAccount.new(421, -100) 
accts = [acct1, acct2, acct3] 

total_sum = 0             # avail outside and inside block scope
accts.each_with_index do |eachAcct, index ; newvar |    # set newvar to have scope only in the block
  total_sum += eachAcct.amount    # total_sum gets inherited to inside this scope
  newvar = 1
  puts " index: #{index} - newvar #{newvar} "
end 
#puts newvar   # => is not in this scope, only local to block
puts total_sum # => 200


# Blocks - Local Scope Example
arr = [5, 4, 1] 
cur_number = 10 
arr.each do |cur_number| 
  some_var = 10 # NOT available outside the block 
  print cur_number.to_s + " " # => 5 4 1 
end 
puts # print a blank line 
puts cur_number # => 10 

adjustment = 5 
arr.each do |cur_number;adjustment| 
  adjustment = 10 
  print "#{cur_number + adjustment} " # => 15 14 11 
end 
puts 
puts adjustment # => 5 (Not affected by the block)




puts "--------------- ACCESS CONTROL --------------------------"    
puts "- Method 'access' is public (default), protected or private"
class MyAlgorithm
  private
    def test1     # first method is private
      "Private"
    end
  def priv1
    "also private"
  end
  # any additional methods are private , until hit another access control keyword
  protected
    def test2     # method test2 is protected
      "Protected"
    end
  public
    def public_again
      "Public"
    end
end

# option 2, define methods, then after that set the Acess Control :methodname
class Another
  def test1
    "Private, as declated later on"
  end
  private :test1
end   

# Understanding Private access
puts "- Understanding Private access"
class Person
  def initialize(age)
    self.age = age # LEGAL - EXCEPTION  -  the exception is the "Setter" for a private method 
          # and can only do this using "self" in the initialize method for this class
    puts my_age
    # puts self.my_age # ILLEGAL  - even Contructor cannot access the private "my_age" method
                       # CANNOT USE self or any other receiver
  end

  private 
    def my_age
      @age
    end
    def age=(age)
      @age = age    # Exception to private is the "setter" for age
    end
end
Person.new(25)      # => 25


puts "--------------- UNIT TESTS --------------------------"    
puts "- Uses Test::Unit and  additional file : Class_test"

#--- this is the Class code
class Calculator
  attr_reader :name
  def initialize(name)
    @name = name
  end
  def add(one, two)
    one - two
  end
  def subtract(one, two)
    one + two
  end
  def divide(one, two)
    one / two
  end
end

#--- file to run unit tests on above class
# ////////////////////////////////////////////////////////////////////
require 'test/unit'   # fixing error with testing - had to update the "test-unit" ruby package : gem install test-unit
require_relative 'calculator'

# This is a class that "extend"s  the Calculator class above. can name this anything
# but the : Test::Unit is what links it to the unit test lib/control (???)

#class CalculatorTest < Minitest::Test
class CalculatorTest < Test::Unit::TestCase
  # this create an instance of the Calculator class and we give it any name
  # this is the prep / setup()  for unit test
  def setup
    @calc = Calculator.new('test')
  end

  # unit test for all  methods
  def test_add
    assert_equal 5, @calc.add(2,3)      # assert that adding 2 and 3 =  5 
  end
  def test_minus
    assert_equal -12, @calc.subtract(23,35)
  end
  def test_divide
    assert_equal -8, @calc.divide(16,-2)
  end

  # special assertion that check for zero in denom - requires latest "test-unit"
  #  assert_raise :  specifies the Exception error you would expect
  #  this code will actually run the divde by Zero and prove that we see / catch the expected error
  def test_divide_by_zero
    assert_raise ZeroDivisionError do 
      @calc.divide(1, 0)
    end
  end

  def teardown
    @calc
  end
end
# ////////////////////////////////////////////////////////////////////


puts "--------------- RSPEC  --------------------------"  
puts " - EXAMPLE in subdir :  rspec-example - " 
puts "   see:   calculator.rb, and calculator_spec.rb  "
puts "          testing the Calculator()  class "

puts " - rspec Matchers - "
